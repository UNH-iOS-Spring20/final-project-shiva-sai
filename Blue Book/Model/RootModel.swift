//
//  RootModel.swift
//  
//
//  Created by Shiva Kommareddy on 4/12/20.
//

import FirebaseFirestore

class RootModel: FirebaseCodable {
    var id: String
    @Published var category: String = "" // Eg: Entertainment, Histrory, Science, Sports
    @Published var difficulty: String = "" // Eg: Easy, medium
    @Published var question: String = ""
    @Published var correct_answer: String = ""
    @Published var incorrect_answers_1 : String = ""
    @Published var incorrect_answers_2 : String = ""
    @Published var incorrect_answers_3 : String = ""
    
    var data: [String: Any]{
        return[     
            "category" : category,
            "difficulty" : difficulty,
            "question": question,
            "correct_answer" : correct_answer,
            "incorrect_answers_1" : incorrect_answers_1,
            "incorrect_answers_2" : incorrect_answers_2,
            "incorrect_answers_3" : incorrect_answers_3,
        ]
    }
    
    required init?(id: String, data: [String: Any]){
        guard let category = data["category"] as? String,
        let difficulty = data["difficulty"] as? String,
        let question = data["question"] as? String,
        let correct_answer = data["correct_answer"] as? String,
        let incorrect_answers_1 = data["incorrect_answers_1"] as? String,
        let incorrect_answers_2 = data["incorrect_answers_2"] as? String,
        let incorrect_answers_3 = data["incorrect_answers_3"] as? String
            else {
                return nil
        }
        self.id = id
        self.category = category
        self.difficulty = difficulty
        self.question = question
        self.correct_answer = correct_answer
        self.incorrect_answers_1 = incorrect_answers_1
        self.incorrect_answers_2 = incorrect_answers_2
        self.incorrect_answers_3 = incorrect_answers_3
    }
    
}
 /*
}

struct MasterTable: Codable {
    var response_code: Int = 2
    var results: [Questions] = []
}

class QReference: NSObject {
    public func callUrl(urlStr urlString: String, output: @escaping (_ data: MasterTable) -> Void){
        let url = URL(string: urlString)
       
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                do{
                   let table =  try decoder.decode(MasterTable.self, from: data!)
                    output(table)
                }catch {
                    print("Errors")
                    print("Error info: \(error)")
                    
                }
                
            }
        }
        dataTask.resume()
    }
}
*/
