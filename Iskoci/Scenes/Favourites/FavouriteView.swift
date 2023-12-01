//
//  FavouriteView.swift
//  Iskoci
//
//  Created by kzmvranje on 25.10.23..
//

import SwiftUI

struct FavouriteView: View {
    
    @State private var viewModel = FavouritesViewModel()
 
//    let item:  BaisicItem
    
    
    private var emptyScreen: some View {
        EmptyScreen(item: viewModel.emptyScreenItem)
    }
    private var eventList: some View {
        EventsList(events: viewModel.events,onFavorite: {event in
            viewModel.handleFavorites(event)
            // viewModel.handleFavorites($0)
        })
    }
    
    
//    @ViewBuilder private var content: some View {
//        if viewModel.isInitialState{
//             eventList
//        }
//        else {
//            emptyScreen
//           
//        }
//    }
//    
    var body: some View {
        NavigationBar{ 
            VStack(spacing: 24) {
                HederView("Omiljeni")
              
                    EventsList(events: viewModel.events,onFavorite: {event in
                        viewModel.handleFavorites(event)
                        // viewModel.handleFavorites($0)
                    })
                
                    
                    
                
            //content

        }
        .onAppear{viewModel.addFavoritesfetchEvents()}
            
        .refreshable {
            
        }
        .background(.primaryBackground)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 0)}
       
        
       
    }
    
}




#Preview {
    FavouriteView()
}
