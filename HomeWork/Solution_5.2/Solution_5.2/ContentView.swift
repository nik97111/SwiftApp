//
//  ContentView.swift
//  Solution_5.2
//
//  Created by Николай Чупреев on 13.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showNews = false
    
    var body: some View {
        if showNews {
            NewTableView()
        } else {
            Text("Последние новости")
                .onTapGesture {
                    showNews = true // переключение состояния для отображения новостей
                }
        }
    }
}

#Preview {
    ContentView()
}
