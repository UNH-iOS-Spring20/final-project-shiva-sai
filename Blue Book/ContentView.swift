//
//  ContentView.swift
//  Blue Book
//
//  Created by Shiva Kommareddy on 2/19/20.
//  Copyright © 2020 Shiva Kommareddy. All rights reserved.
//

import SwiftUI
import Firebase
struct ContentView: View {
    var body: some View {
        QReference().callUrl(urlStr: "https://opentdb.com/api.php?amount=6&category=0&difficulty=easy&type=boolean") { (data) in
            print(data)
        }
        return Text("Hello, World!")

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
