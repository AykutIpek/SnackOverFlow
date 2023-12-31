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
                Text(LocaleKeys.Auth.facebook.rawValue.locale())
                Spacer()
            }
            .tint(.white)
            .font(.title3)
            .padding(.all, PagePadding.All.normal.rawValue)
        }
            .buttonBorderShape(.roundedRectangle)
            .controlSize(.large)
            .background(Color.deepSkyBlue)
            .cornerRadius(RadiusItems.radius)
    }
}


struct FacebookView_Previews: PreviewProvider {
    static var previews: some View {
        FacebookButton(onTap: {})
    }
}
