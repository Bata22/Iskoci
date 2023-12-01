//
//  HederView.swift
//  Iskoci
//
//  Created by kzmvranje on 25.10.23..
//

import SwiftUI

struct HederView: View {
    init(_ title: String) {
        self.title = title
    }
    
    let title: String
    var body: some View {
        HStack{
            Text (title)
                .font(.system(size: 34 , weight: .bold))
                .foregroundColor(.white)
            Spacer()
        }.padding(EdgeInsets(top: 3, leading: 16, bottom: 8, trailing: 16))
        
        .background(.tabBarBackground)
    }
}

#Preview {
    HederView("Omiljeni")
}
