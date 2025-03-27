//
//  AuthDataService.swift
//  Recipe
//
//  Created by saurav upreti on 3/26/25.
//

import SwiftData
import Foundation

class AuthDataService {
    private let modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func saveUser(email: String, password: String) throws {
        let newUser = User(email: email, password: password)
        modelContext.insert(newUser)
        try modelContext.save()
    }

    func fetchUser(byEmail email: String) -> User? {
        let fetchDescriptor = FetchDescriptor<User>(predicate: #Predicate { $0.email == email })
        do {
            let users = try modelContext.fetch(fetchDescriptor)
            return users.first
        } catch {
            print("Error fetching user by email: \(error)")
            return nil
        }
    }
}
