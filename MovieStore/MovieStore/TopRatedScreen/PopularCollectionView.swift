//
//  PopularCollectionView.swift
//  MovieStore
//
//  Created by Brahmastra on 15/01/20.
//  Copyright © 2020 Brahmastra. All rights reserved.
//

import UIKit

class PopularCollectionView: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource {
     var movies = [MovieInfo]()
    var selectedindexPath:Int = 0
    let myImg = UIImageView()
    override func awakeFromNib() {
              self.delegate = self
              self.dataSource = self
        JsonData.shareJson.jsonString(category: "popular", page: 2)
           movies = JsonData.shareJson.movies
           
          }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCollectionCell", for: indexPath) as! PopularCollectionCell
         let moviesRow = movies[indexPath.row]
        cell.title.text = moviesRow.title
        cell.popularity.text = "Popularity: " + String(moviesRow.popularity)
        cell.releaeDate.text = "Release Date: " + moviesRow.release_date
        cell.voteCount.text = "Vote Count: " + String(moviesRow.vote_count)
        cell.poster.kf.setImage(with: URL(string: JsonData.shareJson.imgbaseURL + moviesRow.poster_path), placeholder: #imageLiteral(resourceName: "placeholder"))
        
        return cell
    }
    

    
    
    
    
}
// NOTE : - This method can not be implemented here

extension TopRatedViewController:UICollectionViewDelegate {
   
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("Selected Row: ", indexPath.row)
        selectedindexPath = indexPath.row
        performSegue(withIdentifier: SegueIdenfier.idenfier.topRateScreen, sender: self)
        
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
