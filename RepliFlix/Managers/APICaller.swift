import Foundation

final class APICaller {
    static let shared = APICaller()

    private init() {}

    private let baseURL = "https://api.themoviedb.org/3"

    private var apiKey: String {
        ProcessInfo.processInfo.environment["TMDB_API_KEY"] ?? ""
    }

    private enum APIError: Error {
        case missingAPIKey
        case invalidURL
        case noResults
        case requestFailed
    }

    private struct TitleResponse: Codable {
        let results: [Title]
    }

    private struct VideoResponse: Codable {
        let results: [Video]
    }

    private struct Video: Codable {
        let key: String
        let site: String
        let type: String
    }

    private func request<T: Decodable>(
        path: String,
        queryItems: [URLQueryItem] = [],
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard !apiKey.isEmpty else {
            completion(.failure(APIError.missingAPIKey))
            return
        }

        guard var components = URLComponents(string: baseURL + path) else {
            completion(.failure(APIError.invalidURL))
            return
        }

        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: "en-US")
        ] + queryItems

        guard let url = components.url else {
            completion(.failure(APIError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  200..<300 ~= httpResponse.statusCode,
                  let data = data else {
                completion(.failure(APIError.requestFailed))
                return
            }

            do {
                completion(.success(try JSONDecoder().decode(T.self, from: data)))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    private func titleRequest(
        path: String,
        queryItems: [URLQueryItem] = [],
        completion: @escaping (Result<[Title], Error>) -> Void
    ) {
        request(path: path, queryItems: queryItems) { (result: Result<TitleResponse, Error>) in
            completion(result.map { $0.results })
        }
    }

    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        titleRequest(path: "/trending/movie/day", completion: completion)
    }

    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        titleRequest(path: "/trending/tv/day", completion: completion)
    }

    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
        titleRequest(path: "/movie/popular", completion: completion)
    }

    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        titleRequest(path: "/movie/upcoming", completion: completion)
    }

    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
        titleRequest(path: "/movie/top_rated", completion: completion)
    }

    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        titleRequest(
            path: "/discover/movie",
            queryItems: [URLQueryItem(name: "sort_by", value: "popularity.desc")],
            completion: completion
        )
    }

    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
        titleRequest(
            path: "/search/movie",
            queryItems: [URLQueryItem(name: "query", value: query)],
            completion: completion
        )
    }

    func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
        request(
            path: "/search/movie",
            queryItems: [URLQueryItem(name: "query", value: query)]
        ) { [weak self] (result: Result<TitleResponse, Error>) in
            guard let self = self else { return }

            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let response):
                guard let title = response.results.first else {
                    completion(.failure(APIError.noResults))
                    return
                }

                self.request(path: "/movie/\(title.id)/videos") { (videoResult: Result<VideoResponse, Error>) in
                    switch videoResult {
                    case .failure(let error):
                        completion(.failure(error))
                    case .success(let videos):
                        guard let video = videos.results.first(where: {
                            $0.site == "YouTube" && $0.type == "Trailer"
                        }) ?? videos.results.first(where: { $0.site == "YouTube" }) else {
                            completion(.failure(APIError.noResults))
                            return
                        }

                        completion(.success(VideoElement(
                            id: IdVideoElement(kind: "youtube#video", videoId: video.key)
                        )))
                    }
                }
            }
        }
    }
}
