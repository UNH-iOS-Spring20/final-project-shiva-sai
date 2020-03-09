//
//  QuestionandAnswer.swift
//  Blue Book
//
//  Created by Shiva Kommareddy on 2/19/20.
//  Copyright © 2020 Shiva Kommareddy. All rights reserved.
//
class QuestionandAnswer{
    var qid: Int
    var question:String
    var answer: String
    init?(_ question: String,_ answer: String, qid: Int){
        if question.isEmpty || answer.isEmpty{
            return nil;
        }
        self.question = question
        self.answer = answer
        self.qid = qid
        
    }
    
}
