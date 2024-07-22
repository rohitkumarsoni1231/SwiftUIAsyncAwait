//
//  UserViewModel.swift
//  SwiftUIAsyncAwait
//
//  Created by Rohit Kumar on 19/07/2024.
//

import Foundation

class UserViewModel: ObservableObject {
    
    @Published var users: [UserModel] = []
    private let manager = APIManager()
    
    //    func fetchUser() {
    //        manager.fetchUsers(modelType: [UserModel].self) { (result) in
    //            switch result {
    //            case .success(let users):
    //                self.users = users
    //            case .failure(let error):
    //                print("User Fetch Error", error)
    //            }
    //        }
    //    }
    
    @MainActor func fetchUser() {
        Task {
            do {
                users = try await manager.request(url: userURL)
            } catch {
                print("User Fetch Error", error)
            }
        }
    }
}


// @MainActor : - The @MainActor attribute is used to ensure that the code is executed on the main thread. This is required because the fetchUser() method is updating the users property, which is marked with @Published. When the users property is updated, the SwiftUI view that is observing the users property will be automatically updated. To ensure that this update happens on the main thread, we use the @MainActor attribute.
