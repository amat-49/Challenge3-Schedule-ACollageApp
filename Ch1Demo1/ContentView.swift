//
//  ContentView.swift
//  Ch1Demo1
//
//  Created by Amat Addoais on 11/25/25.
//
//
//import SwiftUI


import SwiftUI
import PhotosUI

struct ContentView: View {
    @State var selectedImage: UIImage?
    @State var photoItem: PhotosPickerItem?
    @State var showingAddSheet = false
    
    @State var collageCard: [CollageTile] = []
    
    
    
    var body: some View {
        NavigationStack {
            VStack {

                Text("S.C.H.E.D.U.L.E")
                        .font(.system(size: 48))
                        .padding(.top,60)
                        .fontWeight(.bold)
                
                Text("Seek, Create, Have, Explore, Discover, Understand, Live, Experience")
                        .font(.system(size: 12))
                        .italic()
            
                Button {
                    showingAddSheet.toggle()
                } label: {
                    Image(.newCollage)
                        .padding(.top, 100)
                }

                Text("Click on the picture above to begin creating your first collage.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.gray)
                Spacer()
            }
        }
        .sheet(isPresented: $showingAddSheet) {
            CollageGridsView()
        }

    }
}

#Preview {
    ContentView()
}
