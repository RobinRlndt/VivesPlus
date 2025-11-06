//
//  UurroosterList.swift
//  VivesPlus
//
//  Created by Robin Roelandt on 04/11/2025.
//

import SwiftUI

struct UurroosterList: View {
    @State var loading = true
    @State var selectedEvent: EventModel?
    @Environment(UurroosterDataStore.self) var uurroosterDataStore
    
    var body: some View {
        NavigationSplitView {
            if loading {
                ProgressView("loading...")
            } else {
                List(uurroosterDataStore.uurrooster, id: \.self, selection: $selectedEvent) { event in
                    Divider()
                    VStack(alignment: .leading) {
                        Text("\(DateUtil.formatDateTime(date: event.startDateTime))").font(.title2)
                        Text("\(event.title)").font(.title)
                    }
                    
                }.toolbar {
                    NavigationLink(destination: AddEventView()) {
                        Image(systemName: "plus")
                    }
                    
                }
            }
        } detail: {
            if let selectedEvent = selectedEvent {
                UurroosterDetailView(selectedEvent: selectedEvent)
            }
            }.task {
                await uurroosterDataStore.loadData()
                loading = false
        }
            .navigationTitle("Uurrooster ")
    }
}

#Preview {
    UurroosterList()
}
