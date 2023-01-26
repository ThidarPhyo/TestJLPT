//
//  Note.swift
//  TestJLPT
//
//  Created by cmStudent on 12/01/2023.
//

import Foundation
import CoreData

@objc(Note)
public class Note: NSManagedObject {

    @NSManaged var id: NSNumber!
    @NSManaged var title: String!
    @NSManaged var desc: String!
    @NSManaged var deletedDate: Date?
}
