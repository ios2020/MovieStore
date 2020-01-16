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
    override func awakeFromNib() {
              self.delegate = self
              self.dataSource = self
           JsonData.shareJson.jsonString(category: "popular")
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
