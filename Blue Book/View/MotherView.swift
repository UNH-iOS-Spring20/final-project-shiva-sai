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
           
           var body: some View {
               VStack{
                   if  viewRouter.currentPage == "page1"{
                    Login(viewRouter: viewRouter, Cobject: Controller())
                   }
                   else if viewRouter.currentPage == "page2"{
                    Signup(viewRouter: viewRouter, Cobject: Controller())
                   }
                   else if viewRouter.currentPage == "page3"{
                    HomepageView(viewRouter: viewRouter, Cobject: Controller())
                 }
                   else if viewRouter.currentPage == "page4"{
                    EntertainmentView(viewRouter: viewRouter)
                }
            }
           }
    }

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter())
    }
}
