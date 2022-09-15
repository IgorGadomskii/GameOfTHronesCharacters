

import Foundation
import Alamofire
import AlamofireImage
import SwiftUI


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
                    completion: @escaping(Result<UIImage, Error>) -> Void) {
    
        AF.request(url)
            .validate()
            .responseImage { response in
                switch response.result {
                case .success(let image):
                    DispatchQueue.global().async {
                        completion(.success(image))
                    }
                case .failure(_):
                    completion(.failure(NetworkError.noData))
    
                }
            }
    }
    
}

