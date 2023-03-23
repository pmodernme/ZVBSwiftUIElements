//
//  ModelLifetimeProtocol.swift
//  
//
//  Created by Zoe Van Brunt on 10/4/22.
//

import SwiftUI

public protocol ModelLifetimeProtocol {
    func onAppear()
    func onDisappear()
}

public extension View {
    
    func lifetime(model: Any?) -> some View {
        modifier(ModelLifetimeModifier(model: model))
    }
    
}

struct ModelLifetimeModifier: ViewModifier {
    var model: Any?
    
    func body(content: Content) -> some View {
        content
            .onAppear(perform: unwrappedModel?.onAppear)
            .onDisappear(perform: unwrappedModel?.onDisappear)
    }
    
    private var unwrappedModel: ModelLifetimeProtocol? {
        model as? ModelLifetimeProtocol
    }
}
