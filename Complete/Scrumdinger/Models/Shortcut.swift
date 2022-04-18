//
//  Shortcut.swift
//  Scrumdinger
//
//  Created by Siyuan Xu on 2022/4/17.
//
import Foundation

struct Shortcut: Identifiable {
    let id: UUID
    var name: String
    var action: [Action]
    var theme: Theme
    
    init(id: UUID = UUID(), name: String, action: [String], theme: Theme) {
        self.id = id
        self.name = name
        self.action = action.map{Action (name: $0)}
        self.theme = theme
    }
    init(id: UUID = UUID(), data: Data) {
        self.id = id
        self.name = data.name
        self.action = data.action
        self.theme = data.theme
    }
}

extension Shortcut {
    struct Action: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    struct Data {
        var name: String = ""
        var action: [Action] = []
        var theme: Theme = .seafoam
    }
    
    var data: Data {
        Data(name: name, action: action, theme: theme)
    }
    
    mutating func update(from data: Data) {
        name = data.name
        action = data.action
        theme = data.theme
    }
}

extension Shortcut {
    static let sampleData: [Shortcut] =
    [
        Shortcut(name: "shortcut 1", action: ["Cathy", "Daisy", "Simon", "Jonathan"], theme: .yellow),
        Shortcut(name: "shortcut 2", action: ["Katie", "Gray", "Euna", "Luis", "Darla"], theme: .orange),
        Shortcut(name: "shortcut 3", action: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], theme: .poppy)
    ]
}

