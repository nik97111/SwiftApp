//
//  NewsTableView.swift
//  Solution_5.2
//
//  Created by Николай Чупреев on 15.12.2023.
//

import SwiftUI

struct NewTableView : View {
    var body: some View {
        NavigationView {
            List(userResponse) { user in
                Cell(user: user)
            }
            .navigationBarTitle(Text("Новости"))
        }
    }
}

#Preview {
    NewTableView()
}
