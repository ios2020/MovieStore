//
//  TopRatedViewController.swift
//  MovieStore
//
//  Created by Brahmastra on 13/01/20.
//  Copyright © 2020 Brahmastra. All rights reserved.
//

import UIKit

class TopRatedViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    
    
    @IBOutlet weak var TopRatedColletionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopRatedCollectionViewCell", for: indexPath) as! TopRatedCollectionViewCell
        
        return cell
    }
    

}
