//
//  NavigationBar.swift
//  Iskoci
//
//  Created by Vukasin Popovic on 9.10.23..
//

import SwiftUI

struct NavBarEvenView<T: View>: View {
    let content: () -> T
    
    var body: some View {
        NavigationStack {
            content()
                .toolbar{
                    ToolbarItem(placement: .principal) {
                        Button(action: {}){
                            Text("< Nazad")
                        }.foregroundStyle(.tabBarForeground)
                            
                        
                    }
                    
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {}){
                            Image("full-heart-icon")
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {}){
                            Image("share-icon")
                        }
                    }
                }
            
                
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(.tabBarBackground, for: .navigationBar)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavBarEvenView {
        Text("Hhsdfsdf")
    }
}

