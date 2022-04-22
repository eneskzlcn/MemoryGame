//
//  TodoApp.swift
//  Todo
//
//  Created by Nazif Enes Kızılcin on 14.04.2022.
//

import SwiftUI

@main
struct MemoryApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    
    }
}
