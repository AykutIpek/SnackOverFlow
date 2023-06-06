//
//  GoogleButton.swift
//  SnackOverFlow
//
//  Created by aykut ipek on 6.06.2023.
//

import SwiftUI

struct GoogleButton: View {
    var onTap: () -> Void
    
    var body: some View {
        Button {
            
        } label: {
            HStack {
                Image(IconItems.Social.google.rawValue)
                Text(LocaleKeys.Auth.google.rawValue.locale())
                Spacer()
            }
            .tint(.black)
            .font(.title3)
            .padding(.all, PagePadding.All.normal.rawValue)
        }
            .buttonBorderShape(.roundedRectangle)
            .controlSize(.large)
            .background(Color.white)
            .cornerRadius(RadiusItems.radius)
    }
}

struct GoogleButton_Previews: PreviewProvider {
    static var previews: some View {
        GoogleButton(onTap: {})
    }
}
