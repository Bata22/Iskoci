//
//  Urls.swift
//  Iskoci
//
//  Created by kzmvranje on 6.11.23..
//

import Foundation

enum Urls {
    case base
    case events
    case search
    case user
    case favourite(String)
    case getFavourites
    case idNortifications(String)
    case nortifications
    
    var urlString: String{
        switch self
        {
            
        case .base:
            return "https://staging-api.kuda-vr.xyz"
        case .events:
            return "\(Urls.base.urlString)/api/event"
        case .search:
            return "\(Urls.base.urlString)/api/event/name"
            
        case .user:
            return "\(Urls.base.urlString)/api/user/deviceid"
        case .favourite (let id):
            return "\(Urls.base.urlString)/api/user/\(id)"
            
        case .getFavourites:
            return "\(Urls.base.urlString)/api/user/favorites"
            
        case .idNortifications (let id):
            return "\(Urls.base.urlString)/api/event/\(id)"
            
        case .nortifications :
            return "\(Urls.base.urlString)/api/user/notifications"
        }
   
    }
}
