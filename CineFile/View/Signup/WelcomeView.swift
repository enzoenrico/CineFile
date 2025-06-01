import SwiftUI

struct WelcomeView: View {
	@Binding var selectedTabIndex: Int
	let totalTabs: Int  // To prevent going out of bounds

	// State to control the animation
	@State private var imageAppeared: Bool = false

	var body: some View {
		ZStack {
			Background()
				.ignoresSafeArea()
			VStack {
				Spacer()

				Image("app_logo")
					.resizable()
					.scaledToFit()
					.frame(width: 150)
				ZStack {
					RoundedRectangle(cornerRadius: 200)
						.frame(width: 130, height: 28)
						.offset(x: -53, y: 3)
						.foregroundColor(.cta)

					Text("Os  18 filmes  que você com ")
						.font(.system(size: 28))
						.fontWidth(.expanded)
						.fontWeight(.thin)
						+ Text("certeza").bold()
						.font(.system(size: 28))
						.fontWidth(.expanded)
						+ Text(" precisa ver antes de morrer.")
						.font(.system(size: 28))
						.fontWidth(.expanded)
						.fontWeight(.thin)
				}
				.padding()

				Spacer()

				// This is the image to animate
				Image("kid-named-pubert")
					.resizable()
					.aspectRatio(1, contentMode: .fill)
					.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
					.offset(y: imageAppeared ? 0 : UIScreen.main.bounds.height / 2.5)  // Start off-screen below
					.animation(
						.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0).delay(0.2),
						value: imageAppeared)  // Apply animation
				// You can also use .easeInOut or other timing curves:
				// .animation(.easeInOut(duration: 0.8).delay(0.2), value: imageAppeared)

			}
			.ignoresSafeArea()
			.onAppear {
				// Trigger the animation when the view appears
				DispatchQueue.main.asyncAfter(deadline: .now()) {
					self.imageAppeared = true

				}
			}
		}
		.enableInjection()
	}

	#if DEBUG
		@ObserveInjection var forceRedraw
	#endif
}

// Preview needs to provide the bindings
struct WelcomeView_Previews: PreviewProvider {
	static var previews: some View {
		WelcomeView(selectedTabIndex: .constant(0), totalTabs: 3)
	}
}
