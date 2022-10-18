
import Foundation
import SwiftUI
import Combine
import AlamofireImage


extension ContentView {
    
    struct NavigationLinkButton<Content: View > : View {
        
        @StateObject var viewModel = ContentViewModel()
       
        var imageUrl: String?
        var fullName: String?
        var content: () -> Content
        
        init(imageUrl: String, fullName: String, @ViewBuilder content: @escaping () -> Content) {
            self.imageUrl = imageUrl
            self.fullName = fullName
            self.content = content
        }
        
        var body: some View {
            NavigationLink(destination: content()) {
                HStack{
                    Image(uiImage: viewModel.cache.image(withIdentifier: imageUrl ?? "") ?? UIImage())
                                .resizable()
                                .frame(width: 80.0, height: 80.0)
                                .cornerRadius(50.0)
                                .padding(.horizontal, 10.0)
                    Text(fullName ?? "")
            }
            }
        }
    }
}
