//
//  DifficultyView.swift
//  Blue Book
//
//  Created by Shiva Kommareddy on 5/6/20.
//  Copyright © 2020 Shiva Kommareddy. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct DifficultyView: View {
    @ObservedObject var viewRouter: ViewRouter
    @EnvironmentObject var Typ: Util
    var body: some View {
        List{
            Button(action: {self.BackMethod()}){
                Text("<")
                Spacer()
            }
            Button(action: {self.EasyMethod()}){
                Text("   EASY   ").foregroundColor(Color.white).bold().italic()
                Spacer()
            }
            Button(action: {self.MediumMethod()}) {
                Text("MEDIUM").foregroundColor(Color.white).bold().italic()
                Spacer()
            }
            Button(action: {self.HardMethod()}) {
                Text("   HARD   ").foregroundColor(Color.white).bold().italic()
                Spacer()
            }
        }
    }
    func BackMethod() {
        self.viewRouter.currentPage = "page5"
    }
    func EasyMethod(){
        self.Typ.val = "Easy"
        self.viewRouter.currentPage = "page5"
    }
    func MediumMethod(){
        self.Typ.val = "Medium"
        self.viewRouter.currentPage = "page5"
    }
    func HardMethod(){
        self.Typ.val = "Hard"
        self.viewRouter.currentPage = "page5"
    }
}


struct DifficultyView_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyView(viewRouter: ViewRouter())
    }
}
