//
//  HomepageView.swift
//  Blue Book
//
//  Created by Shiva Kommareddy on 4/17/20.
//  Copyright © 2020 Shiva Kommareddy. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import UIKit

struct HomepageView: View {
     let db = Firestore.firestore()
        @ObservedObject var viewRouter: ViewRouter
        @ObservedObject private var fbSession = firebaseSession
        @EnvironmentObject var Cat: Util
            var body: some View {
                VStack{
                     Button(action: {self.EntertainmentMethod()}) {
                        Text("ENTERTAINMENT").foregroundColor(Color.black).bold()
                        Spacer()
                        }.padding().background(Color.green).cornerRadius(1.0).frame(width: 200)
                    Button(action: {
                        self.HistoryMethod()
                    }) {
                        Text("HISTORY").foregroundColor(Color.black).bold()
                        Spacer()
                    }.padding().background(Color.green).cornerRadius(1.0).frame(width: 200)
                    Button(action: {
                    self.SportsMethod()
                    }) {
                    Text("SPORTS").foregroundColor(Color.black).bold()
                    Spacer()
                    }.padding().background(Color.blue).cornerRadius(1.0).frame(width: 200)
                    Button(action: {
                    self.ScienceMethod()
                    }) {
                        Text("SCIENCE").foregroundColor(Color.black).bold()
                        Spacer()
                    }.padding().background(Color.yellow).cornerRadius(1.0).frame(width: 200)
        }
    }
func EntertainmentMethod() {
    self.viewRouter.currentPage = "page4"
    self.Cat.cat_type = "Entertainment"
    
}
func HistoryMethod() {
     self.viewRouter.currentPage = "page4"
    self.Cat.cat_type = "History"
    
    }
func SportsMethod() {
    self.viewRouter.currentPage = "page4"
    self.Cat.cat_type = "Sports"
    
    }
func ScienceMethod() {
    self.viewRouter.currentPage = "page4"
    self.Cat.cat_type = "Science"
    
    }
}
struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView(viewRouter: ViewRouter())
    }
}


