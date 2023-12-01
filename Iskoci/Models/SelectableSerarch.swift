//
//  SelectableSerarch.swift
//  Iskoci
//
//  Created by kzmvranje on 20.10.23..
//

import SwiftUI

enum SelectableSerarch: Hashable
{
    case today
    case tomorrow
    case thisWeek
    case thisMouth

    static var allSelectables: [SlidingSelectable]{
        [SelectableSerarch.today.slidingSelectable,
         SelectableSerarch.tomorrow.slidingSelectable,
         SelectableSerarch.thisWeek.slidingSelectable,
         SelectableSerarch.thisMouth.slidingSelectable]
    }
    var slidingSelectable: SlidingSelectable {
        switch self {
        case.today:
            return SlidingSelectable(tittle: "Danas", type: self)
        case.tomorrow:
            return SlidingSelectable(tittle: "Sutra", type: self)
        case.thisWeek:
            return SlidingSelectable(tittle: "Ove nedelje", type: self)
        case.thisMouth:
            return SlidingSelectable(tittle: "Ovog meseca", type: self)
        }
    }
    
    var value : String{
        
        switch self {
        case .today:
            return "Danas"
        case .tomorrow:
            return "Sutra"
        case .thisWeek:
            return "Ove nedelje"
        case .thisMouth:
            return "Ovog meseca"
        }
         
    }
 
}



