//
//  ContentView.swift
//  friendface
//
//  Created by Godwin IE on 20/02/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List($viewModel.users, id: \.id) { user in
                   // ForEach (viewModel.profiles, id: \.id) { profile in
                        
                        NavigationLink{
                            DetailView(user: user.wrappedValue)
                        } label: {
                            HStack(spacing: 18){
                                Image(systemName: "person.crop.circle")
                                    .font(.title)
                                    .foregroundStyle(.gray)
                                VStack(alignment: .leading){
                                    Text(user.name.wrappedValue)
                                        .font(.title2)
                                    Text(user.email.wrappedValue)
                                    
                                    
                                }
                            }
                        }
                        
                    
                }
            }
            .navigationTitle("Friend face")
            .onAppear{
                viewModel.fetch()
            }
        }
    }


#Preview {
    ContentView()
}
