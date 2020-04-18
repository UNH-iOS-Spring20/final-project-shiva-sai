//
//  Controller.swift
//  Blue Book
//
//  Created by Shiva Kommareddy on 4/13/20.
//  Copyright © 2020 Shiva Kommareddy. All rights reserved.
//

import Foundation
import Firebase

class Controller: ObservableObject{
    let db = Firestore.firestore()
  @Published var allusers = [User]()
    
   // Code to add users to the database
    func doSignup(email: String, password: String, firstname: String, lastname: String){
    print("I am clicked, Submit once")
    print(email)
    print(password)

    db.collection("User").document("User1").setData(
        ["email": email,
        "password": password,
        "firstname": firstname,
        "lastname": lastname
        ])
    }
    
    //--------------------------------------------------------------------
    
    func doLogin(){
        print("LOGIN IS IN PROGRESS")
        // Code to get all users from the firestore
        db.collection("User").getDocuments(){
            (QuerySnapshot, err) in
            if let err = err{
                print("Error getting documents: \(err)")
            }
            else{
                for document in QuerySnapshot!.documents{
                    print("I can print the document data: \(document.data())")
                    var userObj: User?
                    userObj = User(firstname: document.get("firstname") as! String,
                                       lastname: document.get("lastname") as! String,
                                       email: document.get("email") as! String,
                                       password: document.get("password") as! String
                    )
                    let k = userObj?.firstname
                    print(k!)
                    self.allusers.append(userObj!)
                }
            }
        }
    }
    
    //----------------------------------------------------------------------
}
