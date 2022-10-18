
import Combine
import SwiftUI
import AlamofireImage
import UIKit

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    @State private var searchText: String = ""
    var filteredList: [MovieCharacterModel] { viewModel.filterList(with: searchText)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredList, id:\.self) {
                model in
                NavigationLinkButton(imageUrl: model.imageUrl ?? "", fullName: model.fullName ?? "", content: {DetailedInformation(image: viewModel.cache.image(withIdentifier: model.imageUrl ?? "") ?? UIImage(), fullName: model.fullName ?? "", title: model.title ?? "", family: model.family ?? "d")})
            }
            }
            .navigationTitle("All Characters")
            .foregroundColor(.black)
        }
        .searchable(text: $searchText)
        .onSubmit(of: .search) {
               filteredList
            }
        .onChange(of: searchText) { _ in
          filteredList
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

