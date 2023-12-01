//
//  DetaildEvenView.swift
//  Iskoci
//
//  Created by kzmvranje on 16.10.23..
//

import SwiftUI

struct DetaildEvenView: View {
    
    var infoViewCalendar: some View{
        VStack{
            InfoView(item: event.calendarItem)
        }
    }
    var infoViewLocation: some View{
        VStack{
            InfoView(item: event.locationItem)
        }
    }
    
    var infoViewPayitem: some View{
        VStack{
            InfoView(item: event.payItem)
        }
    }
    
    let event: Event
    
    @State var viewModel = HomeViewModel()
    var body: some View {
        ScrollView{
            VStack( alignment: .leading,spacing: 16){
                
                Image(event.picture)
                Text(event.name) .foregroundColor(.white)
                   
                    
                infoViewCalendar
                infoViewLocation
                infoViewPayitem
                   
                    
                
                
                Divider().background(.white)
                Text("Opis Dogadja").foregroundStyle(.white)
                    .padding(16)
                Text(event.description).font(Font.custom("SF Pro", size: 15))
                    .foregroundColor(.white)

                    .frame(width: 358, alignment: .topLeading)
                    .padding(16)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Saznaj vise ->")
                        .foregroundStyle(.tabBarForeground)
                })
                Divider().background(.white)
                
                Text ("Lokacija").foregroundStyle(.white)
                
                
                
                
                MapView(event: event)
                    .frame(height: 192)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 46, trailing: 16))
                
            }
            .onAppear{
                viewModel.fetchEvents()
            }
            
            
            
        }
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(.tabBarBackground, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
        .background(.primaryBackground)
        .toolbar(.hidden , for: .tabBar)
        
        .toolbar{
            ToolbarItem(placement: .principal) {
                Button(action: {}) {
                    Image("full-heart-icon")
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                ShareLink(item: event.link)
                Image("share-icon")
            }
        }
       
         }
        
}

#Preview {
    let event: Event = Event(id: 1, picture: "event-poster", name: "DOWNHILL Festival II", description: "Kancelarija za mlade pod pokroviteljstvom Grada Vranja organizuje drugi po redu DOWNHILL festival u subotu 09.09.2023. godine u atrijumskom delu sale Okce sa početkom od 20h na kome će nastupiti 4 renomirana benda, koji su se proslavili u žanru southern/stoner/sludge/metal/rock.", timestamp: 1690923600, streetName: "Stanoja Bunuševca, Niš", placeName: "Trg Kralja Milana", latitude: 43.31113882818083, longitude: 21.899212026720424, price: 0, link: "https://www.vranje.org.rs")
    
    return DetaildEvenView(event: event)
}
