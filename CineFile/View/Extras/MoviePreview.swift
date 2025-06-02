import SwiftUI

struct MoviePreview: View {
	@State var movie: MovieModel

	var body: some View {
		NavigationLink(destination: DetailsView(movie: movie)) {
			ZStack {
				VStack(alignment: .leading) {
					Image(movie.imageURL)
						.resizable()
						.scaledToFill()
						.frame(maxWidth: .infinity, maxHeight: 180)
						.clipped()
						.cornerRadius(16)
						.padding([.top, .horizontal])

					HStack(alignment: .center) {
						HStack(alignment: .center) {
							Text(movie.title)
								.font(.system(size: 16))
								.fontWeight(.bold)
								.foregroundColor(.white)
								.padding(.leading)
								.lineLimit(1)

							Text("|")
								.font(.system(size: 16))
								.fontWeight(.bold)
								.foregroundColor(.white)

							Text(String(movie.year))
								.font(.system(size: 16))
								.fontWeight(.regular)
								.foregroundColor(.white)
						}

						Spacer()

						HStack(alignment: .center) {
							Text("Ver sinópse")
								.font(.system(size: 12))
								.foregroundColor(.white)
							Image(systemName: "chevron.forward")
								.font(.system(size: 11))
								.foregroundColor(.white)
						}
						.padding(.trailing)

					}

					Spacer()

					FriendsFavorites(n: Int.random(in: 1...10))
						.padding(.leading)
						.padding(.bottom)

				}
				// .background(.regularMaterial.blendMode(.color))
				// .frame(width: 360, height: 250)
				.cornerRadius(10)

				Image(systemName: "star.fill")
					.resizable()
					.frame(width: 20, height: 20)
					.scaledToFit()
					.foregroundColor(.cta)
					.offset(x: 140, y: -100)
			}
		}
		.enableInjection()
	}

	#if DEBUG
		@ObserveInjection var forceRedraw
	#endif
}
