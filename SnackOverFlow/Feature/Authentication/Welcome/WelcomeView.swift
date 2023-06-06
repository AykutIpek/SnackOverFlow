//
//  WelcomeView.swift
//  SnackOverFlow
//
//  Created by aykut ipek on 6.06.2023.
//

import SwiftUI


struct WelcomeView: View {
    var body: some View {
        
        ZStack {
            Image(Images.juice.rawValue).resizable()
            Color.black.opacity(0.3)
            BodyView()
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView().edgesIgnoringSafeArea(.all)
    }
}


struct BodyView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Image(Icons.appLogo.rawValue)
                Spacer()
                FacebookButton(onTap: {}).padding(Edge.Set.top, PagePadding.All.normal.rawValue)
                GoogleButton(onTap: {})
                AppleButton(onTap: {})
                Divider()
                    .background(Color.peach)
                    .frame(width: geometry.dw(width: 0.6),
                        height: DividerViewSize.normal)
                    .padding(.all, PagePadding.All.normal.rawValue)
                EmailButton(onTap: {})
                Spacer().frame(height: geometry.dh(height: 0.1))
            }.padding(.paddingAll)
        }
    }
}
