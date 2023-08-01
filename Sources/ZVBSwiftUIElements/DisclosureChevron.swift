//
//  DisclosureChevron.swift
//  ZoeLog-iOS
//
//  Created by Zoe Van Brunt on 12/31/21.
//  Copyright © 2021 orgName. All rights reserved.
//

import SwiftUI
import LegacyPreviews

@available(iOS 13.0, *)
public struct DisclosureChevron: View {
    public init() { }
    
    public var body: some View {
        Image(systemName: "chevron.right")
            .font(.caption.weight(.bold))
            .foregroundColor(Color(UIColor.tertiaryLabel))
            .padding(.leading, 4)
    }
}

@available(iOS 15.0, *)
struct DisclosureChevron_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DisclosureChevron()
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
