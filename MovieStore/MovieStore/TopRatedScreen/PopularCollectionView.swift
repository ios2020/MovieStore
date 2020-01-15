//
//  PopularCollectionView.swift
//  MovieStore
//
//  Created by Brahmastra on 15/01/20.
//  Copyright © 2020 Brahmastra. All rights reserved.
//

import UIKit

class PopularCollectionView: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource {
   
    override func awakeFromNib() {
              self.delegate = self
              self.dataSource = self
           
           
          }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCollectionCell", for: indexPath) as! PopularCollectionCell
        return cell
    }
    

    
    
    
    
}
