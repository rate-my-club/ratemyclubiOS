//
//  ViewController.swift
//  ClubFinder
//
//  Created by Sunil Green on 3/25/19.
//  Copyright © 2019 Sunil Green. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //the json file
    var URL = "https://api.data.gov/ed/collegescorecard/v1/schools.json?&_fields=id,school.name,2016.student.size&2016.student.size__range=2000..&_sort=2016.student.size:desc&_per_page=100&_page=0&api_key=KZIaPo7v03IUNaIG7XrySMfHMVjhvjGTzEfC9qgp"
    
    var pagesURL = [String]()
    
   
    
    var schoolNames = [String]()
    
    @IBOutlet weak var labelTest: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var count = 0
        self.pagesURL.append(URL)
        while (count < 23) {
            URL = "https://api.data.gov/ed/collegescorecard/v1/schools.json?&_fields=id,school.name,2016.student.size&2016.student.size__range=2000..&_sort=2016.student.size:desc&_per_page=100&_page=" + (count as? String ?? "0") + "&api_key=KZIaPo7v03IUNaIG7XrySMfHMVjhvjGTzEfC9qgp"
            count = count + 1
            print("here")
            
        }
        
        
        
        getJSON {
            print(self.schoolNames)
        }
        
        
        
    }
    
    
    
    func getJSON(completionHandler: @escaping () -> ()) {
        //print("Here")
        
        let url = NSURL(string: URL)
        
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
        if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
            
            if let schoolArray = jsonObj!.value(forKey: "results") as? NSArray {
                for school in schoolArray {
                    if let schoolDict = school as? NSDictionary {
                        if let name = schoolDict.value(forKey: "school.name") {
                            //print(name)
                            self.schoolNames.append(name as? String ?? "noname")
                        
                        }
                    }
                }
            }
            completionHandler()
            //print(jsonObj!.value(forKey: "results") ?? "didn't work")
            
            
            
        }
    }).resume()
        
        

}
    
    func tryJSONAgain() {
        
    }


}




