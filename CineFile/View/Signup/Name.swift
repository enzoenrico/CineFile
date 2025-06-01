import SwiftUI

struct NameView: View {
    @State var userName = ""
    var body: some View {
        ZStack {
            Background(
                size: (width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            )
            .ignoresSafeArea()

            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 14.0) {
                    Text("Crie sua conta")
                        .font(.title)
                        .foregroundColor(.white)
                        .bold()

                    Spacer()
                        .frame(height: 20)
                    
                    HStack(spacing: 4) {
                        Text("2 de 3 passos")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)

                    }  //text abaixo do crie sua conta

                    

                    VStack(alignment: .leading) {
                        Text("Crie sua senha")
                            .font(.system(size: 15))
                            .foregroundColor(.white)

                        SecureField(text: $userName) {
                            Text("Senha")
                                .foregroundColor(.gray.opacity(0.9))
                                .font(.system(size: 16))
                        }
                        .font(.system(size: 16))
                        .padding(12)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white, lineWidth: 0.5)
                        )
                        .padding (.bottom, 28)
                    }

                   
                    Button {

                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 99)
                                .stroke(Color.accent, lineWidth: 0.5)
                                .fill(.accent)

                            Text("Continuar")
                                .font(.system(size: 15))
                                .bold   ()
                                .foregroundColor(.white)
                                .padding(.leading, 96)
                                .padding(.trailing, 96)
                                .padding(.top, 8)
                                .padding(.bottom, 8)
                            
                        }
                    }
                    .frame(height: 42)
                }
                .frame(height: 282)
                

                
        Spacer()
                    .frame(height: 208)

            }  // aqui tem o conteúdo da página de login, o que vem antes é só o fundo animado
            .padding(24)
            .frame(
                width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 124
            )
        }
        .enableInjection()
    }

    #if DEBUG
        @ObserveInjection var forceRedraw
    #endif
}

#Preview {
    NameView()
}


