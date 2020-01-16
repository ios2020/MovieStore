//
//  NowPlayingViewController.swift
//  MovieStore
//
//  Created by Brahmastra on 13/01/20.
//  Copyright © 2020 Brahmastra. All rights reserved.
//

import UIKit
import Kingfisher
@available(iOS 13.0, *)
class NowPlayingViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    let curruntDate = Date()
    let formatter = DateFormatter()
    var movies = [MovieInfo]()
    var SelectedindexPath:Int = 0
    @IBOutlet weak var nowPlayingCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        JsonData.shareJson.jsonString(category: "now_playing")
       movies = JsonData.shareJson.movies
        nowPlayingCollectionView.delegate = self
        nowPlayingCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:NowPlayingCollectionViewCell = (nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? NowPlayingCollectionViewCell)!
        let moviesRow = movies[indexPath.row]
        cell.movieName.text = moviesRow.title
        cell.mvDescription.text = moviesRow.overview
        cell.releaseDate.text = moviesRow.release_date
        cell.ratings.text = String(moviesRow.vote_average) + "/10.0"
        cell.mvImage.kf.indicatorType = .activity
        cell.mvImage.kf.setImage(with: URL(string: JsonData.shareJson.imgbaseURL + moviesRow.poster_path), placeholder: #imageLiteral(resourceName: "placeholder"))
        return cell
    }
    
    //Header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "NowPlayHeaderCell", for: indexPath) as! NowPlayHeaderCell
        SetImageProperty.imageSharedObj.userLogoUI(myImage: header.userImg, mycolor: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1))
        formatter.dateFormat = "EEEE dd MMMM"
        header.dateLabel.text = formatter.string(from: curruntDate).uppercased()
        return header
    }
    
    // Passing Data to DetailView Controller
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("Selected Row: ", indexPath.row)
        SelectedindexPath = indexPath.row
        performSegue(withIdentifier: "DetailViewController", sender: self)
    }
    // LINKED:- above function is linked
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let passData = segue.destination as? DetailViewController {
            let theMovie = movies[SelectedindexPath]
            passData.theDesc = theMovie.overview
            passData.theVoteCount = theMovie.vote_count
            passData.theLanguage = theMovie.original_language
            passData.thePopularity = theMovie.popularity

        }
    }
    
    
    
    
    // Saving data into core data
    func caller()
    {
    
    }
    

}

