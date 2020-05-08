//
//  ProfileView.swift
//  Blue Book
//
//  Created by Shiva Kommareddy on 5/7/20.
//  Copyright © 2020 Shiva Kommareddy. All rights reserved.
//

import SwiftUI
import Foundation
import UIKit
import FirebaseFirestore

let profile = Firestore.firestore().collection("User")
struct ProfileView: View {
    @EnvironmentObject var util: Util
    @ObservedObject var viewRouter: ViewRouter
    @ObservedObject private var profiles = FirebaseController<User>(collectionRef: profile)
    @State  var userdata: [User] = []
    @State var email: String = ""
    @State var firstname: String = ""
    @State var lastname: String = ""
        var body: some View {
            List{
            Button(action: {self.BackMethod()}){
            Text("BACK")
            Spacer()
            }
                Button(action: {self.mydataMethod()}){
                        Text("Email :"+email)
                        Text("First name :"+firstname)
                        Text("Last name :"+lastname)
                }
                
            Button(action: self.SelfAddMethod){
                Text("Make Your Own Quiz")
                }
        }
    }
    func BackMethod() {
              self.viewRouter.currentPage = "page3"
    }
    func mydataMethod(){
        print("profile")
        for item in profiles.items{
            if(item.email == util.email){
                print(item.email)
                email = item.email
                firstname = item.firstname
                lastname = item.lastname
          }
        }
    }
    func SelfAddMethod(){
        self.viewRouter.currentPage = "page9"
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewRouter: ViewRouter())
    }
}
