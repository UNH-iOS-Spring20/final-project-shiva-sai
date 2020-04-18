//
//  Signup.swift
//  Blue Book
//
//  Created by Shiva Kommareddy on 4/13/20.
//  Copyright © 2020 Shiva Kommareddy. All rights reserved.
//

import SwiftUI

struct Signup: View {
    @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var Cobject: Controller
    @State var email: String = ""
    @State var password: String = ""
    @State var firstname: String = ""
    @State var lastname: String = ""
       var body: some View {
           VStack{
               HStack{
                TextField("FirstName", text: $firstname).padding(12).frame(width: 180).border(Color.blue)
                       .autocapitalization(.none)

                   
                   TextField("LastName", text: $lastname).padding(12).frame(width:180).border(Color.blue)
                      .autocapitalization(.none)
                   
               }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
               
               TextField("Email", text: $email).padding(12).frame(width:370).border(Color.blue)
                   .autocapitalization(.none)
               
               SecureField("Password", text: $password).padding(12).frame(width:370).border(Color.blue).padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                   .autocapitalization(.none)
               
               Button(action: DoSignUp){
                   HStack(alignment: .center){
                                      Spacer()
                                  Text("SIGN UP").foregroundColor(Color.black).bold()
                                      Spacer()
                                  }.padding().background(Color.gray).cornerRadius(4.0).frame(width: 370)
               }.padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
               
               Button(action: {self.viewRouter.currentPage = "page1"}){
                              HStack(alignment: .center){
                                                 Spacer()
                                             Text("EXISTING USER/LOGIN").foregroundColor(Color.black).bold()
                                                 Spacer()
                                             }.padding().background(Color.gray).cornerRadius(4.0).frame(width: 370)
                          }.padding(EdgeInsets(top: 25, leading: 0, bottom: 0, trailing: 0))
           }
       }
    func DoSignUp(){
        let email: String = $email.wrappedValue
        let password: String = $password.wrappedValue
        let firstname: String = $firstname.wrappedValue
        let lastname: String = $lastname.wrappedValue
        
        Cobject.doSignup(email: email, password: password, firstname: firstname, lastname: lastname)
    }

}


struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup(viewRouter: ViewRouter(), Cobject:
            Controller())
    }
}
