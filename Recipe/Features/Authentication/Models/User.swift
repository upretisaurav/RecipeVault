//
//  User.swift
//  Recipe
//
//  Created by saurav upreti on 3/26/25.
//

import Foundation
import SwiftData

@Model
class User {
    var email: String
    var password: String
    var creationDate: Date

    init(email: String, password: String, creationDate: Date = Date()) {
        self.email = email
        self.password = password
        self.creationDate = creationDate
    }
}
