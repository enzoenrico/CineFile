import SwiftUI

struct ProfileView: View {
    @State var userName: String = ""
    @State var userPassword: String = ""
    func validateButton() -> Bool {
        return !userName.isEmpty || !userPassword.isEmpty
    }
    var body: some View {
        ZStack {
            Background()
            
            VStack{
                Image("image")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
                Spacer()
                    
                VStack {
                    VStack(alignment: .leading) {
                        Text("Nome de usuário")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                        
                        TextField(text: $userName) {
                            Text("florakoti")
                                .foregroundColor(.white)
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
                    
                    
                    VStack(alignment: .leading) {
                        Text("Alterar senha")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                        
                        SecureField(text: $userPassword) {
                            Text("Florinha123")
                                .foregroundColor(.white)
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
                                .stroke(validateButton() ? Color.accentColor : Color.white, lineWidth: 0.5)
                            
                                .fill(validateButton() ? Color.accent : Color.gray.opacity(0))
                            
                            HStack {
                                Image(systemName: "square.and.arrow.down")
                                    .foregroundColor(validateButton() ? Color.white : Color.gray)
                                    .padding(.leading, 96)
                                
                                Text("Salvar alterações")
                                    .font(.system(size: 15))
                                    .bold   ()
                                    .foregroundColor(validateButton() ? Color.white : Color.gray)
                                    .padding(.trailing, 96)
                                    .padding(.top, 8)
                                    .padding(.bottom, 8)
                                
                                
                                //o estado do botao de salvar alterações
                            }
                            
                            
                        }
                    } .frame(height: 42)
                        .disabled(true)
                }
                .padding(24)
                .padding(.bottom, 97)
                    
                
                
                
                Spacer()
            } .ignoresSafeArea()
            
            Image(systemName: "pencil.circle.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
                .padding(.leading, 320)
                .padding(.bottom, 30)
            
        }
        
    }
}

#Preview {
    ProfileView()
}

