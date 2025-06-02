import SwiftUI

struct DetailsView: View {
    @State var movie: MovieModel
    var body: some View {
        ZStack {
            Background()

            VStack {
                Image(movie.imageURL)
                    .resizable()
                    .frame(
                        width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2
                    )
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack {
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                            .bold()

                        Text("\(String( movie.year )) | Direção: \(movie.direction) | Roteiro: \(movie.production)")
                            .foregroundColor(.white)
                            .font(.system(size: 12))

                        HStack(alignment: .center, spacing: 0) {
                            ZStack(alignment: .leading) {
                                Image(systemName: "person.circle.fill")
                                    .foregroundColor(.cta)
                                    .offset(x: -9)  // Adjust if actual image sizes differ

                                Image(systemName: "person.circle.fill")
                                    .foregroundColor(.blue)
                                    .offset(x: 0)  // Adjust if actual image sizes differ

                            }
                            .frame(width: 40)  // Example if you calculate the exact width

                            Text("Disponível na Disney Plus e Prime Video")
                                .font(.caption2)
                                .foregroundColor(.cta)
                        }
                        .border(.blue)
                    }
                    .padding(.bottom, 24)

                    Text(
                        movie.description
                    )
                    .font(.system(size: 12))
                    .foregroundColor(.white)

                }
                .padding()
                .border(.blue)

                Button {

                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 99)
                            .fill(Color.accent)

                        HStack {
                            Image(systemName: "play")
                                .foregroundColor(Color.white)
                                .padding(.leading, 96)

                            Text("Assistir agora")
                                .font(.system(size: 15))
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(.trailing, 96)
                                .padding(.top, 8)
                                .padding(.bottom, 8)

                        }

                    }
                }
                .frame(height: 42)
            }
            .padding(24)
            .padding(.bottom, 97)

            Image(systemName: movie.isFavorite ? "star.fill" : "star")
                .font(.system(size: 36))
                .foregroundColor(movie.isFavorite ? .cta : .white)
                .offset(x: 150)
                .onTapGesture {
                    movie.isFavorite.toggle()
                }

        }
        .ignoresSafeArea()
        .enableInjection()

    }

    #if DEBUG
        @ObserveInjection var forceRedraw
    #endif

}

