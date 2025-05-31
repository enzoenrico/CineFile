import Foundation

struct MovieModel: Identifiable, Hashable {
	let id = UUID()
	let title: String
	let year: Int
	let imageURL: String
	let description: String
	let direction: [String]
	let production: [String]
	let liked_by: [UUID]?
}