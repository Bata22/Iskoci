import SwiftUI

struct ForgotPasswordViewEmpty: View {
    let item:  BaisicItem

    
    var body: some View {
        VStack(spacing: 24) {
          
          
            
            
            
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
                Spacer()
                
                VStack(alignment: .center){
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Vrati se nazad na prijavu")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 12, leading: 10, bottom: 12, trailing: 10))
                    })
                    
                    .frame(maxWidth: .infinity )
                    .padding(.horizontal, 10)
                    .padding(.vertical, 12)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    .cornerRadius(4)
                    
                    
                }

                
               
               // .padding(.bottom, 46).background(Color.white)
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 16)
    }
}

struct ForgotPasswordViewEmpry_Previews: PreviewProvider {
    static var previews: some View {
        let item = InfoItem(image: "icon", tittle: "Uspešno resetovanje lozinke!", subtittle: "Na mejl adresu smo vam poslali link na kojem mozete uneti novu lozinku.")
        ForgotPasswordViewEmpty(item: item)
            .background(.primaryBackground)
    }
}


