//
//  Buttons.swift
//  
//
//  Created by Zoe Van Brunt on 9/22/22.
//

import SwiftUI

public extension Button where Label == ButtonImage {
    
    @available(iOS 15.0, *)
    init(buttonImage: Image, role: ButtonRole? = nil, _ action: @escaping () -> Void) {
        self.init(role: role, action: action) {
            ButtonImage(image: buttonImage)
        }
    }
    
    init(buttonImage: Image, _ action: @escaping () -> Void) {
        self.init(action: action) {
            ButtonImage(image: buttonImage)
        }
    }
}

public struct ButtonImage: View {
    
    public var image: Image
    
    public var body: some View {
        image
            .resizable(resizingMode: .stretch)
            .aspectRatio(contentMode: .fill)
            .padding(8)
            .frame(width: 44, height: 44)
    }
    
}
