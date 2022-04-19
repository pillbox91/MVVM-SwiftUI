//
//  RowViewModel.swift
//  MVVM+SwiftUI
//
//  Created by Андрей Аверьянов on 15.04.2022.
//

import Foundation

protocol RowViewModelProtocol {
    var courseName: String {get}
    var imageData: Data? {get}
    init(course:Course)
}

class RowViewModel: RowViewModelProtocol {
    var courseName: String {
        course.name
    }
    
    var imageData: Data? {
        NetworkManager.shared.fetchImageData(from: course.imageUrl)
    }
    
    private let course: Course
    
    required init(course: Course) {
        self.course = course
    }
}
