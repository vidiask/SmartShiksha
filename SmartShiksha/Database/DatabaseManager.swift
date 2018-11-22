//
//  DatabaseManager.swift
//  SmartShiksha
//
//  Created by Vikas Pandey on 11/05/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit
import CoreData

class DatabaseManager: NSObject {
    let context = APP_DEL.persistentContainer.viewContext

    func addSubject(title:String) -> Void {
        let managedObject = NSEntityDescription.insertNewObject(forEntityName: "NotesSubject", into: context) as! NotesSubject
        managedObject.mSubjectName = title
        managedObject.mCreatedDate = NSDate()
        APP_DEL.saveContext()
    }

    func addNote(subject:NotesSubject,desc:String) -> Void {
        let managedObject = NSEntityDescription.insertNewObject(forEntityName: "Note", into: context) as! Note
        managedObject.mTitleText = desc
        managedObject.mDescriptionText = desc
        managedObject.mCreatedDate = NSDate()
        managedObject.mModifiedDate = NSDate()
        managedObject.subject = subject
        if let notes = subject.notes{
            notes.adding(managedObject)
            subject.notes = notes
        }else{
            subject.notes = [managedObject]
        }
        APP_DEL.saveContext()
    }

    func fetchSubject() -> [NotesSubject] {
        let fetchRequest = NSFetchRequest<NotesSubject>(entityName: "NotesSubject") as? NSFetchRequest<NSFetchRequestResult>
        let subjects = try? context.fetch(fetchRequest!) as! [NotesSubject]
        return subjects!
    }
}
