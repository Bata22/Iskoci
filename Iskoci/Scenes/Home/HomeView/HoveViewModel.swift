//
//  HoveViewModel.swift
//  Iskoci
//
//  Created by Vukasin Popovic on 9.10.23..
//

import Foundation
import Alamofire

@Observable
final class HomeViewModel {
    init (){
        fetchEvents()
    }
    
   
    // MARK: - Wrappers
    
//   var eventType = EventType.all
//    var sortingOrder = SortingOrder.mostRecent
    
    var selectedEventType = EventType.all {
        didSet{
            resetPage()
            fetchEvents()
        }
        
    }
    var selectedOrderType = SortingOrder.mostRecent{
        didSet{
            resetPage()
            fetchEvents()
        }
    }
   //var selectedEventType = EventType.all
    
    
    
    // MARK: - Properties
    private let numOfItems = 4
    
    private var maxNumPage = 0
    private var curentPage = 1
  
    let title = "Kude s’d \nće iskočiš? 🤔"
    
    var events: [Event] = []
    var viewmodel = MainViewModel()
    
    private var params : [String: Any]{
        [Params.maxRows.value : numOfItems, Params.page.value: curentPage, Params.dateOrder.value: selectedOrderType.value, Params.type.value: selectedEventType.value, Params.dateTime.value: DateFormatType.timeZoneFormat.string(from: Date()) ]
    }
    
    private var eventsModel = HomeEventsModel()
    func fetchEvents() {
        
        EventService.request(mehthod: .get, paramethers: params) {[weak self] eventResponse in
            guard let self = self else {return}
            
            guard case .success(let response) = eventResponse else {
                return
            }
           self.events += response.result.items
            self.maxNumPage = response.result.totalPagesCount
            
        }
    
    }
    
    func getNextPage () async {
        guard maxNumPage > curentPage else {return}
        curentPage += 1
       fetchEvents()
    }
    func resetPage() {
        curentPage = 1
        events.removeAll()
    }
    
    
    
    func handleFavorites(_ event: Event) {
        if event.isFavorite {
            removeFromFavorite(event: event)
        }
        else {
            addToFavourites(event: event)
        }
    }
    
    private func addToFavourites(event: Event) {
        UsersService.addFavourites(mehthod: .post,header: viewmodel.headers, url: Urls.favourite("\(event.id)").urlString){[weak self] response in
            guard let self = self else {return}
            
            guard case .success = response else {
                return
            }
            self.setIsFavorite(true, to: event)
            
        }
     
    }
    
    private func setIsFavorite(_ isFavorite: Bool, to event: Event) {
        guard let index = events.firstIndex(of: event) else { return }
        events[index].isFavorite = isFavorite
    }
    
    private func removeFromFavorite(event: Event){
        UsersService.addFavourites(mehthod: .delete,header: viewmodel.headers, url: Urls.favourite("\(event.id)").urlString){[weak self]response in
            guard let self = self else {return}
            guard case .success = response else {
                return
            }
           
            self.setIsFavorite(false, to: event)

        }
    
    }
    
   
    
    
}
    




