//
//  MovieScrollCollection.swift
//  MovieStore
//
//  Created by Brahmastra on 15/01/20.
//  Copyright © 2020 Brahmastra. All rights reserved.
//

import UIKit

class MovieScrollCollection: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource  {
    
    let topCollectionView = MainTableViewCell.shareObj.topCollectioView
       var movies = [MovieInfo]()
     override func awakeFromNib() {
           self.delegate = self
           self.dataSource = self
        JsonData.shareJson.jsonString(category: "top_rated")
        movies = JsonData.shareJson.movies
      
        
       }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieScrollCollectionCell", for: indexPath) as! MovieScrollCollectionCell
         let moviesRow = movies[indexPath.row]
            cell.title.text = moviesRow.title
            cell.popularity.text = "Popularity: " + String(moviesRow.popularity)
            cell.desc.text = moviesRow.overview
            cell.vote_Count.text = "Vote Count: " + String(moviesRow.vote_count)
            cell.voteAve.text = "Vote Average" + String(moviesRow.vote_average)
            cell.poster.kf.setImage(with: URL(string: JsonData.shareJson.imgbaseURL + moviesRow.poster_path), placeholder: #imageLiteral(resourceName: "placeholder"))
            
        return cell
    }
    
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//
//        let layout  = self.topCollectionView?.collectionViewLayout as! UICollectionViewFlowLayout
//        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
//        var offset  = targetContentOffset.pointee
//        let index = (offset.x + scrollView.contentInset.left) / (cellWidthIncludingSpacing)
//        let roundIndex = round(index)
//        offset = CGPoint(x: roundIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: scrollView.contentInset.top)
//        targetContentOffset.pointee = offset
//    }
    

}
