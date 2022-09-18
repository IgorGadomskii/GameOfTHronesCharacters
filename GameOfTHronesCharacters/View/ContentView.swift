
import Combine
import SwiftUI
import AlamofireImage
import UIKit

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    @State private var searchText: String = ""

    var body: some View {
        NavigationView {
        List(viewModel.list ?? []) { model in
            HStack{
                Image(uiImage: viewModel.cache.image(withIdentifier: model.imageUrl ?? "") ?? UIImage())
                    .resizable()
                    .frame(width: 80.0, height: 80.0)
                    .cornerRadius(50.0)
                    .padding(.horizontal, 10.0)
                Text(model.fullName ?? "")
            }
        }
        .searchable(text: $searchText) {
            ForEach(viewModel.filterList(with: searchText), id:\.self) {result in
                HStack{
                    Image(uiImage: viewModel.cache.image(withIdentifier: result.imageUrl ?? "") ?? UIImage())
                        .resizable()
                        .frame(width: 80.0, height: 80.0)
                        .cornerRadius(50.0)
                Text(result.fullName ?? "").searchCompletion(result.fullName ?? "")
                }
               
                
            }
        }
        .navigationTitle("All Characters")
        .foregroundColor(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
