//
//  MapView.swift
//  Iskoci
//
//  Created by kzmvranje on 16.10.23..
//

import SwiftUI
import MapKit

struct MapView: View {
    let event : Event
    @State private var camera = MapCameraPosition.camera(MapCamera(MKMapCamera()))
    var body: some View {
            Map(position: $camera) {
                Marker(event.placeName, coordinate: event.coordinate)
                    .tint(.red)
            }
            .onAppear {
                camera = MapCameraPosition.camera(MapCamera(centerCoordinate: event.coordinate, distance: 10000))
            }
        }
    }

#Preview {
    let event: Event = Event(id: 1, picture: "event-poster", name: "Prva Biciklijada u Vranju", description: "", timestamp: 1690923600,  streetName: "Stanoja Bunuševca, Niš", placeName: "Trg Kralja Milana", latitude: 43.31113882818083, longitude: 21.899212026720424, price: 0, link: "https://www.vranje.org.rs")
    
    return MapView(event: event)
}
