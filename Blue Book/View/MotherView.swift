//
//  MotherView.swift
//  Blue Book
//
//  Created by Shiva Kommareddy on 4/13/20.
//  Copyright © 2020 Shiva Kommareddy. All rights reserved.
//


import SwiftUI

struct MotherView: View {
    @ObservedObject var viewRouter: ViewRouter    // The classic conceot of binding
    @EnvironmentObject var util: Util
           
           var body: some View {
               VStack{
                    if viewRouter.currentPage == "page1"{
                    Login(viewRouter: viewRouter)
                    }
                    if viewRouter.currentPage == "page2"{
                    Signup(viewRouter: viewRouter)
                    }
                    if viewRouter.currentPage == "page3"{
                    NavView(viewRouter: viewRouter)
                    }
                    if viewRouter.currentPage == "page4"{
                    DifficultyView(viewRouter: viewRouter)
                    }
                    if viewRouter.currentPage == "page5"{
                    ContentView(viewRouter: viewRouter)
                    }
                    if viewRouter.currentPage == "page6"{
                    LocalNotificationView(viewRouter: viewRouter)
                    }
                    if viewRouter.currentPage == "page7" {
                    HomepageView(viewRouter: viewRouter)
                    }
                    if viewRouter.currentPage == "page8" {
                    settingsView(viewRouter: viewRouter)
                    }
                    if viewRouter.currentPage == "page9" {
                    AddQuestion(viewRouter: viewRouter)
                    }
                    if viewRouter.currentPage == "page10" {
                    ProfileView(viewRouter: viewRouter)
                    }
                }
           }
    }

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter()).environmentObject(Util())
    }
}

