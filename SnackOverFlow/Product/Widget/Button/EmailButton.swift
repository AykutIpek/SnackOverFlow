//
//  EmailButton.swift
//  SnackOverFlow
//
//  Created by aykut ipek on 6.06.2023.
//

import SwiftUI

struct EmailButton: View {
    var onTap: () -> Void
    
    var body: some View {
        Button {
            
        } label: {
            HStack {
                Spacer()
                Text(LocaleKeys.Auth.custom.rawValue.locale())
                Spacer()
            }
            .tint(.white)
            .font(.system(size: FontSizes.headline, weight: .semibold))
            .padding(.all, PagePadding.All.normal.rawValue)
        }
            .buttonBorderShape(.roundedRectangle)
            .controlSize(.large)
            .background(Color.peach)
            .cornerRadius(RadiusItems.radius)
    }
}

struct EmailButton_Previews: PreviewProvider {
    static var previews: some View {
        EmailButton(onTap: {})
    }
}
