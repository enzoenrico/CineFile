//
//  ContentView.swift
//  CineFile
//
//  Created by Enzo & Galvão 🦠
//

// ess é o primeiro arquivo que vai ser carregado no app, a tela inicial dele
// a partir daqui a gente vai redirecionar geral pras outras telas

import SwiftUI

struct ContentView: View {
    @State var isSignedUp = false
    var body: some View {
        ZStack {
                // Use a state variable to control navigation
                NavigationView {
                    SignupView(
                        onSignupCompleted: {
                            // Navigate to HomeView when signup is completed
                            // This can be done by toggling a state variable
                            isSignedUp = true
                        }
                    )
                    .background(
                        NavigationLink(
                            destination: HomeView(),
                            isActive: $isSignedUp,
                            label: { EmptyView() }
                        )
                        .hidden()
                        .navigationBarBackButtonHidden(true)
                    )
                }
        }
        .enableInjection()
    }

    #if DEBUG
        @ObserveInjection var forceRedraw
    #endif
}

#Preview {
    ContentView()
}
