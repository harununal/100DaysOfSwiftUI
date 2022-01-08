//
//  UserDetailView.swift
//  Bamboo
//
//  Created by Mac on 7.01.2022.
//

import CoreData
import SwiftUI

struct UserDetailView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.name),
        SortDescriptor(\.age)
    ]) var users: FetchedResults<CachedUser>
    
    let user: CachedUser
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 10) {
                
                VStack (alignment: .leading, spacing: 5) {
                    HStack (alignment: .bottom, spacing: 20) {
                        Text(user.wrappedName)
                            .font(.system(size: 30))
                            .opacity(0.9)
                        
                        Text(user.isActive ? "online" : "offline")
                            .foregroundColor(user.isActive ? .green : .red)
                            .font(.headline.bold())
                    }
                    
                    VStack (alignment: .leading) {
                        HStack (spacing: 5) {
                            Text("\(user.age)")
                                .fontWeight(.semibold)
                                .opacity(0.9)
                            Text("years")
                                .opacity(0.7)
                        }
                        Text(user.wrappedEmail)
                            .opacity(0.8)
                    }
                }
                
                Spacer()
                
                Section {
                    Text(user.wrappedAbout)
                } header: {
                    Text("About")
                        .foregroundColor(.secondary)
                        .font(.title3)
                }
                
                
                Spacer()
                
                Section {
                    Text(user.wrappedAddress)
                } header: {
                    HStack {
                        Image(systemName: "building.2.crop.circle")
                            .foregroundColor(.secondary)
                            .font(.title3)
                        Text(user.wrappedCompany)
                            .foregroundColor(.secondary)
                            .font(.title3)
                    }
                }
                
                Spacer()
                
                Section {
                    Text(user.wrappedTags)
                } header: {
                    HStack {
                        Image(systemName: "tag.circle")
                            .foregroundColor(.secondary)
                            .font(.title3)
                        Text("Tags")
                            .foregroundColor(.secondary)
                            .font(.title3)
                    }
                }
                
                Spacer()
                
                Section {
                    ForEach(user.wrappedFriends, id: \.id) { friend in
                        NavigationLink {
                            UserDetailView(user: getUserBy(id: friend.id))
                        } label: {
                            Text(friend.wrappedName)
                        }
                    }
                } header: {
                    HStack {
                        Image(systemName: "person.circle")
                            .foregroundColor(.secondary)
                            .font(.title3)
                        Text("Friends")
                            .foregroundColor(.secondary)
                            .font(.title3)
                    }
                }
            }
            .padding(20)
        }
        .navigationTitle(user.wrappedName)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func getUserBy(id: UUID) -> CachedUser{
        if let user = users.first(where: { user in
            user.id == id
        }) {
            return user
        } else {
            return users.randomElement()!
        }
    }
}
