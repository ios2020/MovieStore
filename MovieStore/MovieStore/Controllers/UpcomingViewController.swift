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
    var selectedindexPath:Int = 0
     let myImg = UIImageView()
    var movies = [MovieInfo]()
    override func viewDidLoad() {
        
        super.viewDidLoad()

        JsonData.shareJson.jsonString(category: "upcoming", page: 1)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           selectedindexPath = indexPath.row
         performSegue(withIdentifier: SegueIdenfier.idenfier.upcomingScreen, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if let passData = segue.destination as? DetailViewController {
                   let theMovie = movies[selectedindexPath]
                   passData.theDesc = theMovie.overview
                   passData.theVoteCount = theMovie.vote_count
                   passData.theLanguage = theMovie.original_language
                   passData.thePopularity = theMovie.popularity
                   passData.theTitle = theMovie.title
                   myImg.kf.indicatorType = .activity
                   myImg.kf.setImage(with: URL(string: JsonData.shareJson.imgbaseURL + theMovie.poster_path), placeholder: #imageLiteral(resourceName: "placeholder"))
                   passData.thePoster = myImg.image
    }
    }
}
