//
//  ContentView.swift
//  DammyJson
//
//  Created by Joonatan De Pascale on 16.5.2023.
//

import SwiftUI

struct ContentView: View {
    @State var users: Users?
    @State var searchText: String = ""
    
    var body: some View {
        VStack {
            NavigationStack {
                SearchBar(users: $users, searchText: $searchText, placeholder: "Hae")
                UserListIsEmpty(users: $users)
                UserList(users: $users)
                    .navigationTitle("Users")
                    .navigationBarItems(trailing:
                             Button (action: {

                             }) {
                                 Image(systemName: "plus")
                             }
                         )
            }
        }
    }
}

struct UserListIsEmpty: View {
    @Binding var users: Users?
    var body: some View {
        if let usersData = users {
            if usersData.users.isEmpty {
                Text("User data not found")
                    .bold()
            }
        }
    }
}

struct UserList: View {
    var fetch = FetchTools()
    @Binding var users: Users?
    var body: some View {
        VStack {
            List {
                if let usersData: Users = users {
                    
            
                    ForEach(usersData.users.sorted { $0.firstName < $1.firstName }, id: \.id) { user in
                        NavigationLink(destination: UserView(user: user)) {
                            Text("\(user.firstName) \(user.lastName)")
                                .padding(.vertical, 5)
//                                .font(.system(size: 20))
                        }
                        
                    }
                } else {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(0)
            .onAppear() {
                if let url = URLComponents(string: "https://dummyjson.com/users?limit=0") {
                    fetch.getData(url: url) { data in
                        users = data
                        print(data)
                    }
                }
            }
        }
    }
}

struct SearchBar: View {
    var fetch = FetchTools()
    @Binding var users: Users?
    @Binding var searchText: String
    var placeholder: String
    var body: some View {
        TextField(placeholder, text: $searchText)
            .onChange(of: searchText) { newText in
                let text = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
                
                var selectedUrl: URLComponents?
                
                if (searchText != "") {
                    selectedUrl = URLComponents(string: "https://dummyjson.com/users/search?q=\(text)")
                } else {
                    selectedUrl = URLComponents(string: "https://dummyjson.com/users?limit=0")
                }
                
                if let url = selectedUrl {
                    
                    fetch.getData(url: url) { data in
                        users = data
                        print(data)
                    }
                }
            }
            .padding(10)
            .font(.system(size: 20))
            .frame(alignment: .center)
            .background(Color(UIColor.systemGray6).cornerRadius(20))
            .padding(10)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
