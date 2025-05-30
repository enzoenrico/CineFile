import Foundation
import SwiftUI

struct filter: Identifiable, Hashable {
	let id = UUID()
	var title: String
	var selected: Bool
}

struct ScrollFilters: View {
	@State private var filters: [filter] = [
		filter(title: "Ver tudo", selected: false),
		filter(title: "Em alta", selected: false),
		filter(title: "Comédia", selected: false),
		filter(title: "Só filé", selected: false),
	]

	var body: some View {

		ScrollView(.horizontal) {
			HStack {
				ForEach(Array(filters.enumerated()), id: \.element.id) { index, i in
					Button {
						filters[index].selected.toggle()
						print("pau")
					} label: {
						HStack {
							Text(i.title)
								.font(.caption)
								.fontWeight(.regular)
								.foregroundColor(i.selected ? .black : .gray)
						}
					}
					.padding(.leading, 24)
					.padding(.trailing, 24)
					.padding(.top, 8)
					.padding(.bottom, 8)
					.overlay(
						RoundedRectangle(cornerRadius: 20)
							.stroke(i.selected ? .cta : .gray, lineWidth: 1)
					)
				}
			}
			.padding(.leading)
			.padding(.trailing)
			.padding(2)
		}
		.frame(width: UIScreen.main.bounds.width)
		.enableInjection()
	}
}