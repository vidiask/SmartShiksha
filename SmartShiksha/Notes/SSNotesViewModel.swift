//
//  SSNotesViewModel.swift
//  SmartShiksha
//
//  Created by Vikas Pandey on 11/05/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit

class SSNotesViewModel: NSObject {
    var subjects = [NotesSubject](){
        didSet{
            setSelectedSubject(subject: selectedSubject)
        }
    }
    var selectedSubject: NotesSubject?
    let dbManager = DatabaseManager()

    override init() {
        super.init()
        subjects = getAllSubjectsFromDB()
    }

    @discardableResult
    func getAllSubjectsFromDB() -> [NotesSubject] {
        subjects = dbManager.fetchSubject()
        return subjects
    }

    func addSubjectToDB(title:String) -> Void {
        dbManager.addSubject(title: title)
        getAllSubjectsFromDB()
    }

    func addNotesToSubject(title:String) -> Void {
        if let subject = selectedSubject{
            dbManager.addNote(subject: subject, desc: title)
        }
    }

    func setSelectedSubject(subject:NotesSubject?) -> Void {
        if selectedSubject == nil{
            selectedSubject = getSubject(index: 0)
        }else{
            selectedSubject = subject
        }
    }

    func subjectCount() -> Int {
        return subjects.count
    }

    func getSubject(index:Int) -> NotesSubject? {
        if index < 0 || index >= subjects.count{
            return nil
        }else{
            return subjects[index]
        }
    }

    func notesCount() -> Int {
        if let notes = selectedSubject?.notes{
            return notes.count == 0 ? 1 : notes.count + 1
        }
        return 1
    }

    func getNotes(index:Int) -> Note? {
        if let notes = selectedSubject?.notes{
            if index < 0 || index >= notes.allObjects.count{
                return nil
            }else{
                return notes.allObjects[index] as? Note
            }
        }
        return nil
    }

}
