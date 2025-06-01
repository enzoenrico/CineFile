import SwiftUI

struct LandingView: View {
    @State var filters = [
        Filter(title: "Ver tudo", selected: false),
        Filter(title: "Em alta", selected: false),
        Filter(title: "Comédia", selected: false),
        Filter(title: "Só filé", selected: false),
    ]

    var body: some View {
        ZStack {
            Background()
                .ignoresSafeArea()
            ScrollView(.vertical) {
                VStack {  // This is the main VStack within the ScrollView
                    Image("filme1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 418)
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
                        HStack {
                            Text("Os Incríveis")
                                .font(.title)
                                .foregroundColor(.white)
                                .bold()
                           
                        }

                        Text("2004 | Direção: Brad Bird | Roteiro: Brad Bird")
                            .font(.system(size: 12))
                            .fontWeight(.light)
                            .foregroundColor(.white)

                        FriendsFavorites()
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

                        Spacer()
                            .frame(height: 16)

                        ScrollFilters(filters: filters)
                            .padding(.bottom)

                        VStack(spacing: 10) {
                            MoviePreview(
                                movie: MovieModel(
                                    title: "Os Incríveis",
                                    year: 2004,
                                    imageURL: "filme16",
                                    description:
                                        "Uma família de super-heróis tenta viver uma vida normal enquanto enfrenta vilões e salva o mundo.",
                                    direction: ["Brad Bird"],
                                    production: ["Pixar Animation Studios"],
                                    liked_by: nil
                                ))
                        }
                    }

                }
                .ignoresSafeArea()
                .offset(y: -(418.0 / 6.0))  
            }
        }
        .navigationBarBackButtonHidden(true)
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
