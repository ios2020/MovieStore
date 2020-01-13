//
//  NowPlayingViewController.swift
//  MovieStore
//
//  Created by Brahmastra on 13/01/20.
//  Copyright © 2020 Brahmastra. All rights reserved.
//

import UIKit

class NowPlayingViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    let curruntDate = Date()
    let formatter = DateFormatter()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:NowPlayingCollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? NowPlayingCollectionViewCell)!
           //cell.label.text = "Welcome"
            
            return cell
    }
    
    //Header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "NowPlayHeaderCell", for: indexPath) as! NowPlayHeaderCell
        let fillImage = header.userImg.image?.withRenderingMode(.alwaysTemplate)
        header.userImg.image = fillImage
        header.userImg.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        formatter.dateFormat = "EEEE dd MMMM"
        header.dateLabel.text = formatter.string(from: curruntDate).uppercased()
        return header
    }
    

}
