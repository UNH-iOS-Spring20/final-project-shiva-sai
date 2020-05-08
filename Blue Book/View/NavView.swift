//
//  NavView.swift
//  Blue Book
//
//  Created by Shiva Kommareddy on 5/6/20.
//  Copyright © 2020 Shiva Kommareddy. All rights reserved.
//

import SwiftUI
import Foundation
import UIKit

// Code to get reference

struct NavView: View {
    @ObservedObject var viewRouter: ViewRouter
    var body: some View{
        GeometryReader { geometry in
            TabView {
                Button(action: self.HomeMethod){
                    Text("CHOOSE CATEGORY TO PLAY").foregroundColor(Color.black).bold()                    }.padding().background(Color.blue).cornerRadius(4.0).frame(width: 350)
                    .tabItem {
                        Image(systemName: "house.fill" )
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(40)
                            .frame(width: geometry.size.width/3, height: 55)
                    }
                Button(action: self.UserProfileMethod){
                    Text("Profile").foregroundColor(Color.black).bold()                                      }.padding().background(Color.blue).cornerRadius(4.0).frame(width: 350)
                    .tabItem {
                        Image(systemName: "person.fill" )
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(40)
                            .frame(width: geometry.size.width/3, height: 55)
                    }
                Button(action: self.SetMethod){
                    Text("View Settings").foregroundColor(Color.black).bold()                        }.padding().background(Color.blue).cornerRadius(4.0).frame(width: 350)
                    .tabItem {
                        Image(systemName: "gear" )
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(40)
                            .frame(width: geometry.size.width/3, height: 55)
                    }
            }
        }
    }
     func UserProfileMethod(){
        self.viewRouter.currentPage = "page10"
     }
     func HomeMethod(){
         self.viewRouter.currentPage = "page7"
     }
     func SetMethod(){
            self.viewRouter.currentPage = "page8"
    }
}

struct NavView_Previews: PreviewProvider {
        static var previews: some View {
            NavView(viewRouter: ViewRouter())
        }
    }
