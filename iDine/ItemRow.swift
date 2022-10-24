//
//  ItemRow.swift
//  iDine
//
//  Created by tommyhan on 24/10/2022.
//

import SwiftUI

struct ItemRow: View {
    let item: MenuItem
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    
    var body: some View {
        NavigationLink(destination: ItemDetail(item: item)) {
            HStack {
                Image(item.thumbnailImage)
                    .clipShape(Circle())
                // This is a new syntax for .overlay, which is different from the context
                    .overlay(alignment: .center) {
                        Circle().stroke(.gray, lineWidth: 2)
                    }
                
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text("$\(item.price)")
                }
                
                Spacer()
                
                ForEach(item.restrictions, id: \.self) { restriction in
                    // Declarative Approach
                    Text(restriction)
                    // (1) Decide the font first
                        .font(.caption)
                        .fontWeight(.black)
                    // (2) Decide the padding of the element
                        .padding(5)
                    // (3) Decide the background of the block
                        .background(colors[restriction, default: .black])
                    // (4) Decide the shape of the block
                        .clipShape(Circle())
                    // (5) Decide the element color of the block
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
