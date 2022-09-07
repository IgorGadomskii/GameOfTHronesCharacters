
import Foundation
import Combine

class DataModel: ObservableObject {
    
    static var shared = DataModel()
    
    var list: [MovieCharacterModel] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        NetworkManager.shared.fetchRequest("https://thronesapi.com/api/v2/Characters") { result in
            switch result {
            case .success(let characters):
                self.list = characters
            case .failure(.noDate):
                print("There is no data")
            case .failure(.invalidURL):
                print("404 error")
            case .failure(.decodingError):
                print("")
            }
        }
    }
}

