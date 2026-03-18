//
//  Gallery.swift
//  Ch1Demo1
//
//  Created by Amat Addoais on 11/25/25.
//

import SwiftUI

struct Gallery: View {
    @State private var showingSheet = false
    
    var people: [CollageCardView] = []
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "checkmark")
                .font(.system(size: 80)).bold(true)
                .padding(30)
            HStack {
                Text("Collage Saved")
                    .font(.system(size: 40)).bold(true)
                    .multilineTextAlignment(.center)
                 // Pushes the text to the leading edge
                
            }
            
            
            Spacer()
            
            Button {
                showingSheet.toggle()
            } label: {
                Image(.newCollage)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.top, 100)
                    .padding(.leading, 200)
            }
            
        }//end of Vstack
        .sheet(isPresented: $showingSheet){
            CollageGridsView()
                .presentationDetents([.medium])
        }//end of sheet
        
    }// end of var body
}//end of Gallery view

#Preview {
    Gallery()
}
