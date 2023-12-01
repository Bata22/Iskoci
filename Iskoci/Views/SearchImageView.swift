//
//  SearcImageView.swift
//  Iskoci
//
//  Created by kzmvranje on 23.10.23..
//

import SwiftUI

struct SearchImageView: View {
    let infoItem: InfoItem
    var body: some View {
        VStack{
            Image(infoItem.image)
            Text(infoItem.subtittle)
                
        }
        .background(.tabBarBackground)
    }
}

#Preview {
    let item = InfoItem(image: "magnifier", tittle: "", subtittle: "Ukucaj termin u polje za pretragu kako bi pronašao događaj koji bi posetio.")
    
    return SearchImageView(infoItem: item)
}
