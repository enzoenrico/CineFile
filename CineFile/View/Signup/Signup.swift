import SwiftUI

struct SignupView: View {
    @State private var selectedTabIndex: Int = 0
    private let totalTabs = 4 // Assuming Email, Name, Password

    var onSignupCompleted: () -> Void

    var body: some View {
        ZStack {
            Background()
                .ignoresSafeArea() 

            TabView(selection: $selectedTabIndex) {
                WelcomeView(selectedTabIndex: $selectedTabIndex, totalTabs: totalTabs)
                    .tag(0) 

                EmailView(selectedTabIndex: $selectedTabIndex, totalTabs: totalTabs)
                    .tag(1) 

                NameView(selectedTabIndex: $selectedTabIndex, totalTabs: totalTabs) 
                    .tag(2) 

                PasswordView(onSignupCompleted: self.onSignupCompleted) 
                    .tag(3) 
            }
            .tabViewStyle(.page(indexDisplayMode: .automatic)) 
            .ignoresSafeArea() 
        
        }
        .enableInjection()
    }

    #if DEBUG
        @ObserveInjection var forceRedraw
    #endif
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(onSignupCompleted: { print("Signup completed in preview") })
    }
}
