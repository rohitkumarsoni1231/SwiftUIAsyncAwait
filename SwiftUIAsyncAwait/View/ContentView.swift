//
//  ContentView.swift
//  SwiftUIAsyncAwait
//
//  Created by Rohit Kumar on 19/07/2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = UserViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.users) { user in
                    ListView(user: user)
                }
            }
        }.onAppear() {
            viewModel.fetchUser()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
