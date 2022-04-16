//
//  CourseImageView.swift
//  MVVM+SwiftUI
//
//  Created by Андрей Аверьянов on 16.04.2022.
//

import SwiftUI

struct CourseImageView: View {
    let imageData: Data?
    let imageSize: CGSize
    let cornerRadius: CGFloat
    let shadowIsOn: Bool
    
    var body: some View {
        getImage(from: imageData)
            .resizable()
            .frame(width: imageSize.width, height: imageSize.height)
            .cornerRadius(cornerRadius)
            .shadow(radius: shadowIsOn ? 10 : 0)
    }
    
    private func getImage(from data: Data?) -> Image {
        guard let data = data else {return Image(systemName: "xmark.shield")}
        guard let image = UIImage(data: data) else {return Image(systemName: "xmark.shield")}
        return Image(uiImage: image)
    }
}

struct CourseImageView_Previews: PreviewProvider {
    static var previews: some View {
        CourseImageView(
            imageData: nil,
            imageSize: CGSize(width: 100, height: 100),
            cornerRadius: 10,
            shadowIsOn: true
        )
    }
}
