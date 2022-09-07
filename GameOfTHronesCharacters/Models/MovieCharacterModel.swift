
import Foundation


struct MovieCharacterModel: Codable {
    
    let firstName: String?
    let lastName: String?
    let fullName: String?
    let title: String?
    let family: String?
    let imageUrl: String?
    
    init(characterData: [String: Any]) {
        firstName = characterData["firstName"] as? String
        lastName = characterData["lastName"] as? String
        fullName = characterData["firstName"] as? String
        title = characterData["title"] as? String
        family = characterData["family"] as? String
        imageUrl = characterData["imageUrl"] as? String
    }
}

extension MovieCharacterModel {
    
    func getCharacters(from value: Any) -> [MovieCharacterModel] {
        guard let charactersData = value as? [[String : Any]] else { return []}
        return charactersData.compactMap { MovieCharacterModel(characterData: $0) }
    }
}
