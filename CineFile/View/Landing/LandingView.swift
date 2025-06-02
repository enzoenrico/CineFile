import SwiftUI

struct LandingView: View {
    @State var filters = [
        Filter(title: "Ver tudo", selected: true),
        Filter(title: "Em alta", selected: false),
        Filter(title: "Comédia", selected: false),
        Filter(title: "Só filé", selected: false),
    ]

    @State var movies: [MovieModel] = Array.sample()

    var body: some View {
        ZStack {
            Background()
                .ignoresSafeArea()
            ScrollView(.vertical) {
                VStack {  // This is the main VStack within the ScrollView
                    Image("image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 480)
                        .clipped()
                    VStack {
                        ZStack {
                            ZStack {
                                Color.cta2  //isso é uma view
                                // :O
                                BannerView(animationDuration: 35.0) {
                                    HStack {
                                        ForEach(1...15, id: \.self) { _ in
                                            Image(systemName: "staroflife.fill")
                                                .foregroundColor(.lightPink)
                                                .padding(.leading)
                                                .padding(.trailing)
                                            Text("filézinho em destaque")
                                                .foregroundColor(.lightPink)
                                                .fixedSize(horizontal: true, vertical: false)
                                                .padding(.trailing)
                                                .padding(.leading)
                                        }
                                        .padding(2)
                                    }
                                    // não colocar .frame!!
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width * 2)
                            .background(.cta2)
                            .rotationEffect(.degrees(354))
                            .offset(y: -35)

                            // This is the container for the infinitely scrolling banner
                            ZStack {
                                Color.lightPink  //isso é uma view
                                // :O

                                BannerView(animationDuration: 15.0) {

                                    HStack {
                                        ForEach(1...5, id: \.self) { _ in
                                            Image(systemName: "staroflife.fill")
                                                .foregroundColor(.cta2)
                                                .font(.system(size: 16))
                                                .padding(.leading)
                                                .padding(.trailing)
                                            Text("filézinho em destaque")
                                                .foregroundColor(.cta2)
                                                .font(.system(size: 16))
                                                .fixedSize(horizontal: true, vertical: false)
                                                .padding(.trailing)
                                                .padding(.leading)
                                        }
                                    }
                                    .padding(2)
                                    // não colocar .frame!!
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width * 2, )
                            .rotationEffect(.degrees(6))
                            .offset(y: -35)
                        }
                    }
                    //MARK: abaixo da imagem
                    VStack(spacing: 10) {
                        Text("Os Incríveis")
                            .font(.title)
                            .foregroundColor(.white)
                            .bold()

                        Text("2004 | Direção: Brad Bird | Roteiro: Brad Bird")
                            .font(.system(size: 12))
                            .fontWeight(.light)
                            .foregroundColor(.white)

                        FriendsFavorites(n: 10)
                        Button {

                        } label: {
                            HStack {
                                Image(systemName: "info.circle")
                                    .bold()
                                Text("Ver sinopse")
                                    .font(.system(size: 15))
                                    .bold()
                            }
                        }
                        .frame(width: .infinity)
                        .padding(.leading, 96)
                        .padding(.trailing, 96)
                        .padding(.top, 8)
                        .padding(.bottom, 8)
                        .foregroundColor(.white)
                        .background(.accent)
                        .cornerRadius(20)
                        .disabled(true)

                        Spacer()
                            .frame(height: 16)

                        HStack {
                            Rectangle()
                                .frame(height: 0.5)
                                .foregroundColor(.gray)

                            Text("Veja mais")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)

                            Rectangle()
                                .frame(height: 0.5)
                                .foregroundColor(.gray)
                        }
                        // .overlay(.gray)
                        .frame(width: UIScreen.main.bounds.width - 50)

                        Spacer()
                            .frame(height: 16)

                        ScrollFilters(filters: filters)
                            .zIndex(2)

                        LazyVStack(spacing: 10) {
                            ForEach($movies) { $movie in
                                MoviePreview(movie: movie)
                                    .frame(width: 360, height: 250)
                            }
                        }
                    }

                }
                // .ignoresSafeArea()
                .offset(y: -(418.0 / 6.0))
            }
        }
        .padding()
        .enableInjection()
    }

    #if DEBUG
        @ObserveInjection var forceRedraw
    #endif
}

#Preview {
    LandingView()
}
