//
//  SlidingSelectable.swift
//  Iskoci
//
//  Created by kzmvranje on 20.10.23..
//

import SwiftUI

struct SlidingSelectable: SelectableItem,Hashable
{
    let id =   UUID()
    var tittle: String
    var isSelected: Bool = false
    var type: SelectableSerarch 
    var backgoundColor: Color{
        isSelected ?.infoSelected : .infoBackground
    }
    var foregroundColor: Color
    {
        isSelected ?.infoSelected : .infoBackground
    }
    
}
