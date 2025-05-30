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
    var body: some View {
        ZStack {
            Background()
            NavigationStack {
                NavigationLink(destination: EmailView()) {
                    Text("cadastro / login")
                }
                NavigationLink(destination: LandingView()) {
                    Text("landing")
                }

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
