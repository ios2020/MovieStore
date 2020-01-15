//
//  MainTableViewCell.swift
//  MovieStore
//
//  Created by Brahmastra on 15/01/20.
//  Copyright © 2020 Brahmastra. All rights reserved.
//
// This is My feature cell

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var topCollectioView: MovieScrollCollection!
    static let shareObj = MainTableViewCell()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        topCollectioView.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
