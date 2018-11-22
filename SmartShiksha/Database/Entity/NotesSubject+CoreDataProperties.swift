//
//  NotesSubject+CoreDataProperties.swift
//  SmartShiksha
//
//  Created by Vikas Pandey on 11/05/18.
//  Copyright © 2018 XYZ. All rights reserved.
//
//

import Foundation
import CoreData


extension NotesSubject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NotesSubject> {
        return NSFetchRequest<NotesSubject>(entityName: "NotesSubject")
    }

    @NSManaged public var mSubjectName: String?
    @NSManaged public var mCreatedDate: NSDate?
    @NSManaged public var notes: NSSet?

}

// MARK: Generated accessors for notes
extension NotesSubject {

    @objc(addNotesObject:)
    @NSManaged public func addToNotes(_ value: Note)

    @objc(removeNotesObject:)
    @NSManaged public func removeFromNotes(_ value: Note)

    @objc(addNotes:)
    @NSManaged public func addToNotes(_ values: NSSet)

    @objc(removeNotes:)
    @NSManaged public func removeFromNotes(_ values: NSSet)

}
