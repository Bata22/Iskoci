//
//  NortificationView.swift
//  Iskoci
//
//  Created by kzmvranje on 25.10.23..
//

import SwiftUI

struct OpcionsView: View {
    
    @State private var viewModel = OpcionsViewModel()
    @State private var toggleOn =  true
    var body: some View {
        
        NavigationBar{
            
            VStack(spacing: 24){
                HederView(viewModel.title)
                // Form{
                List{
                    Section{
                        Group{
                            Toggle(viewModel.subtittle,isOn: $toggleOn )
                                .listRowBackground(Color.pickerBackground)
                                .foregroundColor(.white)
                            DocumentView(title: "Korisnicka podrska")
                            
                            
                        }
                        
                        .listRowBackground(Color.pickerBackground)
                      //  .listRowSeparatorTint(.infoForeground)
                        .listRowSeparatorTint(.infoForeground, edges: .top)
                        
                        
                    }
                    
                    Section{
                        Group{
                            DocumentView(title: "Dokumneti")
                            DocumentView(title: "Uslovi koriscenja")
                            DocumentView(title: "Politika privatnosti")
                            
                            HStack{
                                Text(viewModel.version)
                                    .foregroundColor(.white)
                                Spacer()
                                Text("V1.0.0")
                                    .foregroundColor(.infoForeground)
                            }
                            
                            
                            
                        }
                    }
                    .listRowBackground(Color.pickerBackground)
                    .listRowSeparatorTint(.infoForeground, edges: .top)
                    
                    
                }
                .listStyle(.plain)
                .listSectionSpacing(24)
                
                    
                HStack{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Odjavi se")
                            //.frame(minWidth: 328)
                                  .font(.system(size: 18))
                                  .padding()
                                  .foregroundColor(.white)
                                  .overlay(
                                        RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color.white, lineWidth: 2)
                                          )
                    }
                        
                    )
                    .padding(16)
                }
                    
                }
            
                    .background(.tabBarBackground)
                
                
            }
        

                

            
        
        }
       
        
    }


#Preview {
    OpcionsView()
}
