//
//  CourseListViewModel.swift
//  MVVM+SwiftUI
//
//  Created by Андрей Аверьянов on 15.04.2022.
//

import Foundation

protocol CourseListViewModelProtocol {
    var courses: [Course] {get}
    func fetchCourses()
}

class CourseListViewModel: CourseListViewModelProtocol, ObservableObject {
    @Published var courses: [Course] = []
    
    func fetchCourses() {
        NetworkManager.shared.fetchCourses { courses in
            self.courses = courses
        }
    }
}
