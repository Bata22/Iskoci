//
//  DateFormatType.swift
//  Iskoci
//
//  Created by Vukasin Popovic on 11.10.23..
//

import Foundation

enum DateFormatType: String {
	case serverFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
	case serbianDate = "EEEE, d.MMMM"
	case serbianTime = "H"
    case basicDateTime = "dd/MM/yyyy, H"
    case requiredDateTame = "yyyy-MM-dd:mm:ss"
    case timeZoneFormat =  "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
	
	// MARK: - Properties
	
	private static let systemFormatter = DateFormatter()
	
	var formatter: DateFormatter {
		DateFormatType.systemFormatter.dateFormat = self.rawValue
		DateFormatType.systemFormatter.locale = Locale(identifier: "sr_Latn_RS")
        //DateFormatType.systemFormatter.timeZone = TimeZone(identifier: "Europe/Berlin")
		return DateFormatType.systemFormatter
	}
	
	// MARK: - Public methods
	
	func string(from date: Date) -> String {
		formatter.string(from: date)
	}
	
	func date(from string: String) -> Date? {
		formatter.date(from: string)
	}
}
