//
//  FirebaseModel.swift
//  Blue Book
//
//  Created by Shiva Kommareddy on 4/12/20.
//  Copyright © 2020 Shiva Kommareddy. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

let firebaseSession = FirebaseSession() // Singleton
class FirebaseSession: ObservableObject{
    @Published var completeusers = [User]()
    
    let db = Firestore.firestore()
    init(){
        performLogin()
    }
    func performLogin(){
        db.collection("User").addSnapshotListener{ QuerySnapshot, error in
            guard let snapshot  = QuerySnapshot else{
               print("Error in fetching snapshot \(error!)")
                return
            }
            snapshot.documentChanges.forEach{ diff in
                if(diff.type == .added){                    print("New User added: \(diff.document.data())")
                    let k = User( firstname: diff.document.get("firstname") as! String,
                                  lastname: diff.document.get("lastname") as! String,
                                  email: diff.document.get("email") as! String,
                                  password: diff.document.get("password") as! String)
                    self.completeusers.append(k!)
                }
                
            }
        }
         }
    
}

