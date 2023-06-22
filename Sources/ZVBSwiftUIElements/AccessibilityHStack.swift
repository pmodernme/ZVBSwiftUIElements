//
//  AccessibilityHStack.swift
//  
//
//  Created by Zoe Van Brunt on 4/20/22.
//

import SwiftUI

@available(iOS 14.0, *)
struct AccessibilityHStack<Content: View>: View {
    init(hStackAlignment: VerticalAlignment = .center, vStackAlignment: HorizontalAlignment = .center, compactThreshold: ContentSizeCategory = .extraExtraExtraLarge, regularThreshold: ContentSizeCategory = .accessibilityExtraExtraExtraLarge, spacing: CGSize? = nil, @ViewBuilder content: () -> Content) {
        self.hStackAlignment = hStackAlignment
        self.vStackAlignment = vStackAlignment
        self.compactThreshold = compactThreshold
        self.regularThreshold = regularThreshold
        self.spacing = spacing
        self.content = content()
    }
    
    @Environment(\.sizeCategory) var sizeCategory
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var hStackAlignment: VerticalAlignment
    
    var vStackAlignment: HorizontalAlignment
    
    var compactThreshold: ContentSizeCategory
    
    var regularThreshold: ContentSizeCategory
    
    var spacing: CGSize?
    
    var content: Content
    
    var body: some View {
        if horizontalSizeClass == .compact && sizeCategory > compactThreshold
            || horizontalSizeClass == .regular && sizeCategory > regularThreshold {
            VStack(alignment: vStackAlignment, spacing: spacing?.height) {
                content
            }
        } else {
            HStack(alignment: hStackAlignment, spacing: spacing?.width) {
                content
            }
        }
    }
}
