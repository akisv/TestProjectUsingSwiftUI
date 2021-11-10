//
//  Product+CoreDataProperties.swift
//  VWTestProject
//
//  Created by avavouranakis on 8/11/21.
//
//

import Foundation
import CoreData

extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }
    
    @NSManaged public var id: Int16
    @NSManaged public var name: String
    @NSManaged public var price: String
    @NSManaged public var thumbnail: String
    @NSManaged public var image: String
    @NSManaged public var productDescription: String?
}

extension Product: Identifiable {
}
