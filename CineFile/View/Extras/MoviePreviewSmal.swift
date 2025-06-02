import SwiftUI

struct MoviePreviewSmall: View {
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
								.font(.system(size: 12))
								.fontWeight(.bold)
								.foregroundColor(.white)
								.padding(.leading)
								.lineLimit(1)
						}

					}

					HStack(alignment: .center) {
						Text("Ver sinópse")
							.font(.system(size: 12))
							.foregroundColor(.white)
						Image(systemName: "chevron.forward")
							.font(.system(size: 11))
							.foregroundColor(.white)
					}
					.padding(.leading, 24)

				}
				.cornerRadius(10)

			}
		}
		.enableInjection()
	}

	#if DEBUG
		@ObserveInjection var forceRedraw
	#endif
}
