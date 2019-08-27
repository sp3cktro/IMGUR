import Foundation

// MARK: - Pixabay
struct Pixabay: Codable {
    let totalHits: Int
    let hits: [Hit]
}

// MARK: - Hit
struct Hit: Codable {
    let largeImageURL: String
    let tags: String
    let user: String
    let userImageURL: String
    let previewURL: String
}
