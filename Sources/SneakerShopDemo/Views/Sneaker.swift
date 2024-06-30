import SwiftUI

public struct Sneaker: View {
    
    let isSelected: Bool
    let image: String
    let name: String
    let availableSizes: [String]
    let colors: [Color]
    let action: (() -> ())?
    
    private let imageSize: CGSize = .init(width: 150, height: 70.0)
    
    public var body: some View {
        VStack(spacing: 10.0) {
            Image(image, bundle: .module)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(
                    width: isSelected ? imageSize.width * 3.0 : imageSize.width,
                    height: isSelected ? imageSize.height * 3.0 : imageSize.height
                )
                .offset(
                    x: isSelected ? 30.0 : 0.0,
                    y: isSelected ? -60.0 : 0.0
                )
                .rotationEffect(
                    isSelected ? .degrees(-27.0) : .degrees(0.0)
                )
            
            Text(name)
                .fontWeight(.heavy)
                .opacity(isSelected ? 0.0 : 1.0)
        }
        .background {
            VStack(spacing: 12.0) {
                Spacer()
                
                HStack {
                    Text("SIZE:")
                        .fontWeight(.medium)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(availableSizes, id: \.self) {
                                Text($0)
                                    .foregroundColor(.black)
                                    .background(
                                        RoundedRectangle(cornerRadius: 4)
                                            .fill(.white)
                                    )
                            }
                        }
                    }
                }
                
                HStack {
                    Text("COLOR:")
                        .fontWeight(.medium)
                    
                    ScrollView(Axis.Set.horizontal) {
                        HStack {
                            ForEach(colors, id: \.self) { color in
                                Circle()
                                    .fill(color)
                                    .frame(width: 20)
                            }
                        }
                        .padding(.horizontal, 8.0)
                    }
                }
                .frame(height: 20.0)
                
                Button {
                    action?()
                } label: {
                    Text("BUY NOW")
                }
                .padding()
            }
            .frame(width: 170.0, height: 250.0)
            .opacity(isSelected ? 1.0 : 0.0)
        }
        .padding(8.0)
        .frame(width: 180.0, height: 270.0)
        .background(
            in: RoundedRectangle(cornerRadius: 8, style: .continuous)
        )
    }
}

#Preview {
    HStack {
        Sneaker(
            isSelected: false,
            image: "hoka_1",
            name: "Hoka Clifton 3",
            availableSizes: ["42", "43"],
            colors: [Color.blue, Color.red],
            action: {}
        )
        
        Sneaker(
            isSelected: true,
            image: "hoka_1",
            name: "Hoka Clifton 3",
            availableSizes: ["42", "43", "44", "45"],
            colors: [Color.blue, Color.red],
            action: {}
        )
    }
    .preferredColorScheme(.dark)
}

