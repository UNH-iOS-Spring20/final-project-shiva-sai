//
//  QuestionView.swift
//  Blue Book
//
//  Created by Shiva Kommareddy on 4/18/20.
//  Copyright © 2020 Shiva Kommareddy. All rights reserved.
//

/*
import SwiftUI
import Foundation
import UIKit
import FirebaseFirestore

struct QuestionView: View {
    
   /* @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var levelRoute: LevelRouteController = LevelRouteController.getLeveType()*/
    @EnvironmentObject var util: Util
   @State var score: Int = 0
   @State var ans: String = ""
    @State var error: String = ""
    @State var questions: [Questions] = []
    
    
    @State var index : Int = 0
    
   
    var body: some View {
      /*  VStack   {
        /*Text(Entertainment.ent.callFirebasedb(type: "video games", Val: "easy").question + "\n"+Entertainment.ent.callFirebasedb(type: "video games", Val: "easy").correct_answer+"\n"+Entertainment.ent.callFirebasedb(type: "video games", Val: "easy").incorrect_answers[0])*/
       
        
            
           Button(
                action: {self.getQuestions()}, label:{Text("START")}
            )
            
            
            //Text(String(score))
            Text("Category :"+util.cat_type)
            Text("Level :"+util.val)
            Text(questions.isEmpty ? "" : questions[index].question)
            Button(
                action: {self.Correct(ans: self.questions.isEmpty ? "" : self.questions[self.index].incorrect_answers[0])}, label:{Text(questions.isEmpty ? "" : questions[index].incorrect_answers[0])}
                   )
            Button(
                action: {self.Correct(ans: self.questions.isEmpty ? "" : self.questions[self.index].incorrect_answers[1])}, label:{Text(questions.isEmpty ? "" : questions[index].incorrect_answers[1])}
                              )
            /*Button(
                action: {self.Correct(ans: self.questions.isEmpty ? "" : self.questions[self.index].incorrect_answers[2])}, label:{Text(questions.isEmpty ? "" : questions[index].incorrect_answers[2])}
            )
            Button(
                action: {self.Correct(ans: self.questions.isEmpty ? "" : self.questions[self.index].correct_answer)}, label:{Text(questions.isEmpty ? "" : questions[index].correct_answer)}
            )
            */
            Button(
                          action: {self.Correct(ans: "A")}, label:{Text("A")}
                      )
           
            Button(
                action: {self.Correct(ans: "B")}, label:{Text("B")}
            )
           
           Text(String(score))
            Text(error)
            //Text(self.levelRoute.levelRoute.cat_type)
    }

    }
    func Correct(ans: String){
        //var ans: String = ""
        error = ""
        print(ans)
        //if ans == questions[index].correct_answer{
        if ans == "A"{
            score+=1
        }
        else{
            error = "wrong answer"
        }
    }
    func getQuestions(){
        if util.topic == "Entertainment" {
            questions = questions.isEmpty ? Entertainment.ent.callFirebasedb(type: util.cat_type, Val: util.val) : questions
        }
        else if util.topic == "Sports" {
            questions = questions.isEmpty ? Sports.ent.callFirebasedb(type: util.cat_type, Val: util.val) : questions
        }
        else if util.topic == "Politics" {
            questions = questions.isEmpty ? Politics.ent.callFirebasedb(type: util.cat_type, Val: util.val) : questions
        }
        else if util.topic == "Science" {
            questions = questions.isEmpty ? Science.ent.callFirebasedb(type: util.cat_type, Val: util.val) : questions
        }

        if index < 10{
            index += 1
        }
        else{
        index = 0
        }*/
     
           )
    }
    
   /* init() {
        util.questions = util.questions.isEmpty ? Entertainment.ent.callFirebasedb(type: util.cat_type, Val: util.val) : util.questions
    }*/
    
}



struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}

*/
