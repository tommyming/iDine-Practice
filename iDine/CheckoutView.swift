//
//  CheckoutView.swift
//  iDine
//
//  Created by tommyhan on 24/10/2022.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    // Mutable Value within the struct, this view only
    // Binding onto the view itself
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    
    let tipAmounts = [10, 15, 20, 25, 0]
    
    var body: some View {
        Form {
            Section {
                // Binding Setup, which points to the state variable
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
            }
            
            Toggle("Add iDine loyalty Card", isOn: $addLoyaltyDetails.animation())
            
            if addLoyaltyDetails {
                TextField("Enter your iDine ID", text: $loyaltyNumber)
            }
            
            Section {
                Picker("Percentage: ", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Add a tip?")
            }
            
            Section {
                Button("Confirm Order") {
                    
                }
            } header: {
                Text("TOTAL: $100")
            }


        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckoutView()
                .environmentObject(Order())
        }
    }
}
