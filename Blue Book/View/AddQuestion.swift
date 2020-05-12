//
//  AddQuestion.swift
//  Blue Book
//
//  Created by Shiva Kommareddy on 5/6/20.
//  Copyright © 2020 Shiva Kommareddy. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

let questionCollection = Firestore.firestore().collection("Questions")

struct AddQuestion: View {
    @ObservedObject var viewRouter: ViewRouter
    @State var category: String = ""
    @State var difficulty: String = ""
    @State var question: String = ""
    @State var correct_answer: String = ""
    @State var incorrect_answers_1 : String = ""
    @State var incorrect_answers_2 : String = ""
    @State var incorrect_answers_3 : String = ""
   
    var body: some View {
        VStack(alignment: .center,spacing: 10){
            Text("Questions")
            TextField("Category", text:$category).padding(10).cornerRadius(4.0).border(Color.blue).frame(width: 350)
                                .autocapitalization(.none)
            TextField("Difficulty", text:$difficulty).padding(10).cornerRadius(4.0).border(Color.blue).frame(width: 350)
                                           .autocapitalization(.none)
            TextField("Your Question",text:$question).padding(10).cornerRadius(4.0).border(Color.blue).frame(width: 350)
                                                   .autocapitalization(.none)
                
            TextField("Correct Answer", text:$correct_answer).padding(10).cornerRadius(4.0).border(Color.blue).frame(width: 350)
                                           .autocapitalization(.none)
            TextField("Incorrect Answer 1",text:$incorrect_answers_1).padding(10).cornerRadius(4.0).border(Color.blue).frame(width: 350)
                                           .autocapitalization(.none)
            TextField("Incorrect Answer 2",text:$incorrect_answers_2).padding(10).cornerRadius(4.0).border(Color.blue).frame(width: 350)
                                               .autocapitalization(.none)
            TextField("Incorrect Answer 3",text:$incorrect_answers_3).padding(10).cornerRadius(4.0).border(Color.blue).frame(width: 350)
                                                   .autocapitalization(.none)
        Button(action: QuestionAdd){
            HStack(alignment: .center){
                Spacer()
                Text("Add Question").foregroundColor(Color.black).bold()
            }
        }.padding().background(Color.blue).cornerRadius(4.0).frame(width: 150)
        Button(action: self.noMethod){
            HStack(alignment: .center){
                Spacer()
                Text("Back").foregroundColor(Color.black).bold()
            }
        }.padding().background(Color.blue).cornerRadius(4.0).frame(width: 90)
        }
    }
    func noMethod(){
            self.viewRouter.currentPage = "page10"
    }
    func addQuestion(){
        print("Question Printed Succesfully")
    }
    func QuestionAdd(){
        let category: String = $category.wrappedValue
        let difficulty: String = $difficulty.wrappedValue
        let question: String = $question.wrappedValue
        let correct_answer: String = $correct_answer.wrappedValue
        let incorrect_answers_1: String = $incorrect_answers_1.wrappedValue
        let incorrect_answers_2 : String = $incorrect_answers_2.wrappedValue
        let incorrect_answers_3: String = $incorrect_answers_3.wrappedValue
        // Logic to add  question
        
        let data = ["category": category, "difficulty": difficulty, "question": question, "correct_answer": correct_answer, "incorrect_answers_1" : incorrect_answers_1, "incorrect_answers_2" : incorrect_answers_2, "incorrect_answers_3" : incorrect_answers_3] as [String: Any]
        questionCollection.addDocument(data: data)
        self.category = ""
        self.difficulty = ""
        self.question = ""
        self.correct_answer = ""
        self.incorrect_answers_1 = ""
        self.incorrect_answers_2 = ""
        self.incorrect_answers_3 = ""
    }
}


struct AddQuestion_Previews: PreviewProvider {
    static var previews: some View {
        AddQuestion(viewRouter: ViewRouter())
    }
}
