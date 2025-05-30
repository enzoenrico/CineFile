import SwiftUI
struct MoviePreview: View{
	var body: some View {
			VStack{
				
			}
	    .enableInjection()
	}

	#if DEBUG
	@ObserveInjection var forceRedraw
	#endif
}