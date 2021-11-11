//
//  NewsFeedApp.swift
//  NewsFeed
//
//  Created by Sri Badrinath on 8/11/21.
//

import SwiftUI

@main
struct NewsFeedApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
            .navigationBarHidden(true)
        }
    }
}
