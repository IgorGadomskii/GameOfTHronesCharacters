

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager{
    
    static var shared = NetworkManager()
    
    init(){}
    
    func fetchRequest(from url: String,
                      completion: @escaping(Result<[MovieCharacterModel], AFError>) -> Void) {
        AF.request( url, method: .get)
            .validate()
            .responseDecodable(of: [MovieCharacterModel].self) { response in
                switch response.result {
                case .success(let data):
                    DispatchQueue.main.async {
                        completion(.success(data))
                    }
                case .failure(_):
                    completion(.failure(.createURLRequestFailed(error: NetworkError.decodingError) ))
                }
    }
}
    
    func fetchPhoto(from url: String,
                    completion: @escaping(Result<Data, Error>) -> Void) {
        AF.request(url, method: .get)
            .validate()
            .responseData{ response in
                switch response.result {
                case .success(let photoData):
                DispatchQueue.main.async {
                        completion(.success(photoData))
                    }
                case .failure(_):
                    completion(.failure(NetworkError.noData))
                }
            }
    }
        
}







    
