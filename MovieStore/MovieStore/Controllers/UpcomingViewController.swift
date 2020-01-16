//
//  UpcomingViewController.swift
//  MovieStore
//
//  Created by Brahmastra on 13/01/20.
//  Copyright © 2020 Brahmastra. All rights reserved.
//

import UIKit

class UpcomingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    @IBOutlet weak var userLogo: UIImageView!
    var movies = [MovieInfo]()
    override func viewDidLoad() {
        super.viewDidLoad()

                JsonData.shareJson.jsonString(category: "upcoming")
                movies = JsonData.shareJson.movies
                SetImageProperty.imageSharedObj.userLogoUI(myImage: userLogo, mycolor: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1))
    }
    


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "UpcomingMovieCell", for: indexPath) as! UpcomingMovieCell
            let moviesRow = movies[indexPath.row]
           cell.title.text = moviesRow.title
           cell.popularity.text = "Popularity: " + String(moviesRow.popularity)
           cell.releaeDate.text = "Release Date: " + moviesRow.release_date
           cell.voteCount.text = "Vote Count: " + String(moviesRow.vote_count)
           cell.poster.kf.setImage(with: URL(string: JsonData.shareJson.imgbaseURL + moviesRow.poster_path), placeholder: #imageLiteral(resourceName: "placeholder"))
           
           return cell
       }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 91.5
        
    }
}
