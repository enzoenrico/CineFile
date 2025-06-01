import SwiftUI

struct DetailsView: View {
    @State var filmDetails: String = ""
    var body: some View {
        ZStack {
            Background()
            
            VStack{
                Image("image")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
                
                
                
                    
                VStack {
                    VStack(alignment: .leading) {
                        Text("Os incríveis")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                            .bold()
                            
                        
                        TextField(text: $filmDetails) {
                            Text("2004 | Direção: Brad Bird | Roteiro: Brad Bird")
                                .foregroundColor(.white)
                                .font(.system(size: 12))
                                
                            
                        }
                        HStack(alignment: .center, spacing: 0) {
                            ZStack(alignment: .leading) {
                                Image(systemName: "person.circle.fill")
                                    .foregroundColor(.cta)
                                    .offset(x: -9)  // Adjust if actual image sizes differ

                                Image(systemName: "person.circle.fill")
                                    .foregroundColor(.blue)
                                    .offset(x: 0)  // Adjust if actual image sizes differ

                                
                            }
                            .frame(width: 40)  // Example if you calculate the exact width

                            Text("Disponível na Disney Plus e Prime Video")
                                .font(.caption2)
                                .foregroundColor(.cta)
                        }
                        .padding(.leading)
                        .padding(.trailing)
                        .enableInjection()
                    }
                    .padding (.bottom, 24)
                    }
                    
                    
                    VStack(alignment: .leading) {
                        Text("Depois do governo banir o uso de superpoderes, o maior herói do planeta, o Sr. Incrível, vive de forma pacata com sua família. Apesar de estar feliz com a vida doméstica, o Sr. Incrível ainda sente falta dos tempos em que viveu como super-herói, e sua grande chance de entrar em ação novamente surge quando um velho inimigo volta a atacar. Só que agora ele precisa contar com a ajuda de toda a família para vencer o vilão.")
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                        
                    }
                    Button {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 99)
                                .fill(Color.accent)
                            
                            HStack {
                                Image(systemName: "play")
                                    .foregroundColor(Color.white)
                                    .padding(.leading, 96)
                                
                                Text("Assistir agora")
                                    .font(.system(size: 15))
                                    .bold   ()
                                    .foregroundColor(Color.white)
                                    .padding(.trailing, 96)
                                    .padding(.top, 8)
                                    .padding(.bottom, 8)
                                
                                
                            }
                            
                            
                        }
                    } .frame(height: 42)
                        .disabled(true)
                }
                .padding(24)
                .padding(.bottom, 97)
                    
                
                
                
                Spacer()
            } .ignoresSafeArea()
            
        Image(systemName: "star.fill")
            .font(.system(size: 40))
            .foregroundColor(.white)
            .padding(.leading, 320)
            .padding(.bottom, 30)
            
        }
        
    }



#Preview {
    DetailsView()
}

