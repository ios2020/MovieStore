//
//  MovieStore+CoreDataProperties.swift
//  
//
//  Created by Brahmastra on 14/01/20.
//
//

import Foundation
import CoreData


extension MovieStore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieStore> {
        return NSFetchRequest<MovieStore>(entityName: "MovieStore")
    }

    @NSManaged public var overview: String?
    @NSManaged public var release_date: String?
    @NSManaged public var title: String?
    @NSManaged public var vote_average: String?
    @NSManaged public var id: Int64
    @NSManaged public var popularity: Double
    @NSManaged public var vote_count: Int64
    @NSManaged public var poster_path: String?
    @NSManaged public var original_language: String?

}
