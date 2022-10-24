//
//  iDineApp.swift
//  iDine
//
//  Created by tommyhan on 24/10/2022.
//

import SwiftUI

/**
 Practice Project Link: https://www.hackingwithswift.com/quick-start/swiftui/swiftui-tutorial-building-a-complete-project
 */

@main
struct iDineApp: App {
    // And there is a stateObject, which acts as a pointer to help using the same object (iOS 14 only)
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
