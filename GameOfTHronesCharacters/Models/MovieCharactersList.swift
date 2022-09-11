
import Foundation


class MovieCharactersList {
    
    @Published private var networkManager = NetworkManager()
    
    var charactersList: [MovieCharacterModel] = []
    
    init() {
        fetchCharacters()
    }
    
    func fetchCharacters() {
        NetworkManager.shared.fetchRequest(from: "https://thronesapi.com/api/v2/Characters") { result in
            switch result {
            case .success(let peopleData):
                self.charactersList = peopleData
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
