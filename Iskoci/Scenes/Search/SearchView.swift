//
//  SearchView.swift
//  Iskoci
//
//  Created by Vukasin Popovic on 20.10.23..
//

import SwiftUI

struct SearchView: View {
    
    
    @State private var viewModel = SearchViewModel()
    var body: some View {
        NavigationBar {
            VStack(spacing: 0) {
                slidingSelector
                content
             
                
                
            }
            .background(.primaryBackground)
        }
        .searchable(text: $viewModel.serachText )
        

    }
    
    // MARK: - Properties
    
     @ViewBuilder private var content: some View {
         if viewModel.isInitialState {
            emptyScreen
        }
        else if viewModel.events.isEmpty {
            noSearchResultsScreen
        }
        else {
            eventList
        }
    }
    
    private var slidingSelector: some View {
        SelectableSlider<SlidingSelectable>(selectables: $viewModel.selectables, selected: $viewModel.selected)
        .padding(.top, 0)
        .padding(.bottom, 24)
        
    }
    
    private var eventList: some View {
        EventsList(events: viewModel.events)
    }
    
    private var emptyScreen: some View {
        EmptyScreen(item: viewModel.emptyScreenItem)
    }
    
    private var noSearchResultsScreen: some View {
        EmptyScreen(item: viewModel.noResultsItem)
    }

}

#Preview {
    SearchView()
}

