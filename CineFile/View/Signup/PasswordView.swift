import SwiftUI

struct PasswordView: View {
    @AppStorage("cineFile_UserPassword") private var app_password  = ""
    @State var userPassword = ""
    var onSignupCompleted: () -> Void

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Spacer()
                VStack(alignment: .leading, spacing: 14.0) {
                    Text("Crie sua conta")
                        .font(.title)
                        .foregroundColor(.white)
                        .bold()

                    Spacer()
                        .frame(height: 20)

                    HStack(spacing: 4) {
                        Text("3 de 3 passos")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                    }

                    VStack(alignment: .leading) {
                        Text("Crie sua senha")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                            .padding(.bottom, 8)

                        SecureField("Senha", text: $userPassword)
                            .textContentType(.password)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .font(.system(size: 16))
                            .padding(12)
                            .foregroundColor(.white)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.white, lineWidth: 0.5)
                            )
                    }
                    .padding(.bottom, 28)

                    Button {
                        print("Attempting to finalize signup...")
                        app_password = userPassword
                        self.onSignupCompleted()
                    } label: {
                        Text("Finalizar Cadastro")
                            .font(.system(size: 15))
                            .bold()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                    }
                    .background(Color.accent)
                    .cornerRadius(99)
                }
                Spacer()
            }
            .padding(24)
        }
        .enableInjection()
    }

    #if DEBUG
        @ObserveInjection var forceRedraw
    #endif
}

struct PasswordView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordView(onSignupCompleted: { print("PasswordView signup completed in preview") })
            .background(Background())
    }
}
