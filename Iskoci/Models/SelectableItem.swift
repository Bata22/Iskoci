//
//  SelectableItem.swift
//  Iskoci
//
//  Created by kzmvranje on 20.10.23..
//

import SwiftUI

protocol SelectableItem: Equatable, Identifiable{
    var id: UUID {get}
    var tittle: String {get}
    var isSelected: Bool { get set}
    var backgoundColor: Color {get}
    var foregroundColor: Color {get}
   
}
