//
//  RowView.swift
//  MVVM+SwiftUI
//
//  Created by Андрей Аверьянов on 15.04.2022.
//

import SwiftUI

struct RowView: View {
    let viewModel: RowViewModel
    
    var body: some View {
        HStack {
            CourseImageView(
                imageData: viewModel.imageData,
                imageSize: CGSize(width: 130, height: 100),
                cornerRadius: 10,
                shadowIsOn: false
            )
            Text(viewModel.courseName)
            Spacer()
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(viewModel: RowViewModel(course: Course.getCourse()))
    }
}
