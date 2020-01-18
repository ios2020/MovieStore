//
//  DetailViewController.swift
//  MovieStore
//
//  Created by Brahmastra on 16/01/20.
//  Copyright © 2020 Brahmastra. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {
    @IBOutlet weak var cancelButtonLogo: UIButton!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var voteCount: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var tittle: UILabel!
    
    var thePoster:UIImage!
    var theLanguage:String!
    var thePopularity:Double!
    var theVoteCount:Int!
    var theDesc:String!
    var theTitle:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetImageProperty.imageSharedObj.userLogoUI(myImage: cancelButtonLogo.imageView!, mycolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        
        poster.image = thePoster
        tittle.text = theTitle
        language.text = "Language: " + theLanguage
        popularity.text = "Popularity: " + String(thePopularity) + "%"
        voteCount.text =  "Vote Count: " + String(theVoteCount)
        desc.text = theDesc
        
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        SetImageProperty.imageSharedObj.userLogoUI(myImage: cancelButtonLogo.imageView!, mycolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        SetImageProperty.imageSharedObj.userLogoUI(myImage: cancelButtonLogo.imageView!, mycolor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    }
    
}
