//
//  ContentView.swift
//  Blue Book
//
//  Created by Shiva Kommareddy on 2/19/20.
//  Copyright © 2020 Shiva Kommareddy. All rights reserved.
//

import SwiftUI
import Foundation
import UIKit
import FirebaseFirestore
// Reference to the firebase

let questionCollection2 = Firestore.firestore().collection("Questions")

struct ContentView: View {
    // Logic to get the data
    
    @ObservedObject var viewRouter: ViewRouter
    @EnvironmentObject var util: Util
    @State private var showingAlert = false
    @State var length: Int = 0
    @State var index: Int = 0
    @State var btntxt: String = "Start"
    @State var displayScore: Bool = false;
    @State var options: [String] = []
    @State var score: Int = 0
    @State var alert: String = ""
    @ObservedObject private var questions = FirebaseController<RootModel>(collectionRef: questionCollection2)
    @State  var entertainment1: [RootModel] = []

    var body: some View{
        print(self.util.cat_type)
        print(self.util.val)
        return(
            VStack(alignment: .center,spacing: 100){
                Button(action: {self.BackMethod()}){
                Text("BACK")
                Spacer()
                }
                if !displayScore {
                    if entertainment1.count > 0  && options.count > 0{
                List{
                Text(entertainment1[index].question)
                    Button(
                        action: {self.checkAns(ans: self.options[0])}, label:{Text(options[0])}
                        ).alert(isPresented: $showingAlert){
                            Alert(title: Text(self.alert),
                              message: Text( ""), dismissButton: . default(Text("OK")))
                        }
                    
                    Button(
                        action: {self.checkAns(ans: self.options[1])}, label:{Text(options[1])}
                      )
                    Button(
                        action: {self.checkAns(ans: self.options[2])}, label:{Text(options[2])}
                      )
                    Button(
                      action: {self.checkAns(ans: self.options[3])}, label:{Text(options[3])}
                    )
                    
                }
          Button(
              action: {self.Next()}, label:{Text("Next")}
                )
                    //Text(String(score))
            }
            else{
                Button(
                action: {self.Next()}, label:{Text("Start")}
                    )
                }
        }
                else{
                    Text("Score :"+String(score))
                    Button(
                    action: {self.gotoNextLevel()}, label:{Text("Next level")
                        .alert(isPresented: $showingAlert){
                            Alert(title: Text(self.alert),
                              message: Text( ""), dismissButton: . default(Text("OK")))
                        }
                    }
            )
            }
            }
        )
        
    }

    func BackMethod() {
        self.viewRouter.currentPage = "page3"
    }
    //Function to display Questions based on category and difficulty.
    func Next(){
        if entertainment1.count == 0 {
            print("Index :"+String(index))
         for qa in questions.items{
             if(qa.category == util.cat_type && qa.difficulty == util.val){
                 entertainment1.append(qa)
             }
           }
        }
        
        if index < entertainment1.count-1{
            print("Index :"+String(index))
            
            index += 1
            options = []
            options.append(entertainment1[index].correct_answer)
            options.append(entertainment1[index].incorrect_answers_1)
            options.append(entertainment1[index].incorrect_answers_2)
            options.append(entertainment1[index].incorrect_answers_3)
            options.shuffle()
            
        }
        else{
           displayScore = true
        }
    }
    //Func to select next level from game screen.
    func  gotoNextLevel() {
        if(util.val == "Easy"){
            util.val = "Medium"
            displayScore = false
            entertainment1 = []
            index = 0
            btntxt = "Start"
            self.showingAlert = false
            Text( "Congratulations!! You Have Completed This Level" )
            self.viewRouter.currentPage = "page5"
            //self redirect
        }
        else if(util.val == "Medium"){
            util.val = "Hard"
            displayScore = false
                      entertainment1 = []
                      index = 0
                      btntxt = "Start"
            Text( "Congratulations!! You Have Completed This Level" )
            self.showingAlert = false
                      self.viewRouter.currentPage = "page5"
            //self redirect
        }
        else if(util.val == "Hard"){
            Text( "Congratulations!! You Have Completed All Levels" )
            displayScore = false
            self.showingAlert = false
            self.viewRouter.currentPage = "page7"
        }
    }
    //Function to check answer validity.
    func checkAns(ans: String){
        if(entertainment1[index].correct_answer == ans){
            //if answer is correct score value is increased by 10.
            score += 10
            //Display alert if right option is selected
            alert = "Congratulations!!"
        }
        else{
            alert = "Sorry!!"
        }
        
       //Display alert if wrong answer is selected
        self.showingAlert = true
        self.Next()
       // print(ans)
    }
}

    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}


