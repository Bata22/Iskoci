//
//  SelectableSlider.swift
//  Iskoci
//
//  Created by kzmvranje on 20.10.23..
//

import SwiftUI

struct SelectableSlider<T: SelectableItem>: View {
    
    @Binding var selectables: [T]
    @Binding var selected: T?
    
    
    var body: some View {
        ScrollView(.horizontal){
            HStack(spacing: 16){
                ForEach (selectables){
                    selectable in
                    Text(selectable.tittle)
                        .font(.system(size: 15))
                        .foregroundStyle(selectable.foregroundColor)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 8)
                        .background(selectable.backgoundColor)
                        
                        .cornerRadius(17)
                        .onTapGesture {
                            selectItem(selectable)
                            
                        }
                }
            }
            .padding(.top, 16)
            .padding(.bottom, 24)
            .background(.tabBarBackground)
        }

    }
    private func selectItem(_ selectable: T) {
        guard let index = selectables.firstIndex(of: selectable) else { return }
        
        guard !selectables[index].isSelected else {
            selectables[index].isSelected = false
            return
        }
        
        selectables.indices.forEach{index in selectables[index].isSelected = false
        }
        
        selectables[index].isSelected = true

        selected = selectable
    }
}

//struct SelectableSlider_Preview: PreviewProvider{
//    static var previews: some View {
//            SelectableSlider(selectables: Binding.constant(SelectableSearch.allSelectables), selected: Binding.constant(nil))
//                .background(.primaryBackground)
//        }
//}
#Preview {
    SelectableSlider<SlidingSelectable>(selectables: Binding.constant(SelectableSerarch.allSelectables), selected: Binding.constant(nil))
}
