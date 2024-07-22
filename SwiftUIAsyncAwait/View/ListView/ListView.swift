//
//  ListView.swift
//  SwiftUIAsyncAwait
//
//  Created by Rohit Kumar on 19/07/2024.
//

import SwiftUI

struct ListView: View {
    var user: UserModel
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name: \(user.name ?? "")")
            Text("Username: \(user.username ?? "")")
            Text("Email: \(user.email ?? "")")
            Text("Phone: \(user.phone ?? "")")
            Text("Website: \(user.website ?? "")")
            Text("Company: \(user.company?.name ?? "")")
        }
    }
}

#Preview {
    ListView(user: UserModel(id: 1, name: "Rohit", username: "Rohit Kumar", email: "test@test.com", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "12312", website: "www.", company: Company(name: "Oasis Livestock", catchPhrase: "", bs: "")))
}
