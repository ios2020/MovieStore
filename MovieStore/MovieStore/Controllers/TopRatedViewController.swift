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
    
    @IBOutlet weak var userLogo: UIImageView!
    var movies = [MovieInfo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userLogoUI()
        
    
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
    func userLogoUI(){
        let fillImage = userLogo.image?.withRenderingMode(.alwaysTemplate)
        userLogo.image = fillImage
        userLogo.tintColor = #colorLiteral(red: 0, green: 0.4871559739, blue: 0.8467766643, alpha: 1)
    }
    
}
