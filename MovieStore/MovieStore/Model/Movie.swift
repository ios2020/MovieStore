//
//  Movies.swift
//  MovieStore
//
//  Created by Brahmastra on 14/01/20.
//  Copyright © 2020 Brahmastra. All rights reserved.
//

import Foundation
struct Movie: Codable
{
    var title:String
    var overview:String
    var release_date:String
    var vote_average:Double
    var poster_path:String
    var id:Int
}


