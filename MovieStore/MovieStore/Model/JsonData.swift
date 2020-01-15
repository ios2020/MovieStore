//
//  JsonData.swift
//  MovieStore
//
//  Created by Brahmastra on 14/01/20.
//  Copyright © 2020 Brahmastra. All rights reserved.
//

import Foundation
import UIKit


public class JsonData {
    static let shareJson = JsonData()
    var movies = [MovieInfo]()
    let imgbaseURL = "https://image.tmdb.org/t/p/w200"
    func jsonString( category: String) {
       // let catergory = "now_playing"
        let key = "?api_key=60af9fe8e3245c53ad9c4c0af82d56d6&language=en-US&page=1"
        let urlString = "https://api.themoviedb.org/3/movie/" + category + key
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url){
                parsJson(json: data)
                
            }
        }
    }
    
    
    func parsJson(json: Data) {
        let decoder =  JSONDecoder()
        if let jsonMovies = try? decoder.decode(MoviesModel.self, from: json){
            movies = jsonMovies.results
        }
       
    }
    
}
