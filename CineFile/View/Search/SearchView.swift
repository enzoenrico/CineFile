import SwiftUI

struct SearchView: View {
    let columns = Array(repeating: GridItem(.flexible(minimum: 150)), count: 2)

    @State var filters = [
        Filter(title: "Ver tudo", selected: true),
        Filter(title: "Em alta", selected: false),
        Filter(title: "Comédia", selected: false),
        Filter(title: "Só filé", selected: false),
    ]

    @State var searchTitle: String = ""
    private var movies = Array.sample()

    var filtered: [MovieModel] {
        movies.filter { movie in
            let matchesTitle = movie.title.localizedCaseInsensitiveContains(searchTitle)
            let matchesDescription = movie.description.localizedCaseInsensitiveContains(searchTitle)
            let matchesCategory = movie.category.contains(searchTitle)
            return searchTitle.isEmpty || matchesTitle || matchesDescription || matchesCategory
        }
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                // 1) your search field
                TextField("Pesquise por seus filmes", text: $searchTitle)
                    .padding(12)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(20)
                    .padding(.horizontal, 24)

                // 2) your filters
                ScrollFilters(filters: filters)
                    .padding(.vertical)

                // 3) your grid
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(filtered) { movie in
                        NavigationLink(destination: DetailsView(movie: movie)) {
                            MoviePreviewSmall(movie: movie)
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom) // so you can scroll past last item
            }
            .background(Background().ignoresSafeArea(edges: .top))
            .navigationTitle("Buscar")
            .navigationBarTitleDisplayMode(.inline)
        }
        .preferredColorScheme(.dark)
        .enableInjection()
    }

    #if DEBUG
        @ObserveInjection var forceRedraw
    #endif
}

#Preview {
    SearchView()
}
