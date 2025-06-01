import SwiftUI

struct ProfileView: View {
    @AppStorage("cineFile_UserName") private var app_username  = ""
    @AppStorage("cineFile_UserPassword") private var app_password  = ""
    
    @State var userName: String = ""
    @State var userPassword: String = ""


    func validateButton() -> Bool {
        return !userName.isEmpty || !userPassword.isEmpty
    }

    var body: some View {
        ZStack {
            Background().ignoresSafeArea()
                VStack {
                    Image("filme1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)  // Use fill to cover the frame
                        .frame(
                            width: UIScreen.main.bounds.width,
                            height: UIScreen.main.bounds.height / 2
                        )  // Adjusted height
                        .clipped()
                        .padding(.bottom, 56)


                    VStack(spacing: 20) {  // Added spacing for better layout
                        VStack(alignment: .leading) {
                            Text("Nome de usuário")
                                .font(.system(size: 15))
                                .foregroundColor(.white)

                            TextField(text: $userName) {
                                Text(app_username)
                                    .font(.system(size: 15))
                                    .foregroundColor(.gray.opacity(0.7))

                            }
                            .font(.system(size: 16))
                            .padding(12)
                            .foregroundColor(.white)
                            .background(Color.white.opacity(0.1))  // Subtle background
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.white, lineWidth: 0.5)
                            )
                        }

                        VStack(alignment: .leading) {
                            Text("Alterar senha")
                                .font(.system(size: 15))
                                .foregroundColor(.white)

                            SecureField(text: $userPassword) {
                                Text("********")
                                    .font(.system(size: 15))
                                    .foregroundColor(.gray.opacity(0.7))

                            }
                            .font(.system(size: 16))
                            .padding(12)
                            .foregroundColor(.white)
                            .background(Color.white.opacity(0.1))  // Subtle background
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.white, lineWidth: 0.5)
                            )
                        }
                        .padding(.bottom, 32)

                        Button {
                            if(app_username != userName && !userName.isEmpty){
                                app_username = userName
                            }
                            if(app_password != userPassword && !userPassword.isEmpty){
                                app_password = userPassword
                            }
                            print(
                                "Salvar alterações: Usuário - \(userName), Senha alterada: \(!userPassword.isEmpty)"
                            )
                        } label: {
                            HStack {
                                Image(systemName: "square.and.arrow.down")
                                Text("Salvar alterações")
                                    .font(.system(size: 15))
                                    .bold()
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .foregroundColor(validateButton() ? .white : .gray)
                            .background(
                                validateButton() ? Color.accent : Color.gray.opacity(0.5)
                            )
                            .cornerRadius(99)
                        }
                        .disabled(!validateButton())  // Disable if validation fails
                    }
                    .padding(.horizontal, 24)  // Horizontal padding for the form

                    Spacer()  // Pushes form content up
                }

                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "pencil.circle.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .padding(.trailing, 20)  // Adjust padding as needed
                            .offset(y: UIScreen.main.bounds.height / 2 - 20)  // Position near bottom of image
                    }
                    Spacer()
                }

        }
        .enableInjection()
    }

    #if DEBUG
        @ObserveInjection var forceRedraw
    #endif
}

#Preview {
    ProfileView()
}
