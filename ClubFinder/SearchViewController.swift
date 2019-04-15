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
    
<<<<<<< HEAD
=======
    
>>>>>>> d5996022cb9aaa00966b5a2304519a2a67142bae

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
<<<<<<< HEAD
=======
        getJSON()
>>>>>>> d5996022cb9aaa00966b5a2304519a2a67142bae

        // Do any additional setup after loading the view.
    }
    
<<<<<<< HEAD
=======
    func getJSON() {
        let url = URL(string: "https://localhost:27017")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                print(dataDictionary)
                
            }
        }
        task.resume()
        
        
    }
    
>>>>>>> d5996022cb9aaa00966b5a2304519a2a67142bae
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell") as! SearchTableViewCell
           return cell
    }
    
    
    
}
