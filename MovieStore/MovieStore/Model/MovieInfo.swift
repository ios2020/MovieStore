//
//  Movies.swift
//  MovieStore
//
//  Created by Brahmastra on 14/01/20.
//  Copyright © 2020 Brahmastra. All rights reserved.
//

import Foundation
struct MovieInfo: Codable
{
    var id:Int
    var vote_count:Int
    var vote_average:Double
    var popularity:Double
    var title:String
    var overview:String
    var release_date:String
    var poster_path:String
    var original_language:String
    var backdrop_path:String
    
}


