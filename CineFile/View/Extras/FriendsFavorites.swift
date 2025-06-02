import SwiftUI

struct FriendsFavorites: View {
	let n: Int  
	
	init(n: Int?) {
		self.n = n ?? 10
	}

	var body: some View {
		HStack(alignment: .center, spacing: 0) {
			ZStack(alignment: .leading) {
				Image(systemName: "person.circle.fill")
					.foregroundColor(.cta)
					.offset(x: -18)  // Adjust if actual image sizes differ

				Image(systemName: "person.circle.fill")
					.foregroundColor(.blue)
					.offset(x: -9)  // Adjust if actual image sizes differ

				Image(systemName: "person.circle.fill")
					.foregroundColor(.white)
			}
			.frame(width: 40)  // Example if you calculate the exact width

			Text("\(String(n)) amigos recomendam esse filme, é filé!")
				.font(.caption2)
				.foregroundColor(.cta)
		}
		.padding(.leading)
		.padding(.trailing)
	    .enableInjection()
	}

	#if DEBUG
	@ObserveInjection var forceRedraw
	#endif
}
