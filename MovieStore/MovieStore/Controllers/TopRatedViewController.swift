//
//  TopRatedViewController.swift
//  MovieStore
//
//  Created by Brahmastra on 13/01/20.
//  Copyright © 2020 Brahmastra. All rights reserved.
//

import UIKit

class TopRatedViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var topRatedTableView: UITableView!
    var selectedindexPath:Int = 0
       let myImg = UIImageView()
    @IBOutlet weak var userLogo: UIImageView!
    var movies = [MovieInfo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetImageProperty.imageSharedObj.userLogoUI(myImage: userLogo, mycolor: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1))
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let row = indexPath.row
      if row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
            return  cell

     }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PopularCell", for: indexPath) as! PopularCell
            return  cell
       }
    
    }
    
    
}
