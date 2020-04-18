//
//  HomepageView.swift
//  Blue Book
//
//  Created by Shiva Kommareddy on 4/17/20.
//  Copyright © 2020 Shiva Kommareddy. All rights reserved.
//

import SwiftUI
import Firebase
import UIKit

struct HomepageView: View {
     let db = Firestore.firestore()
                @ObservedObject var viewRouter: ViewRouter
                @ObservedObject var Cobject: Controller
                @ObservedObject private var fbSession = firebaseSession
    var body: some View {
        Group {
                   VStack(spacing: 25) {
                       HStack {
                        Button(action: {self.EntertainmentMethod()}){
                            Text("ENTERTAINMENT").foregroundColor(Color.black).bold()
                            Spacer()
                        }.padding().background(Color.orange).cornerRadius(1.0).frame(width: 200)
                        
                        Button(action: {
                            self.PoliticalMethod()
                        }) {
                                Text("POLITICS").foregroundColor(Color.black).bold()
                            Spacer()
                            }.padding().background(Color.green).cornerRadius(1.0).frame(width: 200)
                       }
                       HStack {
                        Button(action: {
                                self.SportsMethod()
                        }) {
                            Text("Sports").foregroundColor(Color.black).bold()
                            Spacer()
                            }.padding().background(Color.blue).cornerRadius(1.0).frame(width: 200)
                        Button(action: {
                        self.ScienceMethod()
                        }) {
                                Text("Science").foregroundColor(Color.black).bold()
                                Spacer()
                                }.padding().background(Color.yellow).cornerRadius(1.0).frame(width: 200)
                           
                       }
                   }.padding().background(Color.black)
               }
    }
func EntertainmentMethod() {
     self.viewRouter.currentPage = "page4"
}
func PoliticalMethod() {
    Politics()
}
func SportsMethod() {
    Sports()
}
func ScienceMethod() {
    Science()
    }
}
struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView(viewRouter: ViewRouter(), Cobject: Controller())
    }
}
