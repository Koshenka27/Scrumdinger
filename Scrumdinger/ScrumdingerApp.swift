//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Logan Koshenka on 8/29/21.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.data
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
