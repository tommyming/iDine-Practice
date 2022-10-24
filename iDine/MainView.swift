//
//  MainView.swift
//  iDine
//
//  Created by tommyhan on 24/10/2022.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
                .environmentObject(order)
            
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
                .environmentObject(order)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Order())
    }
}
