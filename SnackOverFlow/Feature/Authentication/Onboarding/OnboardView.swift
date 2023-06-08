//
//  OnboardView.swift
//  SnackOverFlow
//
//  Created by aykut ipek on 7.06.2023.
//

import SwiftUI

struct OnboardView: View {
    @State private var currentIndex: Int = 0
    @StateObject var onboardViewModel = OnboardViewModel()
    /// Dummy List Count
    /// - Returns: Total Item Count Without Last Item
    private func count() -> Int {
        OnboardModel.items.count - 1
    }
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack{
                    Spacer()
                    TabView(selection: $onboardViewModel.currentIndex) {
                        ForEach(0...count(), id: \.self) { value in
                            SliderCard(imageHeight: geometry.dh(height: 0.45), model: OnboardModel.items[value])
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .frame(height: geometry.dh(height: 0.6))
                    Spacer()
                    HStack{
                        ForEach((0...count()), id: \.self) { index in
                            if(index == onboardViewModel.currentIndex){
                                IndicatorRectangle(width: geometry.dw(width: 0.06))
                            }else{
                                IndicatorRectangle(width: geometry.dw(width: 0.02))
                            }
                        }
                    }.frame(height: ViewSize.indicator)

                    NavigationLink {
                        WelcomeView()
                            .toolbar(.hidden)
                            .ignoresSafeArea(.all)
                    } label: {
                        NormalButton(onTap: {
                            onboardViewModel.saveUserLoginAndRedirect()
                        }, title: LocaleKeys.Buttons.getStarted.rawValue)
                        .padding(.all, PagePadding.All.normal.rawValue)
                    }.onAppear{
                        onboardViewModel.checkUserFirstTime()
                    }
                }
            }
        }.navigationDestination(isPresented: $onboardViewModel.isHomeRedirect) {
            WelcomeView()
        }
    }
}

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView()
    }
}

private struct IndicatorRectangle: View {
    var width: Double
    var body: some View {
        Rectangle()
            .fill(Color.coolney)
            .frame(width: width)
            .cornerRadius(RadiusItems.radius)
    }
}

private struct SliderCard: View {
    var imageHeight: Double
    let model: OnboardModel
    var body: some View {
        VStack{
            Image(model.imageName).frame(height: imageHeight)
            Text(model.description)
                .font(.system(size: FontSizes.largeTitle, weight: .semibold))
                .multilineTextAlignment(.center)
                .foregroundColor(Color.peach)
        }
    }
}
