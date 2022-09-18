
import Alamofire
import AlamofireImage



enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager{
    
    
    static var shared = NetworkManager()
    
    var imageCache = AutoPurgingImageCache()
    
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
    
    
    func fetchPhoto(from url: String) {
        AF.request(url)
            .validate()
            .responseImage { response in
                if response.value != nil {
                    self.imageCache.add(response.value!, withIdentifier: url)
                } else {
                    print(NetworkError.noData)
                }
            }
    }
  
}

