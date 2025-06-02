import SwiftUI

struct HomeView: View {
    @State private var selectedHomeTab: Int = 0  // Default to LandingView (tag 0)

    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance.backgroundColor = UIColor(Color.background)
        tabBarAppearance.shadowImage = UIImage()  // Removes the top separator line
        UITabBar.appearance().standardAppearance = tabBarAppearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }

    var body: some View {
        ZStack {
            Background()
                .ignoresSafeArea()
            TabView(selection: $selectedHomeTab) {
                LandingView()  // LandingView will now handle presenting the signup flow
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(0)  // Tag for LandingView

                SearchView()
                .tabItem{
                    Label("Search", systemImage: "magnifyingglass")
                }

                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
                    .tag(1)
                    
            }
            .accentColor(.cta)
        }
        .navigationBarBackButtonHidden(true)
        .enableInjection()
    }

    #if DEBUG
        @ObserveInjection var forceRedraw
    #endif
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
