//
//  TopClubCellTableViewCell.swift
//  ClubFinder
//
//  Created by Sunil Green on 4/24/19.
//  Copyright © 2019 Sunil Green. All rights reserved.
//

import UIKit

class TopClubCellTableViewCell: UITableViewCell {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var clubName: UILabel!
    @IBOutlet weak var clubRating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
