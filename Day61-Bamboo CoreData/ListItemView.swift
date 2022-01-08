//
//  UserListItemView.swift
//  Bamboo
//
//  Created by Mac on 7.01.2022.
//

import SwiftUI

struct UserListItemView: View {
    let user: CachedUser
    var body: some View {
        HStack {
            Rectangle()
                .foregroundColor(user.isActive ? Color.green : Color.red)
                .frame(width: 4)
            VStack(alignment:.leading) {
                Text(user.wrappedName).font(.headline)
                Spacer()
                HStack {
                    Image(systemName: "building.2")
                        .foregroundColor(.blue)
                        .font(.caption.bold())
                    Text(user.wrappedCompany).font(.caption.bold())
                }.opacity(0.5)
            }
            Spacer()
            ZStack {
                Image(systemName: "person.2.circle.fill")
                    .font(.system(size: 35))
                    .foregroundColor(.primary.opacity(0.6))
                ZStack{
                    Image(systemName: "circle.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                        .offset(x: -14, y: 14)
                    Image(systemName: "\(user.numberFriends).circle.fill")
                        .font(.system(size: 22))
                        .offset(x: -14, y: 14)
                        .foregroundColor(.primary.opacity(0.8))

                }
            }
        }
    }
}
