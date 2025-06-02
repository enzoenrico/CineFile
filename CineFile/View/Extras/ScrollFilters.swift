import Foundation
import SwiftUI

struct Filter: Identifiable, Hashable {
	let id = UUID()
	var title: String
	var selected: Bool
}

struct ScrollFilters: View {
	@State var filters: [Filter]
	var body: some View {

		ScrollView(.horizontal) {
			HStack {
				ForEach(Array(filters.enumerated()), id: \.element.id) { index, i in
					Button {
						filters[index].selected.toggle()
						print(filters[index])
					} label: {
						HStack {
							Text(i.title)
								.font(.caption)
								.fontWeight(.regular)
								.foregroundColor(i.selected ? .black : .gray)
						}
						.padding(.leading, 24)
						.padding(.trailing, 24)
						.padding(.top, 8)
						.padding(.bottom, 8)
						.background(
							RoundedRectangle(cornerRadius: 20)
								.fill(i.selected ? Color.cta : Color.clear)
						)
					}
					.overlay(
						RoundedRectangle(cornerRadius: 20)
							.stroke(i.selected ? .cta : .gray, lineWidth: 1)
					)
				}
			}
			.padding(.leading)
			.padding(.trailing)
			.contentShape(Rectangle())
		}
		.frame(width: UIScreen.main.bounds.width)
		.enableInjection()
	}

	#if DEBUG
		@ObserveInjection var forceRedraw
	#endif

}
