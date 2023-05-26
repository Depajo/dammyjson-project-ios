//
//  ContentView.swift
//  DammyJson
//
//  Created by Joonatan De Pascale on 16.5.2023.
//

import SwiftUI

/// `ContentView` is a SwiftUI view that displays a list of users.
///
/// This view contains a search bar for searching users, a list of users, and a navigation bar button for adding new users.
struct ContentView: View {
    /// The list of users displayed in the view.
    @State var users: Users?
    /// The text entered in the search bar.
    @State var searchText: String = ""
    
    var body: some View {
        VStack {
            NavigationStack {
                /// The search bar for searching users.
                SearchBar(users: $users, searchText: $searchText, placeholder: "Search")
                /// A view that is displayed when the user list is empty.
                UserListIsEmpty(users: $users)
                /// The list of users.
                UserList(users: $users)
                    .navigationTitle("Users")
                    .navigationBarBackButtonHidden()
                    .navigationBarItems(trailing:
                            /// A navigation link to the `AddUserView`.
                            NavigationLink(destination: AddUserView()) {
                                Image(systemName: "plus")
                            }
                         )
            }
        }
    }
}

/// A view component that displays a message when user data is empty.
///
/// Use `UserListIsEmpty` to show a message when the user data is empty.
struct UserListIsEmpty: View {
    /// The binding to the user data.
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

/// A view component that displays a list of users and fetches user data from API.
///
/// Use `UserList` to display a list of users and fetch user data from API.
struct UserList: View {
    /// The fetch tool for retrieving user data from API.
    var fetch = FetchTools()
    /// The binding to the user data.
    @Binding var users: Users?
    var body: some View {
        VStack {
            List {
                if let usersData: Users = users {
                    ForEach(usersData.users.sorted { $0.firstName < $1.firstName }, id: \.id) { user in
                        NavigationLink(destination: UserView(user: user)) {
                            Text("\(user.firstName) \(user.lastName)")
                                .padding(.vertical, 5)
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
                    }
                }
            }
        }
    }
}

/// A view component that displays a search bar and fetches user data based on the search text.
///
/// Use `SearchBar` to provide a search bar for filtering user data and fetching data from API.
struct SearchBar: View {
    /// The fetch tool for retrieving user data from API.
    var fetch = FetchTools()
    /// The binding to the user data.
    @Binding var users: Users?
    /// The binding to the search text.
    @Binding var searchText: String
    /// The placeholder text for the search bar.
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
