//
//  ContentView.swift
//  Blue Book
//
//  Created by Shiva Kommareddy on 2/19/20.
//  Copyright © 2020 Shiva Kommareddy. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
let db = Firestore.firestore()
struct ContentView: View {
    var body: some View {
        VStack{
            Button(action: {
                getAllDocuments(collection: "QandA")
            }){
                Text("Get all Q&A")
            }.font(.largeTitle)
                .padding(10.0)
            
            Button(action: {
                        createDocuments()
                       }){
                           Text("Create Documents")
                       }.font(.largeTitle)
                           .padding(10.0)
            
            Button(action: {
                           deleteDocuments(collection: "QandA")
                       }){
                           Text("Delete Documents")
                       }.font(.largeTitle)
                           .padding(10.0)
            
            Button(action: {
                           updateDocuments(collection: "QandA")
                       }){
                           Text("Update Documents")
                       }.font(.largeTitle)
                           .padding(10.0)
        }
    }
}

private func getAllDocuments(collection: String){
    db.collection(collection).getDocuments(){
        (querySnapshot, err) in
        if let err = err{
            print("Error in getting documents: \(err)")
        }
        else{
            for document in querySnapshot!.documents{
                print("\(document.documentID) => \(document.data())")
            }
        }
        
    }
}

private func createDocuments(){
    let reference = db.collection("QandA")
    reference.document("Q1").setData([
        "Question": "Who is the president of United State",
        "Answer": ["Donald John Trump", "Joe Biden", "Barack Obama", "Hillary Clinton"]
    ])
     reference.document("Q2").setData([  "Question": "What is the capital of USA",
       "Answer": ["New York", "California", "Texas", "Washington DC"]
    ])
     reference.document("Q3").setData([  "Question": "In which country, the world's largest cricket stadium is situated",
          "Answer": ["India", "Australia", "New Zealand", "England"]
    ])
    
     reference.document("Q4").setData([  "Question": "Which is the world's biggest continent",
          "Answer": ["Asia", "North America", "Africa", "Europe"]
       ])
}



private func deleteDocuments(collection: String){
    db.collection(collection).getDocuments(){
        (querySnapshot, err) in
        if let err = err{
            print("Error in deleting documents: \(err)")
        }
        else{
            for document in querySnapshot!.documents{
                print("Deleting documents")
                document.reference.delete()
            }
        }
    }
}


private func updateDocuments(collection: String){
    let reference = db.collection(collection)
        
    reference.document("Q1").setData([
        "Question": "Which is the currency in USA",
                 "Answer": ["dollar", "rupee", "pound", "sterling"]
        ])
    
    reference.document("Q2").setData([
        "Question": "What is the capital of connecticut",
             "Answer": ["bridgeport", "stamford", "new haven", "hartford"]
    ])
    
    reference.document("Q3").setData([
         "Question": "What is the crown shaped virus",
         "Answer": ["Corona virus", "Ebola", "HIV", "Rotavirus"]
    ])
    
    reference.document("Q4").setData([
        "Question": "What is the current CEO of Apple INC",
         "Answer": ["Tim Cook", "Steve Jobs", "Jeff Bezos", "Nikhil Jammula"]
    ])
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
