//
//  MyView.swift
//  Scrumdinger
//
//  Created by Siyuan Xu on 2022/4/17.
//

import SwiftUI

struct MyView: View {
    @Binding var shortcut: Shortcut
    @State private var data = Shortcut.Data()
    @State private var isPresentingEditView = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Actions")){
                    List {
                        ForEach($shortcut.action) { $a in
                            TextField("haha", text:$a.name)
                            }
                    }
                }
            }
            .navigationTitle(shortcut.name)
            .toolbar {
                Button("Edit") {
                    isPresentingEditView = true
                    data = shortcut.data
                }
            }
            .sheet(isPresented: $isPresentingEditView) {
                NavigationView {
                    MyEditView(options: Option.SampleOptions, data: $data)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isPresentingEditView = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Done") {
                                    isPresentingEditView = false
                                    shortcut.update(from: data)
                                }
                            }
                        }
                }
            }
        }
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView(shortcut: .constant(Shortcut.sampleData[0]))
    }
}
