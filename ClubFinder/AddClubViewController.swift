//
//  AddClubViewController.swift
//  ClubFinder
//
//  Created by Sunil Green on 4/21/19.
//  Copyright © 2019 Sunil Green. All rights reserved.
//

import UIKit
import Alamofire

class AddClubViewController: UIViewController {
    
    var schoolName: String = ""
    var clubName: String = ""
    var clubDescription: String = ""
    var imageURL: String = ""
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var DescriptionTextField: UITextField!
    @IBOutlet weak var imageUrlTextField: UITextField!
    @IBOutlet weak var errorText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backToMain2" || segue.identifier == "validPostBackToMain" || segue.identifier == "unwindToVC1" {
            guard let tabbar = segue.destination as? MainTabBarViewController
                else {return}
            tabbar.school = schoolName
            tabbar.viewDidLoad()
        }
    }
    
    
    @IBAction func onSubmit(_ sender: Any) {
        clubName = nameTextField.text!
        clubDescription = DescriptionTextField.text!
        imageURL = imageUrlTextField.text!
        var validInput: Bool = false
        if (clubName == "") {
            errorText.text = "Enter a club name"
        }
        
        if clubDescription == "" {
            errorText.text = "Enter a club description"
        }
        
        if (clubName != "" && clubDescription != "") {
            validInput = true
        }
        //let url = URL(string: "http://localhost:3000/addclub")
        //let tabBar = self.tabBarController as? MainTabBarViewController
        
        //add checking for tabBar optional
        
        if (validInput) {
            errorText.text = ""
            let parameters : [String: Any] = [
                "name": clubName,
                "description": clubDescription,
                "image_url": imageURL,
                "school": schoolName
            ]
            
            Alamofire.request("http://localhost:3000/addclub", method: .post, parameters: parameters, encoding: JSONEncoding.default)
                .responseJSON { response in
                    //print(response)
            }
            
            self.performSegue(withIdentifier: "validPostBackToMain", sender: nil)
            //self.performSegue(withIdentifier: "backToMain2", sender: self)
        }
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   
 

}
