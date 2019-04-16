//
//  ProfileViewController.swift
//  ClubFinder
//
//  Created by Sunil Green on 3/31/19.
//  Copyright © 2019 Sunil Green. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var tableview: UITableView!
    
    var num_cells: Int = 0
    var clubs: [[String: Any]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        getJSON()

        // Do any additional setup after loading the view.
    }
    

    func getJSON() {
        let url = URL(string: "http://localhost:3000/clubfinder/clubs")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                if let dataDictionary = try? JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]] {
                    print(dataDictionary)
                    self.clubs = dataDictionary
                    self.num_cells = dataDictionary.count
                    self.tableview.reloadData()
                    
                    
                } else {
                    print("Error")
                    self.num_cells = 0
                }
                
            }
        }
        task.resume()
        
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return num_cells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell") as! SearchTableViewCell
        cell.clubName?.text = self.clubs[indexPath.section]["name"]! as? String
        cell.clubDescription?.text = self.clubs[indexPath.section]["description"]! as? String
        
        cell.avg_rating.text = String(self.clubs[indexPath.section]["avg_rating"] as! Double) + "/5"
       
        
        /*if (self.clubs[indexPath.section]["image_url"] as? String != "") {*/
        
        
        let url = URL(string: "https://activities.osu.edu/img/blank-group-640x480.png") ?? nil
        
        let data = try? Data(contentsOf: (url ?? nil)!)
        cell.clubImage.image = UIImage(data: data!)
        
            
//        } else {
//            print("No image")
//        }
        
         return cell
    }
    
    
    
}
