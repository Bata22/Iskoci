//
//  NortificationView.swift
//  Iskoci
//
//  Created by kzmvranje on 1.11.23..
//

import SwiftUI

struct NortificationView: View {
    
    @State private var viewModel = NortificationViewModel()
   // let nortifications: [NortificationItem]
    
    @ViewBuilder private var content: some View {
        if !viewModel.isInitialState {
            
        }
        else {
            
        }
    }
 
    
    var body: some View {
        NavigationBar{
           
            VStack(spacing: 24){
                HederView(viewModel.title)
//             
                ScrollView{
                    LazyVStack{
                        
                        ForEach(viewModel.nortification){ nortification in
                            NortificationCardView(nortificationItem: nortification)
                            
                        }


                    }
                }
              
            }
            .background(.primaryBackground)
          
           
        }
        
    }
    
    
}


#Preview {

    NortificationView()
}
