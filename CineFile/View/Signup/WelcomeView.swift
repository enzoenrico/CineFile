import SwiftUI

struct WelcomeView: View {
	@Binding var selectedTabIndex: Int
	let totalTabs: Int  // To prevent going out of bounds

	// State to control the animation
	@State private var imageAppeared: Bool = false
	@State private var hovering: Bool = false

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
						.offset(x: -48, y: 3)
						.foregroundColor(.cta)

					Text("Os  18 filmes  que você com ")
						.font(.system(size: 28))
						.fontWidth(.expanded)
						.fontWeight(.thin)
						.foregroundColor(.white)
						+ Text("certeza").bold()
						.font(.system(size: 28))
						.fontWidth(.expanded)
						.foregroundColor(.white)
						+ Text(" precisa ver antes de morrer.")
						.font(.system(size: 28))
						.fontWidth(.expanded)
						.fontWeight(.thin)
						.foregroundColor(.white)
				}
				.padding()

				Spacer()

				// This is the image to animate and hover
				Image("kid-named-pubert")
					.resizable()
					.aspectRatio(1, contentMode: .fill)
					.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
					.offset(y: imageAppeared ? (hovering ? -16 : 0) : UIScreen.main.bounds.height / 2.5) // Hover up/down after appearing
					.animation(
						.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0).delay(0.2),
						value: imageAppeared)
					.animation(
						.easeInOut(duration: 1.2).repeatForever(autoreverses: true),
						value: hovering
					)
					.onAppear {
						if imageAppeared {
							hovering = true
						} else {
							DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
								hovering = true
							}
						}
					}

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
