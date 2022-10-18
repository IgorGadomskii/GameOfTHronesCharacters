import SwiftUI
import Combine
import AlamofireImage

extension ContentView {
    @MainActor class ContentViewModel: ObservableObject {

         var cache = NetworkManager.shared.imageCache
         @Published private(set) var list: [MovieCharacterModel]? {
            didSet {
                for model in list ?? [] {
                    NetworkManager.shared.fetchPhoto(from: model.imageUrl ?? "")
                }
            }
        }
        
        
        init(){
            fetchCharacters()
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
        
        
        func filterList(with text: String) -> [MovieCharacterModel] {
            let filteredList: [MovieCharacterModel]
            if text.isEmpty {
                filteredList = list ?? []
            } else {
             filteredList = list?.filter { $0.fullName?.localizedStandardContains(text) ?? true} ?? []
            }
            return filteredList
        }
    }
}





