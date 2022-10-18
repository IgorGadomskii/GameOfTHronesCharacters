
import SwiftUI

struct DetailedInformation: View {
    
    var image: UIImage
    var fullName: String
    var title: String
    var family: String
    
    var body: some View {
        VStack{
            Image(uiImage: image)
                .resizable()
                .frame(width: 200.0, height: 200.0)
                .cornerRadius(100.0)
                .offset(y: -210)
            Text(fullName)
                .font(.system(size: 36.0, weight: .heavy))
                .offset(y: -170)
            Text("Title: \(title)")
                .font(.system(size: 26.0))
                .offset(y: -140)
            Text("Family: \(family)")
                .font(.system(size: 26.0))
                .offset(y: -135)
        }
    }
}

struct DetailedInformation_Previews: PreviewProvider {
    static var previews: some View {
        DetailedInformation(image: UIImage(), fullName: "", title: "", family: "")
    }
}
