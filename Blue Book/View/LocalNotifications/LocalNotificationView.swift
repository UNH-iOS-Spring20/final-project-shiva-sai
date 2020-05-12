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
        List{
                Button(action: {self.BackMethod()}){
                    Text("Back")
                    Spacer()
                 }
                Button(action: {
                    withAnimation {
                        self.showFootnote.toggle()
                        //Message to display in the notification shade
                        self.notificationManager.sendNotification(title: "We Miss You!", subtitle: nil, body: "Hey we are missing you,its been long time we saw you, come let's play!", launchIn: 10)
                    }
                }) {
                    Toggle(isOn: $showFootnote) {
                        Text("Local Notifications")
                    }.padding()
                }
        }
    }
    func BackMethod() {
    self.viewRouter.currentPage = "page8"
        }
}


struct LocalNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotificationView(viewRouter: ViewRouter())
    }
}
