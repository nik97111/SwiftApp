//
//  TopView.swift
//  Solution_5.2
//
//  Created by Николай Чупреев on 15.12.2023.
//

import SwiftUI

struct TopView : View {
    
    var user: UserResponse
    
    var body: some View {
        HStack(spacing: 8.0) {
            VStack(alignment: .leading, spacing: 4.0) {
                Text(user.title)
                    .font(.title)
            }
        }
    }
}

#Preview {
    TopView(user: userResponse[2])
}
