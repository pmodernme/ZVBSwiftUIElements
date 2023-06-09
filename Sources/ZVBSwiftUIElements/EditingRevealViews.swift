//
//  EditingButtons.swift
//  
//
//  Created by Zoe Van Brunt on 3/14/23.
//

import SwiftUI

public struct EditingRevealViews<LeftItems: View, RightItems: View>: ViewModifier {
    
    var spacing: CGFloat?
    
    @ViewBuilder var leftItems: LeftItems
    @ViewBuilder var rightItems: RightItems

    @Environment(\.editMode) private var editMode
    private var isEditing: Bool { editMode?.wrappedValue == .active }
    
    public func body(content: Content) -> some View {
        HStack(spacing: spacing) {
            if isEditing {
                leftItems
                    .transition(.opacity)
                    .zIndex(0)
            }
            content
                .frame(maxWidth: .infinity)
                .zIndex(1)
            if isEditing {
                rightItems
                    .transition(.opacity)
                    .zIndex(0)
            }
        }
    }
}

public extension View {
    func editingRevealViews<LeftItems: View, RightItems: View>(
        spacing: CGFloat? = nil,
        @ViewBuilder leftItems: () -> LeftItems = { EmptyView() },
        @ViewBuilder rightItems: () -> RightItems = { EmptyView() }
    ) -> ModifiedContent<Self, EditingRevealViews<LeftItems, RightItems>> {
        modifier(EditingRevealViews(spacing: spacing, leftItems: leftItems, rightItems: rightItems))
    }
}

#if DEBUG
@available(iOS 16.0, *)
struct EditingRevealViews_Previews: PreviewProvider {
    static var previews: some View {
        Container()
    }
    
    struct Container: View {
        @State var editMode: EditMode = .inactive
        
        var body: some View {
            NavigationView {
                LazyVStack {
                    center
                        .editingRevealViews(
                            spacing: 0,
                            leftItems: { left },
                            rightItems: { right }
                        )
                    center
                        .editingRevealViews(
                            leftItems: { left }
                        )
                    center
                        .editingRevealViews(
                            rightItems: { right }
                        )
                }
                .padding()
                .toolbar {
                    EditButton()
                }
                .environment(\.editMode, $editMode)
            }
        }
        
        var center: some View {
            Text("Center")
                .frame(maxWidth: .infinity)
                .padding()
                .background(.green)
        }
        
        var left: some View {
            Text("Left")
                .padding()
                .background(.red)
        }
        
        var right: some View {
            Text("Right")
                .padding()
                .background(.blue)
        }
    }
}
#endif
