//
//  ContentView.swift
//  friendface
//
//  Created by Godwin IE on 20/02/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.profiles, id: \.id) { profile in                //VStack(alignment: .leading, spacing: 16){
                   // ForEach (viewModel.profiles, id: \.id) { profile in
                        
                        NavigationLink{
                            DetailView(profile: profile)
                        } label: {
                            HStack(spacing: 18){
                                Image(systemName: "person.crop.circle")
                                    .font(.title)
                                    .foregroundStyle(.gray)
                                VStack(alignment: .leading){
                                    Text(profile.name)
                                        .font(.title2)
                                    Text(profile.email)
                                    
                                    
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
