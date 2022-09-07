

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noDate
    case decodingError
}

class NetworkManager{
    
    static var shared = NetworkManager()
    
    init(){}
    
    func fetchRequest(_ url: String?, completion: @escaping(Result<[MovieCharacterModel], NetworkError>) -> Void)
    {
        AF.request(url ?? "")
            .validate()
            .responseDecodable(of: MovieCharacterModel.self) {
                dataResponse in
                    switch dataResponse.result {
                    case .success(let value):
                        let movieCharacters = MovieCharacterModel.getCharacters(value)
                        DispatchQueue.main.async {
                            completion(.success(movieCharacters(self)))
                        }
                    case .failure:
                        completion(.failure(.decodingError))
            }
        }
    }
}

