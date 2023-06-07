//
//  TextFieldModifiers.swift
//  SnackOverFlow
//
//  Created by aykut ipek on 7.06.2023.
//

import SwiftUI

struct TextFieldModifiers: ViewModifier{
    func body(content: Content) -> some View {
        return content.padding()
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2))
            .foregroundColor(Color.carl)
    }
}
