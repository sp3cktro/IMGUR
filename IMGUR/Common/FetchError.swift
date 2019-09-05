import Foundation

enum FetchError: Error {
    case badURL
    case badDecoded
    case networkError
    case unknown
}
