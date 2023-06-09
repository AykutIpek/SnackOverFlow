//
//  ViewStatusHiddenModifier.swift
//  SnackOverFlow
//
//  Created by aykut ipek on 9.06.2023.
//

import Foundation
import SwiftUI


/// Toolbar Hidden for any view
struct ViewStatusHiddenModifier: ViewModifier {
    @ViewBuilder
    func body(content: Content) -> some View {
        content.toolbar(.hidden, for: .automatic)
    }
}
