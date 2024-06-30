import SwiftUI

public struct Shop: View {
    
    let localImageResourceURL: URL? = Bundle.module.url(forResource: "skip-logo", withExtension: "png")
    
    @State public var sneakers: [Hoka] = [
        .init(id: 1, image: "hoka_1", name: "Hoka Clifton 3", sizes: ["41", "42", "42.5", "43", "44"], colors: [Color.black, Color.yellow, Color.white]),
        .init(id: 2, image: "hoka_2", name: "Hoka Rincon", sizes: ["40", "42.5"], colors: [Color.black, Color.red]),
        .init(id: 3, image: "hoka_3", name: "Hoka Clifton 4", sizes: ["41", "42", "42.5", "43"], colors: [Color.yellow, Color.black, Color.blue])
    ]
    
    @State public var selectedId: Int = 0
    @State public var searchText: String = ""
    @State public var inCartCount: Int = 0
    
    public var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea(.all, edges: .all)
            
            ScrollView {
                VStack {
                    HStack {
                        Text("Welcome 🤙🏻")
                            .font(.largeTitle)
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            ZStack {
                                Image(systemName: "cart.fill")
                                    .resizable()
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.black.opacity(0.7))
                                    .cornerRadius(8.0)
                                
                                Text("\(inCartCount > 99 ? "99+" : "\(inCartCount)")")
                                
                                    .lineLimit(1)
                                    .font(.subheadline)
                                    .foregroundColor(.yellow.opacity(0.9))
                                    .padding(.horizontal, 4)
                                    .cornerRadius(50)
                                    .opacity(inCartCount == 0 ? 0.0 : 1.0)
                                    .offset(x: 16.0, y: -8.0)
                            }
                        }.frame(width: 50, height: 50)
                    }
                    
                    SearchBar(text: $searchText) {
                        withAnimation(.linear) {
                            selectedId = 0
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    
                    Spacer()
                        .frame(height: 30)
                    
                    HStack {
                        Text("MOST POPULAR")
                            .font(.caption)
                            .fontWeight(.heavy)
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("Show all")
                                .foregroundColor(.white)
                                .font(.caption2)
                                .fontWeight(.bold)
                                .opacity(0.7)
                        }
                    }

                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(sneakers, id: \.id) { sneaker in
                                Button {
                                    withAnimation(.linear) {
                                        selectedId = sneaker.id
                                    }
                                } label: {
                                    Sneaker(
                                        isSelected: sneaker.id == selectedId,
                                        image: sneaker.image,
                                        name: sneaker.name,
                                        availableSizes: sneaker.sizes,
                                        colors: sneaker.colors
                                    ) {
                                        inCartCount = inCartCount + 1
                                    }
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                    .frame(height: 300.0)
                }
            }
            .padding(.horizontal, 12)
        }
        .onTapGesture {
            withAnimation(.linear) {
                selectedId = 0
            }
        }
    }
}
