//
//  List+CoreDataProperties.swift
//  TestJLPT
//
//  Created by cmStudent on 12/01/2023.
//
//

import Foundation
import CoreData


extension List {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<List> {
        return NSFetchRequest<List>(entityName: "List")
    }

    @NSManaged public var title: String?

}

extension List : Identifiable {

}
