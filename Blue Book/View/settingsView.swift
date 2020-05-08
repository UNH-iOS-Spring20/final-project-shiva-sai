//
//  settingsView.swift
//  Blue Book
//
//  Created by Shiva Kommareddy on 5/6/20.
//  Copyright © 2020 Shiva Kommareddy. All rights reserved.
//

import SwiftUI

struct settingsView: View {
    @ObservedObject var viewRouter: ViewRouter
    var body: some View {
        List{
            Button(action: {self.BackMethod()}){
            Text("<")
            Spacer()
            }
            Button(action:self.NotMethod){
                Text("Notification settings").foregroundColor(Color.white).bold().italic()
                Spacer()
            }.padding()
            Button(action:LogoutMethod){
                Text("Logout").foregroundColor(Color.white).bold().italic()
                Spacer()
            }.padding()
        }
    }
    func BackMethod() {
        self.viewRouter.currentPage = "page3"
    }
    func NotMethod() {
        self.viewRouter.currentPage = "page6"
    }
    func LogoutMethod() {
    self.viewRouter.currentPage = "page1"
    }
}

struct settingsView_Previews: PreviewProvider {
    static var previews: some View {
        settingsView(viewRouter: ViewRouter())
    }
}
