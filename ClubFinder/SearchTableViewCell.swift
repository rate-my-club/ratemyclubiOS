//
//  SearchTableViewCell.swift
//  ClubFinder
//
//  Created by Sunil Green on 3/31/19.
//  Copyright © 2019 Sunil Green. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var clubName: UILabel!
    @IBOutlet weak var clubDescription: UILabel!
    @IBOutlet weak var avg_rating: UILabel!
    @IBOutlet weak var clubImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
       
    }

}
