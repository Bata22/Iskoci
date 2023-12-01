//
//  Event.swift
//  Iskoci
//
//  Created by Vukasin Popovic on 11.10.23..
//

import Foundation
import CoreLocation

struct Event : Identifiable, Hashable, Decodable {
    
	let id: Int
	let picture: String 
	let name: String
	let description: String
	let timestamp: Double
	let streetName: String
	let placeName: String
	let latitude: Double
	let longitude: Double
	let price: Int
	let link: String
    
  var isFavorite = false
	
	var startTime: String {
        let date = Date(timeIntervalSince1970: timestamp)
		let serbianDate = DateFormatType.serbianDate.string(from: date)
		let serbianTime = DateFormatType.serbianTime.string(from: date)
		
		return "\(serbianDate.capitalized) u \(serbianTime)h"
	}
    
    var coordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    var calendarItem: BaisicItem {
        let date =  Date (timeIntervalSince1970: timestamp)
        let serbianDate = DateFormatType.serbianDate.string(from: date)
        let basicDateTime = DateFormatType.basicDateTime.string(from: date)
        return InfoItem (image: "calendar-icon", tittle: serbianDate.capitalized, subtittle: "\(basicDateTime)h")
    }
    
    var locationItem: BaisicItem {
        InfoItem (image: "location-icon", tittle: placeName, subtittle: streetName)
    }
    
    var payItem: BaisicItem {
        let isFree = price > 0 ? "je " : "nije"
        return InfoItem (image:"pay-icon", tittle: "cena ulaznice je \(price)", subtittle: "Za ulazak \(isFree) potreban"     )
    }
    
    
    
    //MARK: Hasable
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
}
