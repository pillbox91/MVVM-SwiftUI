//
//  CourseListView.swift
//  MVVM+SwiftUI
//
//  Created by Андрей Аверьянов on 15.04.2022.
//

import SwiftUI

struct CourseListView: View {
    @StateObject private var viewModel = CourseListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.courses, id: \.name) { course in
                NavigationLink(destination: CourseDetailsView(viewModel: CourseDetailsViewModel(course: course))) {
                    RowView(viewModel: RowViewModel(course: course))
                }
            }
            .navigationBarTitle("Courses")
        }
        .onAppear {
            viewModel.fetchCourses()
        }
    }
}

struct CourseListView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}
