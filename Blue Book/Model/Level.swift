//
//  Level.swift
//  Blue Book
//
//  Created by Shiva Kommareddy on 2/19/20.
//  Copyright © 2020 Shiva Kommareddy. All rights reserved.
//

class Level{
    var qanda = [QuestionandAnswer]()
    var results  = 0
    var numOfQuestions = 0
    func additem(q: QuestionandAnswer){
        qanda.append(q)
    }
    
    func getCorrect(answer: String, questionNumber: Int){
        if(qanda[questionNumber].answer == answer){
            results+=1
        }
    }
    
    func getResults() -> Int {
        return results;
    }
}

