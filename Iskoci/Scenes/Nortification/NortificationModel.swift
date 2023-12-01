//
//  NortificationModel.swift
//  Iskoci
//
//  Created by kzmvranje on 1.11.23..
//

import Foundation

final class NortificationViewModel{
    init (){
        
    }
    let title = "Obavestenja"
    let items = InfoItem(image: "notification-bell", tittle: "Nemate omiljenih događaja", subtittle: "Dodajte omiljeni događaj kako bi ga sledeći put lakše pronašli.")
    
    var nortification: [NortificationItem]{
        notificationsModel.notifications
    }
    private var notificationsModel = NortificationEventsModel()
    var events: [Event] = []
    var isInitialState = false
    var heder = MainViewModel()
    
    //    private var params: [String: Any]{
    //        [ Params.id.value: events ]
    //    }
    private func getIdNortificatons(eventId: String) {
        UsersService.getNortifications(mehthod: .get, header: heder.headers , url: Urls.idNortifications(eventId).urlString){[weak self] response in
            guard let self = self else {return}
            
            guard case .success = response else {
                return
                
            }
            
            
        }
        
    }
    
    private func getNortificatons(){
        UsersService.getNortifications(mehthod: .get, header: heder.headers , url: Urls.nortifications.urlString){[weak self] response in
            guard let self = self else {return}
            
            guard case .success = response else {
                return
                
            }
            
            
        }
        
    }
            
    
}
