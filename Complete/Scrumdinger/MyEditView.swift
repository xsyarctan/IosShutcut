//
//  MyEditView.swift
//  Scrumdinger
//
//  Created by Siyuan Xu on 2022/4/17.
//

import SwiftUI

struct MyEditView: View {
    let options: [Option]
    @Binding var data: Shortcut.Data
    @State var isEditing = false
    
    var body: some View {
        Form {
            Section(header: Text("Name")) {
                TextField("Name", text: $data.name)
                    .font(.headline)
            }
            Section(header: Button(action: {
                self.isEditing.toggle()
            }) {
                Text(isEditing ? "Done" : "Edit")
            }.frame(maxWidth: .infinity, alignment: .trailing)
                        .overlay(Text("Action"), alignment: .leading)){
                    List {
                        ForEach(data.action) { a in
                            Text(a.name)
                        }
                        .onMove(perform: { IndexSet, index in
                            data.action.move(fromOffsets: IndexSet, toOffset: index)
                        })
                        .onDelete { indices in
                            data.action.remove(atOffsets: indices)
                        }
                    }
            }
            Section (header: Text("Options")){
                List {
                    ForEach(options) { option in
                        addAction(data: $data, option: option.name)
                    }
                }
            }
        }
        .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive))
    }
}

struct MyEditView_Previews: PreviewProvider {
    static var previews: some View {
        MyEditView(options: Option.SampleOptions, data: .constant(Shortcut.sampleData[0].data))
    }
}
