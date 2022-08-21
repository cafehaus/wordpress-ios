//
//  wordpress_iosApp.swift
//  wordpress-ios
//
//  Created by cafehaus on 2022/8/20.
//

import SwiftUI

@main
struct wordpress_iosApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: DailyScrum.sampleData)
            }
        }
    }
}
