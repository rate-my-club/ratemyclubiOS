//
//  ViewController.swift
//  ClubFinder
//
//  Created by Sunil Green on 3/25/19.
//  Copyright © 2019 Sunil Green. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
 
    

    //the json file
    var URL = "https://api.data.gov/ed/collegescorecard/v1/schools.json?&_fields=id,school.name,2016.student.size&2016.student.size__range=2000..&_sort=2016.student.size:desc&_per_page=100&_page=0&api_key=KZIaPo7v03IUNaIG7XrySMfHMVjhvjGTzEfC9qgp"
    
    var pagesURL = [String]()
    
   
    
    var schoolNames = [String]()
    

    @IBOutlet weak var schoolPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        schoolPicker.dataSource = self
        schoolPicker.delegate = self
        
        
        
        var count = 0
        while (count < 21) {
            URL = "https://api.data.gov/ed/collegescorecard/v1/schools.json?&_fields=id,school.name,2016.student.size&2016.student.size__range=2000..&_sort=2016.student.size:desc&_per_page=100&_page=" + String(count) + "&api_key=KZIaPo7v03IUNaIG7XrySMfHMVjhvjGTzEfC9qgp"
            self.pagesURL.append(URL)
            count = count + 1
            
            
        }
        
        
        
        getJSON {
//            print(self.schoolNames)
            self.schoolNames.sort()
            self.schoolPicker.reloadAllComponents()
      
            
            
        }
        
        
        
        
        
        
    }
    
    
    
    func getJSON(completionHandler: @escaping () -> ()) {
       
        for the_url in pagesURL {
            let url = NSURL(string: the_url)
            
            URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
                
                if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                    
                    if let schoolArray = jsonObj!.value(forKey: "results") as? NSArray {
                        for school in schoolArray {
                            if let schoolDict = school as? NSDictionary {
                                if let name = schoolDict.value(forKey: "school.name") {
                                  
                                    self.schoolNames.append(name as? String ?? "noname")
                                    
                                }
                            }
                        }
                    }
                    
//                    OperationQueue.main.addOperation({
//                            
//                            self.schoolPicker.reloadAllComponents()
//
//
//
//
//                    })
                    DispatchQueue.main.async {
                       completionHandler()
                    }
                    
                    //print(jsonObj!.value(forKey: "results") ?? "didn't work")
                    
                    
                    
                }
            }).resume()
        }
      
        
        

}
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //print(schoolNames.count)
        return schoolNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return schoolNames[row]
    }
    
   
    
    

}




