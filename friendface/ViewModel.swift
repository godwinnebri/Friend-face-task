//
//  ViewModel.swift
//  friendface
//
//  Created by Godwin IE on 21/02/2024.
//

import Foundation
import SwiftData
import SwiftUI


class ViewModel: ObservableObject {
    @Published var users: [User] = []

    func fetch() {
        guard let url = URL(string:
                                "https://www.hackingwithswift.com/samples/friendface.json") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _,
        error in
            guard let data = data, error == nil else {
                return
            }
            
            //CONVERT TO JSON
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                DispatchQueue.main.async {
                    self?.users = users
                }
            } catch {
                print(error)
            }
            
        }
        task.resume()
        
    }
    
    
}
