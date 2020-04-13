//
//  RootModel.swift
//  
//
//  Created by Shiva Kommareddy on 4/12/20.
//

import Foundation

struct Questions: Codable {
    var category: String = ""
    var type: String = ""
    var difficulty: String = ""
    var question: String = ""
    var correct_answer: String = ""
    var incorrect_answers: [String] = []
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
                }
                
            }
        }
        dataTask.resume()
    }
}
