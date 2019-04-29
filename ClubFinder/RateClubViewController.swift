//
//  RateClubViewController.swift
//  ClubFinder
//
//  Created by Sunil Green on 4/21/19.
//  Copyright © 2019 Sunil Green. All rights reserved.
//

import UIKit
import Alamofire

class RateClubViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    
    //get these values
    var userName: String = "SunilGreen"
    var schoolName: String = ""
    
    
    var clubName: String = ""
    var rating: Double = 7.0
    var comment: String = ""
    
    var reviewsArr: [String] = []
    var ratingsArr: [Double] = []
    
    var club: Club = Club(school: "", name: "", description: "", image_url: "", username: [], reviews: [], ratings: [])
    
    
    var validInput: Bool = false
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet var ratingTextField: UITextField!
    @IBOutlet var commentTextField: UITextField!
    @IBOutlet var clubTitle: UILabel!
    @IBOutlet var errorText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clubTitle.text = "Rate: " + clubName
        clubTitle.sizeToFit()
        ratingTextField.delegate = self
        commentTextField.delegate = self
        tableview.delegate = self
        tableview.dataSource = self
        tableview.reloadData()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField.isEqual(ratingTextField)) {
            let allowedChars = ".1234567890"
            let allowedCharSet = CharacterSet(charactersIn: allowedChars)
            let typedCharSet = CharacterSet(charactersIn: string)
            
            if (allowedCharSet.isSuperset(of: typedCharSet)) {
                let inputStr = textField.text?.appendingFormat(string)
                let inputDouble = Double(inputStr!)!
                if (inputDouble >= 0.0 && inputDouble <= 5.0) {
                    print("success")
                    print(inputDouble)
                    print(validInput)
                    validInput = true
                    return true
                } else {
                    validInput = false
                    
                }
            } else {
                validInput = false
                return false
            }
            
            
            
        }
        
        return true
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func submitData(_ sender: Any) {
        if (validInput) {
            errorText.text = ""
            validInput = false
            //let url = URL(string: "http://localhost:3000/addrating")
            let parameters: [String: Any] = [
                "school": club.school,
                "name": clubName ,
                "username": userName,
                "review": commentTextField.text!,
                "rating": ratingTextField.text!
            ]
            
            
            Alamofire.request("http://localhost:3000/addrating", method: .post, parameters: parameters, encoding: JSONEncoding.default)
                .responseJSON { response in
            }
            
            
            self.performSegue(withIdentifier: "validRatingBackToMain", sender: nil)
            
        } else {
            
            errorText.text = "Enter a number between 0 and 5"
        }
        
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backToMain" || segue.identifier == "validRatingBackToMain" {
            print("going back to main school name should be: ")
           
            guard let tabbar = segue.destination as? MainTabBarViewController
                else {return}
            tabbar.school = schoolName
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return club.ratings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RateClubCell") as! RateClubTableViewCell
    
        print(club.reviews[indexPath.row])
        print(club.ratings[indexPath.row])
        
        
        //print(self.reviewsArr[indexPath.section])
        cell.ratingText.text = "Rating: \(club.ratings[indexPath.row])"
        cell.descriptionLabel.text = "Comment: \(club.reviews[indexPath.row])"
        
        return cell
    }
    
    
    
    
}
