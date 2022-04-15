//
//  NetworkManager.swift
//  MVVM+SwiftUI
//
//  Created by Андрей Аверьянов on 15.04.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let coursesURL = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
    
    private init() {}
    
    func fetchData(completion: @escaping (_ courses: [Course]) -> Void) {
        guard let url = URL(string: coursesURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let courses = try decoder.decode([Course].self, from: data)
                completion(courses)
            } catch let error {
                print("Error serialization json", error)
            }
            
        }.resume()
    }
}

class ImageManager {
    static let shared = ImageManager()
    
    private init() {}
    
    func getImage(from url: String?) -> Data? {
        guard let stringURL = url else {return nil}
        guard let imageURL = URL(string: stringURL) else {return nil}
        guard let imageData = try? Data(contentsOf: imageURL) else {return nil}
        return imageData
    }
}
