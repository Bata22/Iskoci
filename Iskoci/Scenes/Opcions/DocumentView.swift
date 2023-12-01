//
//  DocumentView.swift
//  Iskoci
//
//  Created by kzmvranje on 30.10.23..
//

import SwiftUI

struct DocumentView: View {
    let title : String
    var body: some View {
        HStack{
            Text(title)
                .foregroundColor(.white)
            Spacer()
            Image("trailing-arrow")
        }
    }
}

#Preview {
    DocumentView(title: "Banana")
}
