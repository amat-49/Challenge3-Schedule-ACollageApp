//
//  CustomizationView.swift
//  Ch1Demo1
//
//  Created by Amat Addoais on 12/3/25.
//

import SwiftUI

struct CategoryItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let icon: String
}

let categories: [CategoryItem] = [
    .init(title: "Music", icon: "music.note"),
    .init(title: "Edit", icon: "pencil"),
    .init(title: "Save", icon: "checkmark")
]

struct CustomizationView: View {

    @State private var selectedCategory: CategoryItem? = nil
    @State private var edits: [String] = []
    @State private var undone: [String] = []
    let numberOfGrids: Int


    var body: some View {
        NavigationStack {
            VStack { HStack(spacing:100) {
                
            }
            .padding()

            CollageCardView(numberOfGrids: numberOfGrids)


                Spacer()

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing:20) {
                        ForEach(categories) { category in
                            Button {
                                selectedCategory = category
                            } label: {
                                VStack {
                                    Image(systemName: category.icon)
                                        .font(.largeTitle)
                                    Text(category.title)
                                }
                                .padding()
                                .frame(width:80, height: 80)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 2)
                            }
                        }
                    }
                    .frame(width: 400, height: 90)
                    .background(Color.gray.opacity(0.2))
                }
            }

            .navigationDestination(item: $selectedCategory) { category in
                switch category.title {
                case "Music":
                    MusicBrowserView()
                    
                case "Save":
                    Gallery()

                default:
                    Text("\(category.title)")
                }
            }
        }
    }
}

#Preview {
    CustomizationView(numberOfGrids: 2)
}
