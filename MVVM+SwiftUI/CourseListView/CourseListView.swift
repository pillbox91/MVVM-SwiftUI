//
//  CourseListView.swift
//  MVVM+SwiftUI
//
//  Created by Андрей Аверьянов on 15.04.2022.
//

import SwiftUI

struct CourseListView: View {
    var body: some View {
        NavigationView {
            ScrollView{
                
            }
            .navigationTitle("Course")
            .navigationBarItems(trailing: Button("Fetch Data") { })
        }
    }
}

struct CourseListView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}
