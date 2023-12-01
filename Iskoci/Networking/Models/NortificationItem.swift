//
//  NortificationItem.swift
//  Iskoci
//
//  Created by kzmvranje on 1.11.23..
//

import Foundation

struct NortificationItem : Identifiable, Decodable
{
    let id: Int
    let eventId: Int
    let image: String
    let title: String
    let created: String
    let link: String
    let isReaded: Bool
    
    var hasUrl:  Bool {false}
    var subtitle: String {
        hasUrl ? "izdvajamo" : "Objavljen je novi dogodja"
    }
    var CurentTime: String {
        guard let date = DateFormatType.serverFormat.date(from: created) else {
            return ""
        }
        let curentTime = date.curentTimeString
       
        
        return curentTime
    }
    
    
    
}
