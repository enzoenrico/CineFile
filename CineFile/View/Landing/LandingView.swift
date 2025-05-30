import SwiftUI

struct LandingView: View {
    var body: some View {
        ZStack {
            Background()
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    Image("filme1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 418)
                        .clipped()

                    // banners
                        VStack {
                            ZStack {
                                ZStack {
                                    Color.cta2  //isso é uma view
                                    // :O
                                    BannerView(animationDuration: 20.0) {
                                        HStack {
                                            ForEach(1...5, id: \.self) { _ in
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

                                    BannerView(animationDuration: 20.0) {

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
                        VStack {
                            HStack {
                                Text("Os Incríveis")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .bold()
                                Image(systemName: "star.fill")
                                    .foregroundColor(.cta)
                                    .font(.title2)
                            }
                            .border(.blue)

                            Text("2004 | Direção: Brad Bird | Roteiro: Brad Bird")
                                .font(.body)
                                .fontWeight(.light)
                                .foregroundColor(.white)

                            HStack(alignment: .center, spacing: 0) {
                                HStack {
                                    Image(systemName: "person.circle.fill")
                                        .foregroundColor(.white)
                                    Image(systemName: "person.circle.fill")
                                        .offset(x: -17, y: 0)
                                        .foregroundColor(.blue)
                                    Image(systemName: "person.circle.fill")
                                        .offset(x: -32, y: 0)
                                        .foregroundColor(.cta)
                                }
                                .border(.tint)
                                Text("Nat e 10 outros amigos recomendam esse filme")
                                    .font(.caption2)
                                    .foregroundColor(.cta)
                            }

                            Button {
                                
                            } label: {

                                HStack {
                                    Image(systemName: "info.circle")
                                        .bold()
                                    Text("Ver sinópse")
                                        .font(.system(size: 15))
                                        .bold()
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width)
                            .padding(.leading, 96)
                            .padding(.trailing, 96)
                            .padding(.top, 8)
                            .padding(.bottom, 8)
                            .foregroundColor(.white)
                            .background(.accent)
                            .cornerRadius(20)

                            Spacer()
                            ScrollFilters()

                    }

                }
                .frame(height: UIScreen.main.bounds.height / 2)  // This might need adjustment based on content
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
