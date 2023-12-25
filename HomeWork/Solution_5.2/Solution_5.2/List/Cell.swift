//
//  Cell.swift
//  Solution_5.2
//
//  Created by Николай Чупреев on 15.12.2023.
//


import SwiftUI

struct Cell : View {
    
    var user: UserResponse
    
    var body: some View {
        VStack(spacing: 16.0) {
            TopView(user: user)
            Text(user.publication_date)
            .lineLimit(nil)
        }.padding()
    }
}

#Preview {
    Cell(user: userResponse[0])
}
