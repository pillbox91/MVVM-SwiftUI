//
//  CourseListViewModel.swift
//  MVVM+SwiftUI
//
//  Created by Андрей Аверьянов on 15.04.2022.
//

import Foundation

class CourseListViewModel: ObservableObject {
    @Published var courses: [Course] = []
    
    func fecthCourses() {
        NetworkManager.shared.fetchData { courses in
            self.courses = courses
        }
    }
}
