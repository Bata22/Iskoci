//
//  NortificationResponse.swift
//  Iskoci
//
//  Created by kzmvranje on 1.12.23..
//

import Foundation

struct EventIdResponse: Decodable{
    
    var items: Event
    let version: String
    let message: String
    
}


