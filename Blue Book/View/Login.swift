//
//  Login.swift
//  Blue Book
//
//  Created by Shiva Kommareddy on 4/13/20.
//  Copyright © 2020 Shiva Kommareddy. All rights reserved.
//

import SwiftUI
import Firebase
import UIKit
import FirebaseFirestore

let newUser = Firestore.firestore().collection("User")

struct Login: View {
    let db = Firestore.firestore()
     @EnvironmentObject var util: Util
     @ObservedObject var viewRouter: ViewRouter
     @ObservedObject private var users = FirebaseController<User>(collectionRef: newUser)
     @State var email: String = ""
     @State var password: String = ""
        var body: some View {
                VStack(){
                    Image("Logo")
                    Text("BLUE BOOK").bold().font(.subheadline).padding(10.0)
                    Text("LOGIN").bold().font(.title)
                    TextField("Email", text:$email).padding(10).cornerRadius(4.0).border(Color.blue).frame(width: 350)
                         .autocapitalization(.none)
                    SecureField("Password", text: $password).padding(10).cornerRadius(4.0).border(Color.blue).frame( width: 350)
                        .autocapitalization(.none)
                    Button(action: submit) {
                        HStack(alignment: .center){
                            Spacer()
                            Text("LOGIN/SIGN IN").foregroundColor(Color.black).bold()
                            Spacer()
                        }.padding().background(Color.gray).cornerRadius(4.0).frame(width: 350)
                    }.padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                    Button(action: {self.viewRouter.currentPage = "page2"}){
                        HStack(alignment: .center){
                            Spacer()
                            Text("NEW USER/REGISTER").foregroundColor(Color.black).bold()
                            Spacer()
                        }.padding(12).background(Color.gray).cornerRadius(4.0).frame(width: 300)
                    }.padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                }
            }
            
            func submit(){
                // Values in the label
                let email = $email.wrappedValue
                let password = $password.wrappedValue
                var flag = true
                for user in users.items{
                    print("Email is: \(user.email) and Password is: \(user.password)")
                    if(user.email == email && user.password == password){
                        print("Valid User")
                        self.viewRouter.currentPage = "page3"
                        flag = false
                        util.email = user.email
                    }
                }
                if(flag) {print("Invalid User")}
              }
            func NewUser(){
                
            }
            func getDocumentsDirectory() -> URL {
                let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
                return paths[0]
            }
        }

struct Login_Previews: PreviewProvider {
            static var previews: some View {
                Login(viewRouter: ViewRouter())
            }
        }
