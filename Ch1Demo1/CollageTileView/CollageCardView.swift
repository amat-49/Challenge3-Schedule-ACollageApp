//
//  StandardGridView.swift
//  Ch1Demo1
//
//  Created by Amat Addoais on 11/25/25.
//

import SwiftUI
import PhotosUI
import UIKit

struct CollageTile: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var currentImage: PhotosPickerItem?
    var image: Image? = nil
    //var music: String?
}

struct CollageCardView: View {
    
    @State var collageCard: [CollageTile] = []
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let numberOfGrids: Int
    @State  var collageTitle: String = ""
    
    
    var body: some View {

            NavigationStack {
                VStack {
                    TextField("Enter Collage Title", text: $collageTitle)
                        .font(.title)
                        .padding()
                        .fixedSize()
                    
                    LazyVGrid(columns: columns) {
                        ForEach(Array(collageCard.indices), id: \.self) { index in
                            
                            Rectangle()
                                .frame(width: 100, height: 100)
                                .overlay(alignment: .center) {
                                    if let currentImage = collageCard[index].image {
                                        currentImage
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 100)
                                            .clipShape(Rectangle())
                                    } else {
                                        Text(collageCard[index].title)
                                            .foregroundStyle(.primary)
                                    }
                                }
                                .overlay(alignment: .center) {
                                    PhotosPicker("Add", selection: Binding(
                                        get: { collageCard[index].currentImage },
                                        set: { collageCard[index].currentImage = $0 }
                                    ), matching: .images)
                                    .buttonStyle(.borderedProminent)
                                    .font(.caption)
                                    .padding(4)
                                }
                            
                                .onChange(of: collageCard[index].currentImage) {_, newItem in
                                    guard let newItem else { return }
                                    Task {
                                        do {
                                            if let data = try await newItem.loadTransferable(type: Data.self), let uiImage = UIImage(data: data) {
                                                let swiftImage = Image(uiImage: uiImage)
                                                //update on main actor
                                                await MainActor.run {
                                                    collageCard[index].image = swiftImage
                                                }
                                            }
                                        } catch {
                                            //handle laod errors
                                        }
                                    }
                                }
                            
                        }
                    }
                    .padding(.horizontal,50)
                    
                    Text("Music")
                        .font(.title)
                    
                    
                }
            }
            .onAppear(perform: createTiles)
            .frame(width:300, height: 500)
            .shadow(radius: 10)
    }
    
    func createTiles() {
        collageCard = []
        
        for index in 1...numberOfGrids {
            let tile = CollageTile(title: "Tile \(index)")
            collageCard.append(tile)
        }
    }
}

#Preview {
    CollageCardView(numberOfGrids: 6)
}



