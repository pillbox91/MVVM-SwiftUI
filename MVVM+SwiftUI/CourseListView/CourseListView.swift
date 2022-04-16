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
            ScrollView{
                ForEach(viewModel.courses, id: \.name) { course in
                    Text(course.name)
                }
            }
            .navigationTitle("Course")
            .navigationBarItems(trailing: Button("Fetch Data") {
                viewModel.fecthCourses()
            })
        }
    }
}

struct CourseListView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}
