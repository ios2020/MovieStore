//
//  SearchTablViewCell.swift
//  MovieStore
//
//  Created by Brahmastra on 17/01/20.
//  Copyright © 2020 Brahmastra. All rights reserved.
//

import UIKit

class SearchTablViewCell: UITableViewCell {

    @IBOutlet weak var searchResults: UILabel!
    @IBOutlet weak var searchLogo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        SetImageProperty.imageSharedObj.userLogoUI(myImage: searchLogo, mycolor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
        // Configure the view for the selected state
    }

}
