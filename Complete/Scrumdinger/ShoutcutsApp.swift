//
//  ShoutcutsApp.swift
//  Scrumdinger
//
//  Created by Siyuan Xu on 2022/4/17.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var shortcuts = Shortcut.sampleData
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ShortcutView(shortcuts: $shortcuts)
            }
        }
    }
}
