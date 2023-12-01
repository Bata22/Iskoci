//
//  Params.swift
//  Iskoci
//
//  Created by kzmvranje on 10.11.23..
//

import Foundation

enum Params {
    case id
    case type
    case dateOrder
    case dateTime
    case maxRows
    case page
    case searchTerm
    case dateShortcut
    
    var value: String
    {
        switch self {
       
        case .type:
        return "Type"
        case .dateOrder:
            return "DateOrder"
        case .dateTime:
            return "DateTime"
        case .maxRows:
            return "MaxRows"
        case .page:
            return "Page"
        case .searchTerm:
            return "SearchTerm"
        case .dateShortcut:
            return "DateShortcut"
        case .id:
            return "id"
        }
        
    }
}

