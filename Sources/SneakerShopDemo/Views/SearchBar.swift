import SwiftUI

public struct SearchBar: View {
    @Binding var text: String
    @State var placeholder: String = "Search for the sneakers"
    let action: (() -> ())?
    
    public var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .frame(width: 20.0, height: 20.0)
                .foregroundColor(.black)
                .padding(.leading, 16)
                .padding(.trailing, 11)
                .opacity(0.3)
            
            Rectangle()
                .frame(width: 2.0)
                .padding(.horizontal, 3.0)
                .padding(.vertical, 8.0)
                .opacity(0.3)
            
            TextField(placeholder, text: $text)
                .textFieldStyle(.plain)
                .onTapGesture {
                    action?()
                }
        }
        .background(
            in: RoundedRectangle(cornerRadius: 8, style: .continuous)
        )
        .cornerRadius(8)
    }
}


#Preview {
    SearchBar(text: .constant("I am searching for...")) {}
        .frame(height: 50)
}
