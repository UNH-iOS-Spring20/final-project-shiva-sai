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
}
}
