//
//  ContentView.swift
//  worepress
//
//  Created by cafehaus on 2022/8/21.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .onTapGesture {
                    self.selectedTab = 1
                }
                .tabItem {
                    Image(systemName: "text.book.closed")
                    Text("首页")
                }
                .tag(0)
            CategoryView()
                .tabItem {
                    Image(systemName: "circle.grid.2x2")
                    Text("分类")
                }
                .tag(1)
        }
        .accentColor(Color(hex:0xfd8f45))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
