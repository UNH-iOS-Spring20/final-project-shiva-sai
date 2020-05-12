//
//  Blue_BookTests.swift
//  Blue BookTests
//
//  Created by Shiva Kommareddy on 2/19/20.
//  Copyright © 2020 Shiva Kommareddy. All rights reserved.
//

import XCTest
@testable import Blue_Book

class Blue_BookTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    //To check if question object is not null.
  
    //To check if question object is null.
    func testQuestionandAnswerInitSuccess(){
        let questions =  RootModel.init(id :"001",
            data: [
            "category":"Entertainment",
            "correct_answer":"2011",
            "difficulty" :"Easy",
            "incorrect_answers_1":"2009",
            "incorrect_answers_2":"2010",
            "incorrect_answers_3":"2012",
            "question": "What year did Game of Thrones start?"
    ]
    )
    XCTAssertNotNil(questions)
    }
    
   func testUsersinitSuccess(){
       let userdata = User.init(id :"001",
           data: [
           "email":"sk8@gmail.com",
            "firstname":"shiva",
            "lastname" :"kommareddy",
            "password" :"123456"
   ]
   )
   XCTAssertNotNil(userdata)
    }
    
    func testQuestionandAnswerInitFailure(){
        let questions =  RootModel.init(id :"001",
            data: [
            "category":"Entertainment",
            "correct_answer":"2011",
            "incorrect_answers_1":"2009",
            "incorrect_answers_2":"2010",
            "incorrect_answers_3":"2012",
            "question": "What year did Game of Thrones start?"
    ]
    )
    XCTAssertNil(questions)
}
    func testUsersinitFailure(){
        let userdata = User.init(id :"001",
            data: [
             "firstname":"shiva",
             "lastname" :"kommareddy",
             "password" :"123456"
    ]
    )
    XCTAssertNil(userdata)
     }
    
   
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}


 /*
 func testQuestionandAnswerInitFailure(){
        let  firstQuestionandAnswer = QuestionandAnswer.init( "What is Capital of Connecticut?", "" )
        XCTAssertNil(firstQuestionandAnswer)
    }
    //It checks if questions are added to the level.
    func testQuestionandAnswerInitFailure1(){
            let  firstQuestionandAnswer = QuestionandAnswer.init( "What is Capital of Connecticut?", "Hartford" )
            let itemList = Level.init()
            XCTAssertEqual(0, itemList.qanda.count )
           itemList.additem(q: firstQuestionandAnswer!)
            XCTAssertEqual(1, itemList.qanda.count )
       }
    // It checks the getResults function in level class is working or not.
    func testCorrectAnswers(){
        let  firstQuestionandAnswer1 = QuestionandAnswer.init( "What is Capital of Connecticut?", "Hartford" )
             let  firstQuestionandAnswer2 = QuestionandAnswer.init( "what is the sum of 11+24?", "35" )
             let  firstQuestionandAnswer3 = QuestionandAnswer.init( "What is CEO of apple ", "Tim cook" )
              let  firstQuestionandAnswer4 = QuestionandAnswer.init( "Who is the actor of Titanic", "Leonardo Di Caprio" )
              let  firstQuestionandAnswer5 = QuestionandAnswer.init( "What is Captain of Indian Cricket team?", "Virat Kohli" )
         let itemList = Level.init()
         itemList.additem(q: firstQuestionandAnswer1!)
        itemList.additem(q: firstQuestionandAnswer2!)
        itemList.additem(q: firstQuestionandAnswer3!)
        itemList.additem(q: firstQuestionandAnswer4!)
        itemList.additem(q: firstQuestionandAnswer5!)
    
        itemList.getCorrect(answer: "Hartford", questionNumber: 0)
        itemList.getCorrect(answer: "35", questionNumber: 1)
        itemList.getCorrect(answer: "Tim cook", questionNumber: 2)
        itemList.getCorrect(answer: "Leonardo Di Caprio", questionNumber: 3)
        itemList.getCorrect(answer: "Hartford", questionNumber: 4)
        XCTAssertEqual(4, itemList.getResults() )
    }
 */
