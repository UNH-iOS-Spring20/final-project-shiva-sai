//
//  LevelRouterController.swift
//  Blue Book
//
//  Created by Shiva Kommareddy on 5/1/20.
//  Copyright © 2020 Shiva Kommareddy. All rights reserved.
//

import Foundation

class LevelRouteController: ObservableObject{
    
    @Published var levelRoute = Util()
    
    
    func setLeveType(cat_type: String, val: String){
        self.levelRoute.cat_type = cat_type
        self.levelRoute.val = val
    }
    
    func getLeveType() -> LevelRouteController {
        var lr: LevelRouteController = LevelRouteController()
        lr.levelRoute = self.levelRoute
        return lr
    }
}
