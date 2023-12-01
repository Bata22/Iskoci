//
//  NortificationCardView.swift
//  Iskoci
//
//  Created by kzmvranje on 1.11.23..
//

import SwiftUI

struct NortificationCardView: View {
    
   let nortificationItem: NortificationItem
    var body: some View {
        HStack(spacing: 16){
            ZStack{
                
                Image(nortificationItem.image)
                    .resizable()
                    .frame(width: 64, height: 64)
                
                Image("indicator")
                    .position(CGPoint(x: 35.0, y: -24.0))
                    .frame(width: 12, height: 12)
            }
               
                
            VStack{
                Text(nortificationItem.subtitle)
                    .foregroundStyle(.yellow)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(nortificationItem.title)
                    .font(Font.system(size: 16)
                        .weight(.semibold))
                    .foregroundStyle(.eventFooter)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                Text(nortificationItem.CurentTime)
                    .font(Font.system(size: 14)
                    ).foregroundStyle(.eventFooter)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                    
            }
            
        }
        .padding(.top, 16)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(.primaryBackground)
        Divider()
            .overlay(.white)
        
          
         
        
        
    }
}

#Preview {
    let nortification = NortificationItem(id: 1, eventId: 1, image: "event-image", title: "Prva Biciklijada u Vranju", created: "2023-11-01T13:00:00Z", link: "", isReaded: true)
    
    return NortificationCardView(nortificationItem : nortification)
}
