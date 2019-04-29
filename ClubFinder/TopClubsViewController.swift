//
//  TopClubsViewController.swift
//  ClubFinder
//
//  Created by Sunil Green on 4/24/19.
//  Copyright © 2019 Sunil Green. All rights reserved.
//

import UIKit

class TopClubsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var tableview: UITableView!
    var num_cells: Int = 0
    var clubs: [[String: Any]] = []
    var schoolClubs: [[String: Any]] = []
    //var filteredSchoolClubs: [[String: Any]] = []
    let searchController = UISearchController(searchResultsController: nil)
    
    var schoolClubsClass = [Club]()
    var filterSchoolClubsClass = [Club]()
    
    var sortedSchools = [SecondClub]()
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        getJSON()
        tableview.reloadData()
        
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func getJSON() {
        //print("getting JSON")
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
        
        for club in self.filterSchoolClubsClass {
            var avg_rating_arr = club.ratings
            var avg_rating_num = 0.0
            var total_num = 0.0
            for num in avg_rating_arr {
                total_num = total_num + num
            }
        
            var clubAvg = SecondClub(school: club.school!, name: club.name!, description: club.description!, image_url: club.image_url!, username: club.username, reviews: club.reviews, ratings: club.ratings, avg_rating: avg_rating_num)
            
            self.sortedSchools.append(clubAvg)
            
            
        }
        
        self.sortedSchools.sorted(by: {$0.avg_rating > $1.avg_rating})
       
        
        
        
        self.tableview.reloadData()
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if sortedSchools.count < 20 {
            return sortedSchools.count
        } else  {
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell") as! SearchTableViewCell
        cell.clubName.text = sortedSchools[indexPath.section].name
        cell.clubDescription.text = sortedSchools[indexPath.section].description
        cell.avg_rating.text = String(sortedSchools[indexPath.section].avg_rating)
        
        if (sortedSchools[indexPath.section].image_url != "") {
            let url = URL(string: sortedSchools[indexPath.section].image_url ?? nil!)
            let data = try? Data(contentsOf: (url ?? nil)!)
            
            if data != nil {
                cell.clubImage.image = UIImage(data: data!)
                
            } else {
                let url = URL(string: "https://activities.osu.edu/img/blank-group-640x480.png") ?? nil
                
                let data = try? Data(contentsOf: (url ?? nil)!)
                cell.clubImage.image = UIImage(data: data!)
            }
        } else {
            let url = URL(string: "https://activities.osu.edu/img/blank-group-640x480.png") ?? nil
            
            let data = try? Data(contentsOf: (url ?? nil)!)
            cell.clubImage.image = UIImage(data: data!)
        }
        
        return cell
        
        
    }

}
