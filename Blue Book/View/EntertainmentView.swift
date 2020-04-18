//
//  EntertainmentView.swift
//  Blue Book
//
//  Created by Shiva Kommareddy on 4/18/20.
//  Copyright © 2020 Shiva Kommareddy. All rights reserved.
//

import SwiftUI
import Firebase
import UIKit

struct EntertainmentView: View {
         let db = Firestore.firestore()
                   @ObservedObject var viewRouter: ViewRouter
        var body: some View {
            Group {
                VStack(spacing: 25) {
                    HStack {
                Button(action: {self.EntertainmentMethod()}){
                    Text("BOOKS").foregroundColor(Color.black).bold()
                    Spacer()
                }.padding().background(Color.orange).cornerRadius(1.0).frame(width: 200)
                Button(action: {self.PoliticalMethod()
                }) {
                    Text("CARTOON AND ANIMATION").foregroundColor(Color.black).bold()
                     Spacer()
                }.padding().background(Color.green).cornerRadius(1.0).frame(width: 200)
                           }
                    HStack {
                Button(action: {self.SportsMethod()
                }) {
                    Text("COMICS").foregroundColor(Color.black).bold()
                    Spacer()
                }.padding().background(Color.blue).cornerRadius(1.0).frame(width: 200)
                Button(action: {self.ScienceMethod()
                }) {
                    Text("FILMS").foregroundColor(Color.black).bold()
                    Spacer()
                }.padding().background(Color.yellow).cornerRadius(1.0).frame(width: 200)
                           }
                    HStack {
                Button(action: {self.SportsMethod()
                }) {
                    Text("MUSIC").foregroundColor(Color.black).bold()
                    Spacer()
                }.padding().background(Color.blue).cornerRadius(1.0).frame(width: 200)
                Button(action: {self.ScienceMethod()
                }) {
                    Text("MUSICALS AND THEATRES").foregroundColor(Color.black).bold()
                    Spacer()
                }.padding().background(Color.yellow).cornerRadius(1.0).frame(width: 200)
                    }
                        HStack {
                Button(action: {self.SportsMethod()
                }) {
                    Text("TELIVISION").foregroundColor(Color.black).bold()
                    Spacer()
                }.padding().background(Color.blue).cornerRadius(1.0).frame(width: 200)
                Button(action: {self.ScienceMethod()
                }) {
                    Text("VIDEO GAMES").foregroundColor(Color.black).bold()
                    Spacer()
                }.padding().background(Color.yellow).cornerRadius(1.0).frame(width: 200)
                        }
                       }.padding().background(Color.black)
                   }
               }
        
    func EntertainmentMethod() {
        Entertainment()
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

struct EntertainmentView_Previews: PreviewProvider {
    static var previews: some View {
        EntertainmentView(viewRouter: ViewRouter())
    }
}
