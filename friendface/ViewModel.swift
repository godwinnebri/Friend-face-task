//
//  ViewModel.swift
//  friendface
//
//  Created by Godwin IE on 21/02/2024.
//

import Foundation
import SwiftUI


class ViewModel: ObservableObject {
    @Published var profiles: [Model] = []
    
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
                let profiles = try JSONDecoder().decode([Model].self, from: data)
                DispatchQueue.main.async {
                    self?.profiles = profiles
                }
            } catch {
                print(error)
            }
            
        }
        task.resume()
        
    }
    
}
