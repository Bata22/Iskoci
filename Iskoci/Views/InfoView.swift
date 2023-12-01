//
//  InfoView.swift
//  Iskoci
//
//  Created by kzmvranje on 16.10.23..
//

import SwiftUI

struct InfoView: View {
    let item: BaisicItem
    var body: some View {
        
        
        HStack(spacing: 8){
                Image(item.image)
                    .cornerRadius(8)
            VStack(alignment: .leading){
                    Text(item.tittle)
                        .font(
                        Font.custom("SF Pro", size: 15)
                        .weight(.semibold)
                        )
                        .foregroundColor(.white)
                        

                    Text(item.subtittle)
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                }
               
            }
            
            
            .background(.primaryBackground)


        
    }
}

#Preview {
    let item = InfoItem(image: "location-icon", tittle: "OKCE, Vranje", subtittle: "Kralja Milana 34")
    
    return InfoView(item: item)
}
