//
//  HomeView.swift
//  Iskoci
//
//  Created by Vukasin Popovic on 9.10.23..
//

import SwiftUI

struct HomeView: View {
    
    @State var viewModel = HomeViewModel()
    var body: some View {
        NavigationBar{
            VStack(alignment: .leading, spacing: 0){
                HederView(viewModel.title)
                segmentPicker
                sortingMenu
//                eventList
                EventsList(events: viewModel.events, onEndOfList: {
                    Task{await viewModel.getNextPage()}
                    
                },onFavorite: {event in
                    viewModel.handleFavorites(event)
                })
            }
            .refreshable {
                
            }
            
            .onAppear {
               viewModel.fetchEvents()
            }
            .background(.primaryBackground)
            .navigationDestination(for: Event.self){event in
                DetaildEvenView(event: event)
            }
            .navigationTitle("Nazad")
        }
    }
    
    
    
    // MARK: - Propeties
    

    private var headerView: some View {
        Text(viewModel.title)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 3, leading: 16, bottom: 8, trailing: 0))
            .foregroundStyle(.white)
            .font(.system(size: 34, weight: .bold))
            .background(.tabBarBackground)
    }
    
    private var segmentPicker: some View {
        Picker("Selecting event category", selection: $viewModel.selectedEventType) {
            ForEach(EventType.allCases, id: \.self) { eventType  in
                Text(eventType.title)            }
        }
        .pickerStyle(.segmented)
        .padding()
    }
    
    
    
    private var sortingMenu: some View {
        Picker("Selecting sorting order", selection: $viewModel.selectedEventType) {
            ForEach(SortingOrder.allCases, id: \.self) {sorting in
                Text(sorting.title)
            }
        }
        .padding(.trailing, 16)
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

#Preview {
    HomeView()
}
//endOfList: {
//    Task{await viewModel.getNextPage()}
//}
