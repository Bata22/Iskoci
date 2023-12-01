//
//  NortificationViewModel.swift
//  Iskoci
//
//  Created by kzmvranje on 25.10.23..
//

import Foundation

final class OpcionsViewModel{
    let emptyScreenItem = InfoItem(image: "notification-bell", tittle: "Nemate omiljenih događaja", subtittle: "Dodajte omiljeni događaj kako bi ga sledeći put lakše pronašli.")
//    let noResultsItem = InfoItem(image: "empty-favorites", tittle: "Nema rezultata", subtittle: "Promeni termin pretrage pa probaj ponovo.")
    var events = HomeEventsModel().events
    var title = "Opcije"
    
    var subtittle = "Obavestenja"
    var documents = "Dokumenti"
    var tremsOfCondicions = "Uslovi koriscena"
    var tremsOfPrivate = "Politika privatnosti"
    var version = "Verzija"
    var isInitialState = false
}
