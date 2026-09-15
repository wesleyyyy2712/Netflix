//
//  NetworkManager.swift
//  Netflix
//
//  Created by Shishir Rijal on 24/10/2024.
//

import Foundation
import Combine



import Foundation
class NetworkManager {
    static let shared = NetworkManager()
    private init() { }

    func performRequest<T: Codable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(Secrets.getAPIKey())", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(NetworkError.network(error)))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                completion(.failure(NetworkError.badUrlResponse))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedResponse = try decoder.decode(T.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(NetworkError.decoding(error)))
            }
        }
        task.resume()
    }
}

enum NetworkError: Error {
    case network(Error)
    case badUrlResponse
    case noData
    case decoding(Error)
    case unknown

    var errorDescription: String {
        switch self {
        case .network(let error): return "[🔌] Network error: \(error.localizedDescription)"
        case .badUrlResponse: return "[🔥] Bad response from server"
        case .noData: return "[⚠️] No data received from server"
        case .decoding(let error): return "[📉] Decoding error: \(error.localizedDescription)"
        case .unknown: return "[❓] Unknown error occurred"
        }
    }
}



