import SwiftUI

struct EmailView: View {
    @AppStorage("cineFile_UserEmail") private var app_email = ""
    @State var userEmail = ""
    @Binding var selectedTabIndex: Int
    let totalTabs: Int  // To prevent going out of bounds

    var body: some View {
        ZStack {
            // Removed Background() from here as SignupView handles the main background
            VStack(alignment: .leading) {
                Spacer()
                VStack(alignment: .leading, spacing: 14.0) {
                    Text("Crie sua conta")
                        .font(.title)
                        .foregroundColor(.white)
                        .bold()

                    HStack(spacing: 3) {
                        Text("Já possui sua conta?")
                            .font(.system(size: 16))
                            .foregroundColor(.white)

                        Text("Fazer login")
                            .font(.system(size: 16))
                            .foregroundColor(.cta)
                            .underline()
                    }

                    Spacer()
                        .frame(height: 48)

                    VStack(alignment: .leading) {
                        Text("Endereço de email")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                            .padding(.bottom, 8)

                        TextField("Email", text: $userEmail)  // Placeholder directly in TextField
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .font(.system(size: 16))
                            .padding(12)
                            .foregroundColor(.white)
                            .background(Color.white.opacity(0.1))  // Subtle background for TextField
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.white, lineWidth: 0.5)
                            )
                    }
                    .padding(.bottom, 40)

                    Button {
                        app_email = userEmail
                        if selectedTabIndex < totalTabs - 1 {
                            withAnimation {
                                selectedTabIndex += 1
                            }
                        } else {
                            print("Final step reached or error")
                        }
                    } label: {
                        Text("Continuar")
                            .font(.system(size: 15))
                            .bold()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)  // Make button take full available width
                            .padding(.vertical, 12)
                    }
                    .background(Color.accent)  // Use accent color for button background
                    .cornerRadius(99)

                    HStack {
                        Rectangle()
                            .frame(height: 0.5)
                            .foregroundColor(.gray)

                        Text("ou")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)

                        Rectangle()
                            .frame(height: 0.5)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical)  // Add some spacing around "ou"

                    Button {
                        // Action for Apple Sign In
                    } label: {
                        HStack(alignment: .center) {
                            Image(systemName: "apple.logo")  // Corrected system name
                                .font(.system(size: 18))  // Slightly larger icon
                                .foregroundColor(.black)

                            Text("Continuar com Apple")  // Corrected text
                                .font(.system(size: 15))
                                .bold()
                                .foregroundColor(.black)
                        }
                        .frame(maxWidth: .infinity)  // Make button take full available width
                        .padding(.vertical, 12)
                    }
                    .background(Color.white)  // White background for Apple button
                    .cornerRadius(99)

                }
                // Removed fixed frame height to allow content to define its size
                // .frame(height: 280)

                Spacer()  // Pushes content towards the center/top depending on other spacers
                // Removed fixed height spacer to be more adaptive
                // .frame(height: 242)

            }
            .padding(24)  // Padding for the main content VStack
            // Removed fixed frame on VStack, let content and spacers define size
            // .frame(
            //     width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 124
            // )
        }
        // .ignoresSafeArea() // EmailView itself might not need to ignore safe area if SignupView's TabView does
        .enableInjection()
    }

    #if DEBUG
        @ObserveInjection var forceRedraw
    #endif
}

// Update Preview for EmailView
struct EmailView_Previews: PreviewProvider {
    static var previews: some View {
        // Provide a constant binding for the preview
        EmailView(selectedTabIndex: .constant(0), totalTabs: 3)
            .background(Background())  // Add background for context in preview
    }
}
