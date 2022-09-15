
import Combine
import SwiftUI
import UIKit

struct ContentView: View {
    
   @StateObject private var viewModel = ContentViewModel()
    
    
    
    var body: some View {
        List(viewModel.list) { model in
            HStack{
                Image(uiImage: viewModel.getImage(from: model.imageUrl ?? "") ?? UIImage())
                    .resizable()
                    .frame(width: 80.0, height: 80.0)
                    .cornerRadius(50.0)
                    .padding(.horizontal, 15.0)
                Text(model.fullName ?? "")
                    
            }
        }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
