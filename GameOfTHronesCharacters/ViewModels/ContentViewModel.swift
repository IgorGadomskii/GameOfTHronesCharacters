
import Foundation
import Combine
import UIKit

extension ContentView {
    @MainActor class ContentViewModel: ObservableObject {
        
        @Published private(set) var list: [MovieCharacterModel] = []
        
        
        init() { fetchCharacters()
        }
           
        private func fetchCharacters() {
            NetworkManager.shared.fetchRequest(from: "https://thronesapi.com/api/v2/Characters") { result in
                switch result {
                case .success(let peopleData):
                    self.list = peopleData
                case .failure(let error):
                    print(error)
                }
            }
        }
        
    func getImage (from url: String?) -> UIImage? {
        var image: UIImage?
            NetworkManager.shared.fetchPhoto(from: url ?? "", completion: { result in
                switch result {
                case .success(let data):
                    image = data
                case .failure(let error):
                    print(error)
                }
            })
        return image

        }
        
    }
}



