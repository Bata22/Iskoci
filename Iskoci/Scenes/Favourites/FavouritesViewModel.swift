//
//  FavouritesViewModel.swift
//  Iskoci
//
//  Created by kzmvranje on 25.10.23..
//

import Foundation
import SwiftUI
import Alamofire

@Observable
final class FavouritesViewModel {
//    init(){
//        if UserDefaultHelper.shared.isRegister == true
//        {
//            EventsList?.self
//        }
//        
//    }
    
    let emptyScreenItem = InfoItem(image: "empty-favorites", tittle: "Nemate omiljenih događaja", subtittle: "Dodajte omiljeni događaj kako bi ga sledeći put lakše pronašli.")
    //    let noResultsItem = InfoItem(image: "empty-favorites", tittle: "Nema rezultata", subtittle: "Promeni termin pretrage pa probaj ponovo.")
    
    
    var events: [Event] = []
    var title = "Omiljeni"
    var isInitialState = true
    var numOfItems = 4
    var curentPage = 1
    var viewmodel = MainViewModel()
    
    private var params : [String: Any]{
        [Params.maxRows.value : numOfItems, Params.page.value: curentPage ]
    }
    let userId = UserDefaultHelper.shared.userId
    
    
    func handleFavorites(_ event: Event) {
        if event.isFavorite {
            removeFromFavorite(event: event)
            
        }
        else {
            addToFavourites(event: event)
        }
    }
    
    private func addToFavourites(event: Event) {
        UsersService.addFavourites(mehthod: .post, header: viewmodel.headers, url: Urls.favourite("\(event.id)").urlString){[weak self] response in
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
        UsersService.addFavourites(mehthod: .delete, header: viewmodel.headers, url: Urls.favourite("\(event.id)").urlString){[weak self]response in
            guard let self = self else {return}
            guard case .success = response else {
                return
            }
            
            guard let index = events.firstIndex(of: event) else { return }
            self.events.remove(at: index)
            self.setIsFavorite(false, to: event)
        }
    
    }
    
    func addFavoritesfetchEvents() {
        
        UsersService.getFavourites(mehthod: .get, header: viewmodel.headers, url: Urls.getFavourites.urlString, parameters: params){[weak self] result in
            guard let self = self else {return}
            
            guard case .success(let response) = result else {
                return
            }
            events = response.result.items
          
           
        }
    
    }
    
    
    
    
}
    

