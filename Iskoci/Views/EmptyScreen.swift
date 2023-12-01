import SwiftUI

struct EmptyScreen: View {
    let item:  BaisicItem

    
    var body: some View {
        VStack(spacing: 24) {
            Image(item.image)
            
            VStack(spacing: 8) {
                if !item.tittle.isEmpty {
                    Text(item.tittle)
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                }
                
                if !item.subtittle.isEmpty {
                    Text(item.subtittle)
                        .foregroundColor(.white.opacity(0.48))
                        .font(.system(size: 17))
                        .multilineTextAlignment(.center)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 16)
    }
}

struct EmptyScreen_Previews: PreviewProvider {
    static var previews: some View {
        let item = InfoItem(image: "notification-bell", tittle: "", subtittle: "Uključite obaveštenja u opcijama kako bi ste bili u toku sa najnovijim dešavanjima.")
        EmptyScreen(item: item)
            .background(.primaryBackground)
    }
}

