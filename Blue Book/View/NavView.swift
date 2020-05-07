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
                   Text("Home")
                      
                    .tabItem {
                        Image(systemName: "person.fill" )
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(40)
                            .frame(width: geometry.size.width/3, height: 55)
                    }
                    Button(action: self.HomeMethod){
                        Text("CHOOSE CATEGORY TO PLAY")
                    }
                     //self.viewRouter.currentPage = "page7"
                    .tabItem {
                        Image(systemName: "house.fill" )
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(40)
                            .frame(width: geometry.size.width/3, height: 55)
                    }
                        Button(action: self.SetMethod){
                            Text("Go Home")
                        }
                        //Text ("setting")
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
     
     func HomeMethod()
     {
         self.viewRouter.currentPage = "page7"
     }
    func SetMethod()
        {
            self.viewRouter.currentPage = "page8"
        }

}
    struct NavView_Previews: PreviewProvider {
        static var previews: some View {
            NavView(viewRouter: ViewRouter())
        }
    }



/*VStack {
                             Spacer()
                             Text("Home")
                             Spacer()
                  HStack {
                  Image(systemName: "house")
                      .resizable()
                      .aspectRatio(contentMode: .fit)
                      .padding(20)
                      .frame(width: geometry.size.width/3, height: 75)
                    Image(systemName: "gear")
                                 .resizable()
                                 .aspectRatio(contentMode: .fit)
                                 .padding(20)
                                 .frame(width: geometry.size.width/3, height: 75)
                      .onTapGesture {
                                 self.viewRouter.currentView =  Text("Settings")
                                                }
                    } .frame(width: geometry.size.width, height: geometry.size.height/10)
                               .background(Color.white.shadow(radius: 2))

                         }
                     }*/



    
