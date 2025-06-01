import SwiftUI

struct NameView: View {
    @AppStorage("cineFile_UserName") private var app_username  = ""
    @State var userName = ""
    // Binding to control the selected tab in the parent SignupView
    @Binding var selectedTabIndex: Int
    let totalTabs: Int // To prevent going out of bounds

    var body: some View {
        ZStack {
            // Background is handled by SignupView
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
                        Text("2 de 3 passos")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                    }

                    VStack(alignment: .leading) {
                        Text("Crie seu nome de usuário") // Changed from "Crie sua senha"
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                            .padding(.bottom, 8) // Added padding for consistency

                        TextField("Nome de usuário", text: $userName) // Placeholder directly in TextField
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
                    .padding(.bottom, 28) // Consistent padding

                    Button {
                        // Go to the next tab (PasswordView)
                        app_username = userName
                        if selectedTabIndex < totalTabs - 1 {
                            withAnimation {
                                selectedTabIndex += 1
                            }
                        } else {
                            // This case should ideally not be reached if totalTabs is correct
                            print("Trying to navigate beyond the last tab from NameView.")
                        }
                    } label: {
                        Text("Continuar")
                            .font(.system(size: 15))
                            .bold()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                    }
                    .background(Color.accentColor) // Use accent color
                    .cornerRadius(99)
                }
                // Removed fixed frame height to allow content to define its size
                // .frame(height: 282)
                Spacer() // Pushes content towards the center/top
            }
            .padding(24) // Padding for the main content VStack
        }
        .enableInjection()
    }

    #if DEBUG
        @ObserveInjection var forceRedraw
    #endif
}

// Update Preview for NameView
struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView(selectedTabIndex: .constant(1), totalTabs: 3)
            .background(Background()) // Add background for context
    }
}
