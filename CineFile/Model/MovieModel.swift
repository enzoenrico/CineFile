import Foundation

struct MovieModel: Identifiable, Hashable {
	let id = UUID()
	let title: String
	let year: Int
	var imageURL: String
	let description: String
	let production: [String]

	var category: [String]
	var streaming: [String]
	var imdb: String
	var direction: String

	var rating: Int

	var isFavorite: Bool = false
	var isSeen: Bool = false

}
