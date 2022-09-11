

import Foundation
import Combine

extension ContentView {
    
    final class ViewModel: ObservableObject {
        
        @Published private var networkManager = NetworkManager()
        
        var charactersList: [MovieCharacterModel] = []
        
        
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
    
}
