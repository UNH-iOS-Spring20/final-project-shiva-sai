//
//  LocalNotificationView.swift
//  Blue Book
//
//  Created by Shiva Kommareddy on 4/30/20.
//  Copyright © 2020 Shiva Kommareddy. All rights reserved.
//

import SwiftUI

struct LocalNotificationView: View {
    @ObservedObject var notificationManager = LocalNotificationManager()
     @ObservedObject var viewRouter: ViewRouter
    
    @State var showFootnote = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {self.BackMethod()}){
                 Text("<").foregroundColor(Color.black).bold()
                 
                Spacer()
                 }.padding().background(Color.gray).cornerRadius(3.0).frame(width: 100)

                Button(action: {
                    withAnimation {
                        self.showFootnote.toggle()

                        self.notificationManager.sendNotification(title: "Hurray!", subtitle: nil, body: "Hey we are missing you,its been long time we saw you, come let's play!", launchIn: 60)
                    }
                }) {
                    Toggle(isOn: $showFootnote) {
                        Text("Local Notifications")
                    }.padding()
                    
                }
            }
                .navigationBarTitle("Local Notification Demo", displayMode: .inline)
        }
    }
    func BackMethod() {
    self.viewRouter.currentPage = "page3"
        }
}


struct LocalNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotificationView(viewRouter: ViewRouter())
    }
}
