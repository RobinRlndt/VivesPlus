//
//  UurroosterDetailView.swift
//  VivesPlus
//
//  Created by Robin Roelandt on 04/11/2025.
//

import SwiftUI

struct UurroosterDetailView: View {
    var selectedEvent: EventModel

    var body: some View {
        VStack {
            // Title section - takes full width
            Text(selectedEvent.title)
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity)
                .background(.tint)
                .cornerRadius(15)
                .foregroundStyle(.white)
                .padding(.bottom)

            Divider()

            Text(selectedEvent.location)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)

            Grid(alignment: .leading) {
                GridRow {
                    Text("Start")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(DateUtil.formatDateTime(date: selectedEvent.startDateTime))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                GridRow {
                    Text("Einde")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(DateUtil.formatDateTime(date: selectedEvent.endDateTime))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }

            Spacer()
        }
        .padding()
        .toolbar {
            NavigationLink(destination: UpdateEventView()) {
                Image(systemName: "ellipsis.circle")
            }
        }
        .navigationTitle("Uurrooster detail")
        // Make VStack expand to fill available space
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}




