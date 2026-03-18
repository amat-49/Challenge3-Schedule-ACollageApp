//
//  CollageGridsView.swift
//  schedule
//
//  Created by Abdallah Hussein on 11/25/25

//
//  CollageGridsView.swift
//  schedule
//
//  Created by Abdallah Hussein on 11/25/25.
//

import SwiftUI

struct CollageGridsView: View {
    
    @State var collageItems: [CollageGridModel] = [
        
        CollageGridModel(color: .black, layout: .twoTopTwoBottom, numberOfGrids: 4),
        CollageGridModel(color: .black, layout: .twovertical, numberOfGrids: 2),
        CollageGridModel(color: .black, layout: .oneTopTwoBottom, numberOfGrids: 3),
        CollageGridModel(color: .black, layout: .twotoptwoMiddletwoBottom, numberOfGrids: 6),
        
        
    ]

    var body: some View {
        let columns = Array(repeating: GridItem(.flexible()), count: 2)
        
        NavigationStack {
            
            ScrollView {
                VStack(alignment: .leading) {
                    LazyVGrid(columns: columns, spacing: 35) {
                        Section {
                            
                            
                            ForEach(collageItems) { collageItem in
                                
                                NavigationLink {
                                    CustomizationView(numberOfGrids: collageItem.numberOfGrids)
                                } label: {
                                    CollageGridCard(
                                        layout: collageItem.layout,
                                        color: Color.clear,
                                    )
                                    .frame(height: 250)
                                }
                                
                                
                            }

                        } header: {
                            Text("GRIDS")
                                .font(.largeTitle.bold())
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("Select one of the grids to begin working on your collage")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(Color.gray)
                        }
                    }
                }
                .padding()
                .padding()
            }
        }
    }
}


#Preview {
    CollageGridsView()
}
