//
//  EventResponse.swift
//  Iskoci
//
//  Created by kzmvranje on 6.11.23..
//

import Foundation

struct EventResponse: Decodable {
    let result: EventResoult
    let version: String
    let message: String
    
}
struct EventResoult: Decodable {
    
    let items: [Event]
    let totalPagesCount: Int
    let totalItemsCount: Int
}
