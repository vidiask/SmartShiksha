//
//  Note+CoreDataProperties.swift
//  SmartShiksha
//
//  Created by Vikas Pandey on 11/05/18.
//  Copyright © 2018 XYZ. All rights reserved.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var mTitleText: String?
    @NSManaged public var mDescriptionText: String?
    @NSManaged public var mCreatedDate: NSDate?
    @NSManaged public var mModifiedDate: NSDate?
    @NSManaged public var subject: NotesSubject?

}
