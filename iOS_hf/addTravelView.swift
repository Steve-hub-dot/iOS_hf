//
//  addTravelView.swift
//  iOS_hf
//
//  Created by Isti on 2024. 11. 27..
//

import SwiftUI
import CoreData

struct addTravelView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var newItem : Item
    
    init(newItem: Item? = nil) {
            if let newItem = newItem {
                self._newItem = State(initialValue: newItem)
            } else {
                let context = PersistenceController.preview.container.viewContext
                let item = Item(context: context)
                item.name = ""
                item.date = Date()
                self._newItem = State(initialValue: item)
            }
        }
    
    var body: some View {
        HStack{
            VStack{
                TextField("Name", text: Binding(get: { newItem.name ?? ""},
                                                set: { newItem.name = $0}
                                               ))
                .frame(width: 50.0)
                .onSubmit {
                    self.newItem.name = ""
                }
                //TO-DO: Date
                TextField("Distance", text: Binding(get: { newItem.distance.description ?? "0.0"},
                                                    set: {newItem.distance = Float($0)!}
                                                   ))
                .frame(width: 50.0)
                .onSubmit {
                    self.newItem.distance = 0.0
                }
                //TO-DO: Location
                //TO-DO: Details
                Spacer().frame(height: 50)
                Button(action: doNothing) {
                    Label("Add new item", systemImage: "plus")
                }
            }
        }
    }
}


func doNothing() {
    return
}
#Preview {
    addTravelView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
