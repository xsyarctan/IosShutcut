//
//  Options.swift
//  Scrumdinger
//
//  Created by Siyuan Xu on 2022/4/17.
//

import Foundation

struct Option: Identifiable {
    let id: UUID
    var name: String
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}

extension Option {
    static let SampleOptions: [Option] =
    [
        Option(name: "Cathy"), Option(name: "Daisy"), Option(name: "Simon"), Option(name: "Jonathan"),
        Option(name: "Katie"), Option(name: "Gray"), Option(name: "Euna"), Option(name: "Luis"), Option(name: "Darla")
    ]
}
