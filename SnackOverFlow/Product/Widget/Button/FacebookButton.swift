//
//  FacebookButton.swift
//  SnackOverFlow
//
//  Created by aykut ipek on 6.06.2023.
//

import SwiftUI


private enum StringItems: String{
    case facebookLogin = "Sign In with Facebook"
}

struct FacebookButton: View {
    var onTap: () -> Void
    
    var body: some View {
        Button {
            
        } label: {
            HStack {
                Image(IconItems.Social.facebook.rawValue)
                Text(StringItems.facebookLogin.rawValue)
                Spacer()
            }
            .tint(.white)
            .background(Color.deepSkyBlue)
        }.buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle)
            .controlSize(.large)
    }
}
