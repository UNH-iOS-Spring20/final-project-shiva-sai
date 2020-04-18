//
//  ViewRouter.swift
//  Blue Book
//
//  Created by Shiva Kommareddy on 4/13/20.
//  Copyright © 2020 Shiva Kommareddy. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class ViewRouter: ObservableObject{
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    var currentPage: String = "page1"{
        didSet{
            objectWillChange.send(self)
        }
        
    }
}
