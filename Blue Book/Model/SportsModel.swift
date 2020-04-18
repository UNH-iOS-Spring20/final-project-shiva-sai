//
//  SportsModel.swift
//  Blue Book
//
//  Created by Shiva Kommareddy on 4/13/20.
//  Copyright © 2020 Shiva Kommareddy. All rights reserved.
//

import Foundation
import FirebaseFirestore

class Sports {
    lazy var questions:[Questions] = []
    
    func callFirebasedb(type:String) -> Void {
        let db = Firestore.firestore()
        let docRef = db.collection("/sports").document(type)
        docRef.getDocument { (document, err) in
            if err == nil {
                for obj in document!.data()! {
                    let value = obj.value as! Dictionary<String, Any>
                    let multivalue = value["multi"] ?? ""
                    self.callUrl(urlString: multivalue as! String)
                    
                }
            }
        }
        
    }
    
    private func callUrl(urlString: String) {
        QReference().callUrl(urlStr: urlString) { (data) in
            for question in data.results {
             self.questions.append(question)
                print(self.questions)
            }
        }
    }
}
