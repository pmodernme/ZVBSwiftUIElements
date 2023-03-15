//
//  Buttons.swift
//  
//
//  Created by Zoe Van Brunt on 9/22/22.
//

import SwiftUI

@available(iOS 15.0, *)
struct ImageButton: View {
    
    var role: ButtonRole? = nil
    
    var image: Image
    
    var action: () -> Void
    
    var body: some View {
        Button(role: role) {
            action()
        } label: {
            image
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .padding(8)
                .frame(width: 44, height: 44)
        }
    }
}

@available(iOS 15.0, *)
struct AddButton: View {
    
    var action: () -> Void
    
    var body: some View {
        ImageButton(image: Image("add_circle", bundle: .module)) {
            action()
        }
        .foregroundColor(.green)
    }
}

@available(iOS 15.0, *)
struct RemoveButton: View {
    
    var action: () -> Void
    
    var body: some View {
        ImageButton(role: .destructive, image: Image("remove", bundle: .module)) {
            action()
        }
    }
}
