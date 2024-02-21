//
//  DetailView.swift
//  friendface
//
//  Created by Godwin IE on 21/02/2024.
//

import SwiftUI

struct DetailView: View {
    var profile: Model
    @StateObject var viewModel = ViewModel()
    
    
    var body: some View {
        ScrollView{
            VStack(spacing: 24){
                
                VStack(alignment: .center){
                    Image(systemName: "person.crop.circle")
                        .font(.title)
                        .foregroundStyle(profile.isActive ? .green : .gray)
                    Text(profile.name)
                        .font(.title2)
                    
                }
                
                VStack(alignment: .leading, spacing: 24){
                    VStack(alignment: .leading){
                        Text("Age")
                            .foregroundStyle(.gray)
                        Text(String(profile.age))
                            .font(.title2)
                    }
                    
                    VStack(alignment: .leading){
                        Text("Email")
                            .foregroundStyle(.gray)
                        Text(profile.email)
                            .font(.title2)
                    }
                    
                    VStack(alignment: .leading){
                        Text("Company")
                            .foregroundStyle(.gray)
                        Text(profile.company)
                            .font(.title2)
                    }
                    
                    VStack(alignment: .leading){
                        Text("Address")
                            .foregroundStyle(.gray)
                        Text(profile.address)
                            .font(.title2)
                    }
                    
                    VStack(alignment: .leading){
                        Text("Registered")
                            .foregroundStyle(.gray)
                        Text(profile.registered)
                            .font(.title2)
                    }
                    
                    VStack(alignment: .leading){
                        Text("About")
                            .foregroundStyle(.gray)
                        Text(profile.about)
                            .font(.title2)
                    }
                    
                    VStack(alignment: .leading){
                        Text("Tags")
                            .foregroundStyle(.gray)
                        ScrollView(.horizontal) {
                            HStack{
                                ForEach(0..<profile.tags.count, id: \.self) {index in
                                    Text(profile.tags[index])
                                        .padding(8)
                                        .background(.gray.opacity(0.2))
                                        .clipShape(Capsule())
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading){
                        Text("Friends")
                            .foregroundStyle(.gray)
                        ScrollView(.vertical) {
                            VStack(alignment: .leading) {
                                ForEach(0..<profile.friends.count, id: \.self) {index in
                                    
                                    HStack(spacing: 12){
                                        Image(systemName: "person.crop.circle")
                                            .font(.title)
                                            .foregroundStyle(.gray)
                                        VStack(alignment: .leading){
                                            Text(profile.friends[index].name)
                                                .font(.title2)
                                            
                                            
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    
                    
                }
                .padding()
                // profile details
                
            }
            
        }
    }
}

#Preview {
    DetailView(profile:
                Model(id: "",
                      isActive: true,
                      name: "Name",
                      age: 1,
                      company: "Company",
                      email: "Email",
                      address: "Address",
                      about: "About",
                      registered: "Date",
                      tags: ["Tag", "Tag", "Tag", "Tag"],
                      friends: [Friend(id: "", name: "Name"),
                                Friend(id: "", name: "Name"),
                                Friend(id: "", name: "Name")
                               ]
                     ))
}
