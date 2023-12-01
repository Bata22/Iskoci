import SwiftUI

struct EventsList: View {
    let events: [Event]
    var threshold = 2
    
    var onEndOfList: () -> () = {}
    var onFavorite: (Event) -> () = {_ in }
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 24) {
                ForEach(events) {event in
                    NavigationLink(value: event) {
                        EventView(event: event, onFavorite: {event in
                            onFavorite(event)
                        })
                            .padding(.horizontal, 16)
                            .frame(height: 124)
                            .onAppear {
                                checkEndOfList(for: event)
                            }
                    }
                    .navigationTitle("Nazad")
                }
            }
        }
        .navigationDestination(for: Event.self) { event in
            DetaildEvenView(event: event)
        }
    }
    
    // MARK: - Private methods
    
    private func checkEndOfList(for event: Event) {
        guard !events.isEmpty else { return }
        let index = events.firstIndex(of: event) ?? 0
        if events.count <= index + threshold {
            onEndOfList()
        }
    }
}


#Preview {
    let list = [Event(id: 1, picture: "", name: "DOWNHILL1690923600 Festival u VRANJU", description: "Kancelarija za mlade pod pokroviteljstvom Grada Vranja organizuje drugi po redu DOWNHILL festival u subotu 09.09.2023. godine u atrijumskom delu sale Okce sa početkom od 20h na kome će nastupiti 4 renomirana benda, koji su se proslavili u žanru southern/stoner/sludge/metal/rock.", timestamp: 1690923600, streetName: "Ulica Gen.MIlojka 37", placeName: "OKCE, Vranje", latitude: 51.507222, longitude: -0.1275, price: 0, link: "https://vranje.rs")]
    
    return EventsList(events: list)
        .background(.primaryBackground)
}

