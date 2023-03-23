//
//  ColorCurveViewModel.swift
//  ColorCurveGen_iOS
//
//  Created by Zoe Van Brunt on 10/15/21.
//  Copyright © 2021 orgName. All rights reserved.
//

import Combine
import Foundation
import SwiftUI

public final class MVIContainer<Model, Intent>: ObservableObject {
    
    public init(model: Model,
         intent: Intent,
         modelChangePublisher: ObjectWillChangePublisher? = nil,
         onAppear: @escaping () -> Void = { },
         onDisappear: @escaping () -> Void = { }) {
        self.intent = intent
        self.model = model
        self.onAppear = onAppear
        self.onDisappear = onDisappear
        
        if let modelChangePublisher = modelChangePublisher {
            modelChangePublisher
                .receive(on: RunLoop.main)
                .sink(receiveValue: objectWillChange.send)
                .store(in: &cancellable)
        }
    }
    
    public var intent: Intent
    public var model: Model
    
    let onAppear: () -> Void
    let onDisappear: () -> Void
    
    private var cancellable: Set<AnyCancellable> = []
}
