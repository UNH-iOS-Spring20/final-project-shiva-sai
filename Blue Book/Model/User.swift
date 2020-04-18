//
//  User.swift
//  Blue Book
//
//  Created by Shiva Kommareddy on 4/13/20.
//  Copyright © 2020 Shiva Kommareddy. All rights reserved.
//

import Foundation
class User: Identifiable{

    var firstname: String
    var lastname: String
    var email: String
    var password: String
    
    init?( firstname: String, lastname: String, email: String, password: String){
        if firstname.isEmpty || lastname.isEmpty || email.isEmpty || password.isEmpty {
            return nil
        }

        self.firstname = firstname;
        self.lastname = lastname;
        self.email = email;
        self.password = password;
        
    }
}
