//
//  ContentView.swift
//  DammyJson
//
//  Created by Joonatan De Pascale on 16.5.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            UserList()
        }
    }
}

struct UserList: View {
    @State var users: Users?
    var fetch = FetchTools()
    var body: some View {
        
        VStack {
            List {
                if let usersData: Users = users {
                    ForEach(usersData.users, id: \.id) { user in
                        Text("\(user.firstName) \(user.lastName)")
                            .padding(0)
                        
                    }
                    
                } else {
                    ProgressView()
                }
            }
            .padding(0)
            .onAppear() {
                fetch.getData(url: URLComponents(string: "https://dummyjson.com/users?limit=0")!) { data in
                    users = data
                    print(data)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
