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

                        Text(
                            "\(String( movie.year )) | Direção: \(movie.direction) | Roteiro: \(movie.production)"
                        )
                        .foregroundColor(.white)
                        .font(.system(size: 12))

                        HStack(alignment: .center, spacing: 0) {
                            ZStack(alignment: .leading) {
                                Image(systemName: "person.circle.fill")
                                    .foregroundColor(.cta)
                                    .offset(x: -9)

                                Image(systemName: "person.circle.fill")
                                    .foregroundColor(.blue)
                                    .offset(x: 0)
                            }
                            .frame(width: 40)

                            Text("Disponível na Disney Plus e Prime Video")
                                .font(.caption2)
                                .foregroundColor(.cta)
                            Spacer()
                        }
                    }
                    .padding(.bottom, 24)

                    Text(movie.description)
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(nil)

                    HStack {
                        ForEach(movie.category, id: \.self) { category in
                            let bgColor = Color(
                                red: .random(in: 0...1),
                                green: .random(in: 0...1),
                                blue: .random(in: 0...1)
                            )
                            let uiColor = UIColor(bgColor)
                            let brightness = uiColor.cgColor.components?.prefix(3).reduce(0, +) ?? 0
                            let textColor: Color = brightness > 1.5 ? .black : .white

                            Text(category)
                                .font(.caption)
                                .foregroundColor(textColor)
                            .padding(4)
                            .padding(.trailing, 12)
                            .padding(.leading, 12)
                            .background(Color(
                                red: .random(in: 0...1),
                                green: .random(in: 0...1),
                                blue: .random(in: 0...1)
                            ))
                            .cornerRadius(99)
                        }
                    }
                }
                .frame(maxHeight: .infinity, alignment: .top)

                .padding()

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
                .padding()
                Spacer()
            }
            .padding(24)
            .padding(.bottom, 97)

            Image(systemName: movie.isFavorite ? "star.fill" : "star")
                .font(.system(size: 36))
                .foregroundColor(movie.isFavorite ? .cta : .white)
                .offset(x: 150, y: -16)
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
