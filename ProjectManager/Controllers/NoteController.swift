//
//  NoteController.swift
//  ProjectManager
//
//  Created by conner on 8/20/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

import Foundation

class NoteController {
    var notes: [Note] = []

    var count: Int {
        notes.count
    }
    
    func addNote(_ note: Note) {
        notes.append(note)
    }
    
    func removeNoteAtIndex(_ index: Int) {
        notes.remove(at: index)
    }
    
    func noteAtIndex(_ index: Int) -> Note {
        notes[index]
    }
    
}
