//
//  ViewModelIntegrationTests.swift
//  DogMinderTests
//
//  Created by Adrian Iraizos Mendoza on 9/1/24.
//

import XCTest

@testable import DogMinder
final class ViewModelIntegrationTests: XCTestCase {
    var sut: ViewModel!
    let testNote = TestNote()
    
    override func setUpWithError() throws {
        sut = .previewViewModel
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testCreateNoteSimple() throws {
        let type = ReminderType.event
        let title = "Title"
        let date = Date.dateTest
        let comments = "Comments"
        let amount = "60.0"
        let event = EventType.accident
        let bodyPart = PetSize.chest
        
        XCTAssertEqual(sut.notes.count, 0)
        sut.saveNote(type: type, title: title, date: date, comments: comments, amount: amount, event: event, bodyPart: bodyPart)
        
        let sutNote = try XCTUnwrap(sut.notes.first)
        XCTAssertEqual(sut.notes.count, 1)
        XCTAssertEqual(sutNote.type, .event)
        XCTAssertEqual(sutNote.title, title)
        XCTAssertEqual(sutNote.date, date)
        XCTAssertEqual(sutNote.comments, comments)
        XCTAssertEqual(sutNote.value,0)
        XCTAssertEqual(sutNote.event, event)
    
        XCTAssertNil(sutNote.measure)

    }
    
    func testFetchAllNotes() throws {
        XCTAssertEqual(sut.notes.count, 0)
        
        sut.saveNote(type: testNote.type, title: testNote.title, date: testNote.date, comments: testNote.comments, amount: testNote.amount, event: testNote.eventType, bodyPart: testNote.bodyPart)
        sut.saveNote(type: testNote.type, title: testNote.title, date: testNote.date, comments: testNote.comments, amount: testNote.amount, event: testNote.eventType, bodyPart: testNote.bodyPart)
        sut.saveNote(type: testNote.type, title: testNote.title, date: testNote.date, comments: testNote.comments, amount: testNote.amount, event: testNote.eventType, bodyPart: testNote.bodyPart)
        
        XCTAssertEqual(sut.notes.count, 3)
        
    }

}
