//
//  OnboardModle.swift
//  SnackOverFlow
//
//  Created by aykut ipek on 7.06.2023.
//

import Foundation


struct OnboardModel: Identifiable{
    var id: UUID = UUID()
    let imageName: String
    let description: String
    
    static let items: [OnboardModel] = [
        OnboardModel(imageName: "img_handpick", description: "Hand-pickle high quality snacks."),
        OnboardModel(imageName: "img_shop", description: "Shop global. Mind-blownly affordable."),
        OnboardModel(imageName: "img_deliever", description: "Deliver on the promise of time.")
    ]
}
