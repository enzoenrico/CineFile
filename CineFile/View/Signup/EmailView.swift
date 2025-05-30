import SwiftUI

struct EmailView: View {
    @State var userEmail = ""
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

                    HStack(spacing: 3) {
                        Text("Já possui sua conta?")
                            .font(.caption)
                            .foregroundColor(.white)

                        Text("Fazer login")
                            .font(.caption)
                            .foregroundColor(.cta)
                            .underline()
                    }  //text abaixo do crie sua conta

                    Spacer()
                        .frame(height: 48)

                    VStack(alignment: .leading) {
                        Text("Endereço de email")
                            .font(.caption)
                            .foregroundColor(.white)

                        TextField(text: $userEmail) {
                            Text("Seu email aqui")
                                .foregroundColor(.gray.opacity(0.9))
                                .font(.caption)
                        }
                        .font(.caption)
                        .padding(8)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.white, lineWidth: 0.5)
                        )
                    }

                    HStack {

                        Rectangle()
                            .frame(height: 0.5)
                            .foregroundColor(.gray)

                        Text("ou")
                            .font(.caption)
                            .foregroundColor(.gray)

                        Rectangle()
                            .frame(height: 0.5)
                            .foregroundColor(.gray)
                    }

                    Button {

                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 99)
                                .stroke(Color.white, lineWidth: 0.5)
                                .fill(.white)

                            Text(" Continue pela Apple")
                                .font(.caption)
                                .foregroundColor(.black)
                                .padding(.leading, 96)
                                .padding(.trailing, 96)
                                .padding(.top, 8)
                                .padding(.bottom, 8)
                        }
                    }
                }
                .frame(height: 280)

                Spacer()

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
    EmailView()
}
