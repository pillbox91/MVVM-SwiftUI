//
//  CourseDetailsView.swift
//  MVVM+SwiftUI
//
//  Created by Андрей Аверьянов on 15.04.2022.
//

import SwiftUI

struct CourseDetailsView: View {
    var viewModel: CourseDetailsViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.courseName)
                .font(.largeTitle)
            Spacer()
        }
    }
}

struct CourseDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailsView(viewModel: CourseDetailsViewModel(course: Course.getCourse()))
    }
}
