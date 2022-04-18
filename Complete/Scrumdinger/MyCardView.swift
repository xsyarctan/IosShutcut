//
//  MyCardView.swift
//  Scrumdinger
//
//  Created by Siyuan Xu on 2022/4/17.
//

import SwiftUI

struct MyCardView: View {
    @Binding var shortcut: Shortcut
    var body: some View {
        VStack(alignment: .leading) {
            Text(shortcut.name)
                .font(.headline)
            Spacer()
            Text("\(shortcut.action.count) action")
                .font(.caption)
        }
        .padding()
        .foregroundColor(shortcut.theme.accentColor)
    }
}

struct MyCardView_Previews: PreviewProvider {
    static var previews: some View {
        MyCardView(shortcut: .constant(Shortcut.sampleData[0]))
    }
}
