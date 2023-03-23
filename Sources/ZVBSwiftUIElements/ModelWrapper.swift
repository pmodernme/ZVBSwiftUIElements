//
//  ModelWrapper.swift
//  GenericSettingsTest
//
//  Created by Zoe Van Brunt on 4/13/22.
//

#if canImport(Combine)

import Foundation
import Combine

public final class ModelWrapper<Model>: ObservableObject {
    
    public init(
        model: Model,
        publisher: ObjectWillChangePublisher? = nil,
        onAppear: @escaping () -> Void = { },
        onDisappear: @escaping () -> Void = { }
    ) {
        self.model = model
        self.onAppear = onAppear
        self.onDisappear = onDisappear
        
        if let publisher = publisher {
            publisher
                .receive(on: RunLoop.main)
                .sink(receiveValue: objectWillChange.send)
                .store(in: &cancellable)
        }
    }
    
    public var model: Model
    
    let onAppear: () -> Void
    let onDisappear: () -> Void
    
    private var cancellable: Set<AnyCancellable> = []
}

#endif
