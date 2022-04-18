//
//  ShortcutView.swift
//  Scrumdinger
//
//  Created by Siyuan Xu on 2022/4/17.
//

import SwiftUI

struct ShortcutView: View {
    @Binding var shortcuts: [Shortcut]
    @State private var data = Shortcut.Data()
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            ForEach($shortcuts) { $short in
                NavigationLink(destination: MyView(shortcut: $short)) {
                    MyCardView(shortcut: $short)
                }
                .listRowBackground(short.theme.mainColor)
            }
        }
        .navigationTitle("Shortcuts")
        .toolbar {
            Button(action: {
                isPresentingEditView = true
            }) {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                MyEditView(options: Option.SampleOptions, data: $data)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                                data = Shortcut.Data()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                let shortcut = Shortcut(data:data)
                                data = Shortcut.Data()
                                shortcuts.append(shortcut)
                            }
                        }
                    }
            }
        }
    }
}

struct ShortcutView_Previews: PreviewProvider {
    static var previews: some View {
        ShortcutView(shortcuts: .constant(Shortcut.sampleData))
    }
}
