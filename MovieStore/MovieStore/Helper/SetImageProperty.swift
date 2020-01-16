//
//  File.swift
//  MovieStore
//
//  Created by Brahmastra on 16/01/20.
//  Copyright © 2020 Brahmastra. All rights reserved.
//

import Foundation
import UIKit
class SetImageProperty{
    static let imageSharedObj = SetImageProperty()
    
    func userLogoUI(myImage: UIImageView, mycolor:UIColor){
        let fillImage = myImage.image?.withRenderingMode(.alwaysTemplate)
        myImage.image = fillImage
        myImage.tintColor = mycolor
    }

}
