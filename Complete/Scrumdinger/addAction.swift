//
//  addAction.swift
//  Scrumdinger
//
//  Created by Siyuan Xu on 2022/4/17.
//

import SwiftUI

struct addAction: View {
    @Binding var data: Shortcut.Data
    let option: String
    var body: some View {
        HStack {
            Text(option)
            Spacer()
            Button(action: {
                withAnimation {
                    let action = Shortcut.Action(name: option)
                    data.action.append(action)
                }
            }) {
                Image(systemName: "plus")
            }
        }
    }
}

struct addAction_Previews: PreviewProvider {
    static var previews: some View {
        addAction(data: .constant(Shortcut.sampleData[0].data), option: "A")
    }
}
