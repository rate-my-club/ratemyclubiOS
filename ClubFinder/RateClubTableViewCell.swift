//
//  RateClubTableViewCell.swift
//  ClubFinder
//
//  Created by Sunil Green on 4/24/19.
//  Copyright © 2019 Sunil Green. All rights reserved.
//

import UIKit

class RateClubTableViewCell: UITableViewCell {

    @IBOutlet weak var ratingText: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
