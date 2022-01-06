//
//  UserRow.swift
//  Bamboo
//
//  Created by Mac on 7.01.2022.
//

import Foundation
import SwiftUI

struct UserRow: View {
    var user: User
    
    var body: some View {
        HStack {
            Rectangle()
                .foregroundColor(user.isActive ? Color.green : Color.red)
                .frame(width: 4)
            VStack(alignment:.leading) {
                Text(user.name).font(.title2)
                HStack {
                    Image(systemName: "building.2")
                        .foregroundColor(.blue)
                        .font(.title3)
                    Text(user.company).font(.subheadline.bold())
                }.opacity(0.5)
            }
            Spacer()
            ZStack {
                Image(systemName: "person.2.circle.fill")
                    .font(.system(size: 40))
                ZStack{
                    Image(systemName: "circle.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 27))
                        .offset(x: -15, y: 15)
                    Image(systemName: "\(user.numberFriends).circle.fill")
                        .font(.system(size: 23))
                        .offset(x: -15, y: 15)
                }
            }
        }
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(id: "as9jiq-ajj", name: "Amber Smith", age: 27, company: "swift", email: "swift@apple.com", address: "apple, ca", about: "ekj fi fjdd siru qow dur ki", tags: [], friends: [], isActive: false)
        return UserRow(user: user)
    }
}
