
import Foundation
import Combine


struct MovieCharacterModel: Decodable, Identifiable, Hashable {
   
    let id: Int?
    let firstName: String?
    let lastName: String?
    let fullName: String?
    let title: String?
    let family: String?
    let imageUrl: String?
    
}




