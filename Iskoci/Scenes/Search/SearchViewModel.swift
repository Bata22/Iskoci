//
//  SearchViewModel.swift
//  Iskoci
//
//  Created by Vukasin Popovic on 20.10.23..
//

import Foundation
import Combine

@Observable
final class SearchViewModel {
    
    
    // MARK: - Properties
    
    let emptyScreenItem = InfoItem(image: "magnifier", tittle: "", subtittle: "Ukucaj termin u polje za pretragu kako bi pronašao događaj koji bi posetio.")
    let noResultsItem = InfoItem(image: "magnifier", tittle: "Nema rezultata", subtittle: "Promeni termin pretrage pa probaj ponovo.")
    
    var events: [Event] = []
    var selectables = SelectableSerarch.allSelectables
    var selected: SlidingSelectable? = nil {
        didSet {
            guard selected != nil else { return }
            fetchEvents()
        }
    }
    
    var serachText: String = "" {
        didSet {
            updateSearch()
            //            fetchEvents()
        }
    }
    
    var selectableSearch = SelectableSerarch.today{
        didSet{
            resetPage()
            fetchEvents()
        }
    }
    var numOfItems = 4
    var curentPage = 1
    private var maxNumPage = 0
    var timer: Timer?
    
    
    var dateTime: String {
        guard selected != nil else { return "" }
        return DateFormatType.timeZoneFormat.string(from: Date())
    }
    
    var isInitialState = true
    
    
    private var params : [String: Any]{
        [Params.maxRows.value : numOfItems, Params.page.value: curentPage,Params.searchTerm.value : serachText, Params.dateShortcut.value : selected?.type.value ?? "", Params.dateTime.value: dateTime ]
    }
    
    func fetchEvents() {
       

        EventService.searchRequest(mehthod: .get, paramethers: params) {[weak self] eventResponse in
            guard let self = self else {return}
            
            guard case .success(let response) = eventResponse else {
                return
            }
            self.events = response.result.items
            //            self.maxNumPage = response.result.totalPagesCount
            
        }
        isInitialState = false
    }
    
    func getNextPage () {
        guard maxNumPage > curentPage else {return}
        curentPage += 1
        fetchEvents()
    }
    
    func resetPage() {
        curentPage = 1
        events.removeAll()
    }
    
    func updateSearch() {
        guard !serachText.isEmpty else {return events.removeAll() }
        self.timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false){[weak self] time in
            self?.fetchEvents()
            
        }
        
    }
}
    

