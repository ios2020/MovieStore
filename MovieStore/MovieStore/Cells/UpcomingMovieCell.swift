
//
//  UpcomingMovieCell.swift
//  MovieStore
//
//  Created by Brahmastra on 16/01/20.
//  Copyright © 2020 Brahmastra. All rights reserved.
//

import UIKit

class UpcomingMovieCell: UITableViewCell {

   @IBOutlet weak var title: UILabel!
      @IBOutlet weak var releaeDate: UILabel!
      @IBOutlet weak var popularity: UILabel!
      @IBOutlet weak var voteCount: UILabel!
      @IBOutlet weak var poster: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
