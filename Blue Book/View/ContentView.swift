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
    @State var length: Int = 0
    @State var index: Int = 0
    @State var btntxt: String = "Start"
    @State var displayScore: Bool = false;
    @ObservedObject private var questions = FirebaseController<RootModel>(collectionRef: questionCollection2)
    
    @State  var entertainment1: [RootModel] = []
    
   
    
  // Environment variable 1 = Entertainment/Sports/Science/History
  // Environment variable 2 = Easy/Medium/Hard
    
    var body: some View{
        //print(env1) // Category
        //print(env2) // Level
        print(self.util.cat_type)
        print(self.util.val)
       
      
    
        return(
            VStack{
                if !displayScore {
                if entertainment1.count > 0 {
                List{
                Text(entertainment1[index].question)
               /* Button(
                    action: {self.Correct(ans: self.questions.isEmpty ? "" : (entertainment1[index].correct_answer))}, label:{Text(questions.isEmpty ? "" : questions[index].incorrect_answers[0])}
                       )*/

                Text(entertainment1[index].correct_answer)
            Text(entertainment1[index].incorrect_answers_1)
                Text(entertainment1[index].incorrect_answers_2)
                    Text(entertainment1[index].incorrect_answers_3)
                    
                }
        
          Button(
              action: {self.Next()}, label:{Text("Next Q")}
          )
            }
                    
                else{
                    Button(
                        action: {self.Next()}, label:{Text("Start")}
                    )
                }
        }
                else{
                    Text("Score :")
                    Button(
                                           action: {self.gotoNextLevel()}, label:{Text("Next level")}
                                       )
                    
                }
                
                
    }
        )
    }
   /* func Correct(ans: String){
        
           error = ""
           print(ans)
           //if ans == questions[index].correct_answer{
           if ans == "A"{
               score+=1
           }
           else{
               error = "wrong answer"
           }
    */
    func Next(){
        
      
        if entertainment1.count == 0 {
         for qa in questions.items{
             if(qa.category == util.cat_type && qa.difficulty == util.val){
                 entertainment1.append(qa)
             }
           }
        }
        
        
        if index < entertainment1.count-1{
            index += 1
        }
        else{
           displayScore = true
        }
        
                  
                         
                     }
    
    func  gotoNextLevel() {
        if(util.val == "Easy"){
            util.val = "Medium"
            displayScore = false
            entertainment1 = []
            index = 0
            btntxt = "Start"
            self.viewRouter.currentPage = "page5"
            //self redirect
        }
        else if(util    .val == "Medium"){
            util.val = "Hard"
            //self redirect
        }
    }
}


// 1st Swift Page: Category.swift UI file
//homepageview()
/*
 Categories - :
 1 display all categories
 2 Use select any category, set environment variable
 3 Navigate to level page
 */

// 2nd Swift Page: Level.swift UI
/*
 Difficultyview
 1. set level, environment variable
 2. user setects level, navigate to questions
 */

/*
 // 3rd Class file
 levelroutermodel.swift
 Create a class called
 LevelandCategory:
 Fields:
 LEVEL: String
 CATEGORY: String
 */

/*
 4th Content View (Questions View)
 View all questions based on Category and Level
 */



    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}


/*
 func Next(){
               if(entertainment.count-1 == index){
                   
               }
               print("I will call next function")
               index+=1
               
           }
 */
