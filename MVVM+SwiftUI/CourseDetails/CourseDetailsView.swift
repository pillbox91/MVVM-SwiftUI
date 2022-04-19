//
//  CourseDetailsView.swift
//  MVVM+SwiftUI
//
//  Created by Андрей Аверьянов on 15.04.2022.
//

import SwiftUI

struct CourseDetailsView: View {
    @StateObject var viewModel: CourseDetailsViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(viewModel.courseName)
                .font(.largeTitle)
            ZStack {
                CourseImageView(
                    imageData: viewModel.imageData,
                    imageSize: CGSize(width: 230, height: 180),
                    cornerRadius: 30,
                    shadowIsOn: true
                )
                FavoriteStatusButton(isFavorite: viewModel.isFavorite) {
                    viewModel.isFavorite.toggle()
                }
            }
            Text(viewModel.numberOfLessons)
                .font(.headline)
            Text(viewModel.numberOfTests)
                .font(.headline)
            Spacer()
        }
    }
}

struct FavoriteStatusButton: View {
    var isFavorite: Bool
    var action: () -> Void
    var body: some View {
        Image(systemName: isFavorite ? "heart.fill" : "heart")
            .resizable()
            .frame(width: 30, height: 30)
            .offset(x: 115, y: 60)
        
        Button("   ", action: action)
            .offset(x: 115, y: 60)
    }
}

struct CourseDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailsView(viewModel: CourseDetailsViewModel(course: Course.getCourse()))
    }
}
