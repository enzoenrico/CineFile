import SwiftUI

struct MoviePreview: View {
	let movie: MovieModel

	var body: some View {
		VStack(alignment: .leading) {
			Image(movie.imageURL)
				.resizable()
				// .scaledToFill()
				.cornerRadius(16)
				.frame(width: .infinity)
				.padding()

			HStack(alignment: .center) {
				HStack(alignment: .center) {
					Text(movie.title)
						.font(.system(size: 16))
						.fontWeight(.bold)
						.foregroundColor(.white)
						.padding(.leading)

					Text("|")
						.font(.system(size: 16))
						.fontWeight(.bold)
						.foregroundColor(.white)

					Text(String(movie.year))
						.font(.system(size: 16))
						.fontWeight(.bold)
						.foregroundColor(.white)
				}

				Spacer()

				HStack(alignment: .center) {
					Text("Ver mais")
						.font(.system(size: 12))
						.foregroundColor(.white)
					Image(systemName: "chevron.forward")
						.font(.system(size: 11))
						.foregroundColor(.white)
				}
				.padding(.trailing)

			}

			FriendsFavorites()
				.padding(.leading)
				.padding(.bottom)

		}
		// .background(.regularMaterial.blendMode(.color))
		.frame(width: 360, height: 260)
		.cornerRadius(10)
		.enableInjection()
	}

	#if DEBUG
		@ObserveInjection var forceRedraw
	#endif
}
