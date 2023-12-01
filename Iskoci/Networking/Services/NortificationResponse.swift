//
//  NortificationResponse.swift
//  Iskoci
//
//  Created by kzmvranje on 1.12.23..
//

import Foundation
struct NortificationResponse: Decodable {
    let result: EventIdResponse
    let version: String
    let message: String
}
