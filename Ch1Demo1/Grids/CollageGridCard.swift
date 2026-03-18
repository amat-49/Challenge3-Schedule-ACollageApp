//
//  Untitled.swift
//  schedule
//
//  Created by Abdallah Hussein on 11/25/25.
//

import SwiftUI
import Foundation
import PhotosUI
import Combine

//@MainActor
//final class PhotoPickerViewModel: ObservableObject {
//    
//    @Published private(set) var selectedImage: UIImage? = nil
//    @Published var imageSelection: PhotosPickerItem? = nil {
//        didSet {
//            setImage(from: imageSelection)
//        }
//    }
//    
//    private func setImage(from selection: PhotosPickerItem?) {
//        guard let selection else { return }
//        Task {
//            do {
//                if let data = try await selection.loadTransferable(type: Data.self),
//                   let uiImage = UIImage(data: data) {
//                    await MainActor.run {
//                        self.selectedImage = uiImage
//                    }
//                }
//            } catch {
//                print("Error loading image: \(error)")
//            }
//        }
//    }
//}

struct CollageGridModel: Identifiable {
    var id = UUID().uuidString
    var color: Color
    var layout: CollageLayout
    var numberOfGrids: Int 
}

struct CollageGridCard: View {
    let layout: CollageLayout
    let color: Color
    var numberOfGrids: Int {
        switch layout {
        case .twovertical:
            0
        case .threevertical:
            1
        case .oneTopTwoBottom:
            2
        case .twoTopTwoBottom:
            3
        case .twotoptwoMiddletwoBottom:
            4
        }
    }
    
    //INT
   
    
    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width
            let h = geo.size.height
            
//            ZStack {
//                RoundedRectangle(cornerRadius: 2)
//                    .fill(color.gradient)
//                
//                if let uiImage = viewModel.selectedImage {
//                    Image(uiImage: uiImage)
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 200, height: 600)
//                        .clipped()
//                } else {
//                    PhotosPicker(
//                        selection: $viewModel.imageSelection,
//                        matching: .images
//                    ) {
//    
//                    }
//        
//                }
                
            
                Path { path in
                    switch layout {
                    case .twovertical:
                        path.move(to: CGPoint(x: w / 2, y: 0))
                        path.addLine(to: CGPoint(x: w / 2, y: h))
                        
                    case .threevertical:
                        let third = w / 3
                        path.move(to: CGPoint(x: third, y: 0))
                        path.addLine(to: CGPoint(x: third, y: h))
                        path.move(to: CGPoint(x: 2 * third, y: 0))
                        path.addLine(to: CGPoint(x: 2 * third, y: h))
                        
                    case .oneTopTwoBottom:
                        let halfH = h / 2
                        path.move(to: CGPoint(x: 0, y: halfH))
                        path.addLine(to: CGPoint(x: w, y: halfH))
                        path.move(to: CGPoint(x: w / 2, y: halfH))
                        path.addLine(to: CGPoint(x: w / 2, y: h))
                        
                    case .twoTopTwoBottom:
                        let halfH = h / 2
                        path.move(to: CGPoint(x: 0, y: halfH))
                        path.addLine(to: CGPoint(x: w, y: halfH))
                        path.move(to: CGPoint(x: w / 2, y: 0))
                        path.addLine(to: CGPoint(x: w / 2, y: h))
                        
                    case .twotoptwoMiddletwoBottom:
                        let rowHeight = h / 3
                        let colwidth = w / 2
                        
                        path.move(to: CGPoint(x: 0, y: rowHeight))
                        path.addLine(to: CGPoint(x: w, y: rowHeight))
                        
                        path.move(to: CGPoint(x: 0, y: rowHeight * 2))
                        path.addLine(to: CGPoint(x: w, y: rowHeight * 2))
                        
                        path.move(to: CGPoint(x: colwidth, y: 0))
                        path.addLine(to: CGPoint(x: colwidth, y: h))
                    }
                }
                .stroke(Color.black, lineWidth: 4)
                
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 5)

            }
        }
    }


// #Preview {
   // CollageGridCard(layout: .twovertical, color: .white)


//#Preview {
//CollageGridModel(color: .black, layout: .twoTopTwoBottom, numberOfGrids: 4)
// }
