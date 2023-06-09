//
//  MainTabview.swift
//  SnackOverFlow
//
//  Created by aykut ipek on 9.06.2023.
//

import SwiftUI

struct MainTabview: View {
    var body: some View {
        TabView{
            ForEach(HomeTabItem.tabItems) { item in
                item.page.tabItem {
                    TabIconLabel(model: item.model)
                }
            }
        }.tint(.peach)
    }
}

struct MainTabview_Previews: PreviewProvider {
    static var previews: some View {
        MainTabview()
    }
}

private struct TabIconLabel: View {
    let model: TabModel
    var body: some View {
        VStack{
            Image(model.icon.rawValue)
            Text(model.title.rawValue.locale())
        }
    }
}
