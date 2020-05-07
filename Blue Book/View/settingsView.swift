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
        VStack(spacing: 10){
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
    func NotMethod() {
        print(1)
      self.viewRouter.currentPage = "page6"
        print(7)
    }
    func LogoutMethod() {
        print(30)
    self.viewRouter.currentPage = "page1"
        print(3)
    }
    
}

struct settingsView_Previews: PreviewProvider {
    static var previews: some View {
        settingsView(viewRouter: ViewRouter())
    }
}
