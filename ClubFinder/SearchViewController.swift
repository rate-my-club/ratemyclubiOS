//
//  ProfileViewController.swift
//  ClubFinder
//
//  Created by Sunil Green on 3/31/19.
//  Copyright © 2019 Sunil Green. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
   
    
 
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var searchbar: UISearchBar!
    
    var clubNameToSend: String = ""
    
    var num_cells: Int = 0
    var clubs: [[String: Any]] = []
    var schoolClubs: [[String: Any]] = []
    //var filteredSchoolClubs: [[String: Any]] = []
    let searchController = UISearchController(searchResultsController: nil)
    
    var schoolClubsClass = [Club]()
    var filterSchoolClubsClass = [Club]()
    
    
    var resultsSearchController = UISearchController.self

//    override func viewWillAppear(_ animated: Bool) {
//        self.viewDidLoad()
//    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        getJSON()
        
        self.tableview.reloadData()
        
      
        //print(myclub.name)

    
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search By Club Name"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
       
        searchbar.delegate = self
        
    }
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) {
        print("calling view did load")
        //self.viewDidLoad()
    }
  
    
    
    
    
    

    func getJSON() {
        print("getting JSON in search")
        let tabBar = self.tabBarController as?  MainTabBarViewController
        let url = URL(string: "http://localhost:3000/clubfinder/clubs")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                if let dataDictionary = try? JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]] {
                    //print(dataDictionary)
                    self.clubs = dataDictionary
                   
                   
                   
                    for club in self.clubs {
                        let school = club["school"] as? String
                        if school == tabBar?.school {
                            //print(club["name"] as? String)
                            print("in the loopopopopop")
                            self.schoolClubs.append(club)
                            let localSchool = club["school"] as? String
                            let localName = club["name"] as? String
                            //print(localName)
                            let localDescription = club["description"] as? String
                            let localImage_URL = club["image_url"] as? String
                            let localUserName = club["username"] as? [String]
                            let localReviews = club["reviews"] as? [String]
                            print(localReviews)
                            let localRatings = club["ratings"] as? [Double]
                            
                           
                            
                            var insertClub = Club(school: localSchool!, name: localName!, description: localDescription!, image_url: localImage_URL ?? "", username: localUserName ?? [], reviews: localReviews ?? [], ratings: localRatings ?? [])
                            
                            print(insertClub.reviews)
                            
                            self.schoolClubsClass.append(insertClub)
                            self.filterSchoolClubsClass.append(insertClub)
                            
                            print(self.filterSchoolClubsClass.count)
                            //if (self.filterSchoolClubsClass.count)
                            
                            self.tableview.reloadData()
                            
                            
                            
                        
                            
                        }
                    }
                    

                    
                } else {
                    print("Error")
                    self.num_cells = 0
                }
                
            }
        }
        task.resume()
        
        
        self.tableview.reloadData()
        
        
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       print("number of actual cells")
        print(self.filterSchoolClubsClass.count)
       return self.filterSchoolClubsClass.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("number of cells is: \(filterSchoolClubsClass.count)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell") as! SearchTableViewCell

        
        cell.clubName?.text = self.filterSchoolClubsClass[indexPath.section].name
        cell.clubDescription?.text = self.filterSchoolClubsClass[indexPath.section].description
        
        
       
        //fixing the average rating for a club based on # of entries
        
        //var avg_rating_arr = self.schoolClubs[indexPath.section]["ratings"]! as! [Double]
        var avg_rating_arr = self.filterSchoolClubsClass[indexPath.section].ratings
        var avg_rating_num = 0.0
        var total_num = 0.0
        for num in avg_rating_arr {
            total_num = total_num + num
        }
        
        if (avg_rating_arr.count > 0) {
            avg_rating_num = total_num / Double(avg_rating_arr.count)
        }
        
        
        cell.avg_rating.text = String(format: "%.2f", avg_rating_num) + "/5"
        
       
        
        
        if (self.filterSchoolClubsClass[indexPath.section].image_url as? String != "") {
            //let urlString = self.schoolClubs[indexPath.section]["image_url"] as? String
            
            let urlString = self.filterSchoolClubsClass[indexPath.section].image_url as? String
            
            let url = URL(string: (urlString ?? nil)!)
            let data = try? Data(contentsOf: (url ?? nil)!)
            
            if data != nil
            {
                cell.clubImage.image = UIImage(data: data!)
            } else {
                let url = URL(string: "https://activities.osu.edu/img/blank-group-640x480.png") ?? nil
                
                let data = try? Data(contentsOf: (url ?? nil)!)
                cell.clubImage.image = UIImage(data: data!)
            }
            
            
        }
        else {
             let url = URL(string: "https://activities.osu.edu/img/blank-group-640x480.png") ?? nil
    
            let data = try? Data(contentsOf: (url ?? nil)!)
            cell.clubImage.image = UIImage(data: data!)
        }
    
         return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            self.filterSchoolClubsClass = self.schoolClubsClass
            print("Here is the error")
            print(self.schoolClubsClass.count)
            tableview.reloadData()
            return
        }
            filterSchoolClubsClass = schoolClubsClass.filter({ (club) -> Bool in
                guard let text = searchBar.text else {return false}
                //return (club.name?.contains(text))!
                return (club.name?.lowercased().contains(searchText.lowercased()))!
            })
            tableview.reloadData()
    }

    


    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "rateclub" {
            let indexpaths = self.tableview.indexPathsForSelectedRows!
            let indexpath = indexpaths[0] as NSIndexPath
            let vc = segue.destination as! RateClubViewController
            vc.clubName = (self.schoolClubs[indexpath.section]["name"]! as? String)!
            let tabBar = self.tabBarController as?  MainTabBarViewController
            vc.schoolName = tabBar!.school
            vc.club = filterSchoolClubsClass[indexpath.section]
            
        }
        else if segue.identifier == "addclub" {
            let vc = segue.destination as! AddClubViewController
            let tabBar = self.tabBarController as?  MainTabBarViewController
            vc.schoolName = tabBar!.school
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "rateclub", sender: self)
    }
    
    
    
   
}
