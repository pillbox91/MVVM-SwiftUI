//
//  CourseDetailsViewModel.swift
//  MVVM+SwiftUI
//
//  Created by Андрей Аверьянов on 15.04.2022.
//

import Foundation

protocol CourseDetailsViewModelProtocol: AnyObject {
    var courseName: String {get}
    var imageData: Data? {get}
    var numberOfLessons: String {get}
    var numberOfTests: String {get}
    var isFavorite: Bool {get}
    init(course: Course)
}

class CourseDetailsViewModel: CourseDetailsViewModelProtocol, ObservableObject {
    var courseName: String {
        course.name
    }
    
    var imageData: Data? {
        NetworkManager.shared.fetchImageData(from: course.imageUrl)
    }
    
    var numberOfLessons: String {
        "Number of lessons: \(course.numberOfLessons)"
    }
    
    var numberOfTests: String {
        "Number of tests: \(course.numberOfTests)"
    }
    
    @Published var isFavorite: Bool {
        didSet {
            DataManager.shared.saveFavoriteStatus(for: course.name, with: isFavorite)
        }
    }
    
    private let course: Course
    
    required init(course: Course) {
        self.course = course
        isFavorite = DataManager.shared.loadFavoriteStatus(for: course.name)
    }
}
