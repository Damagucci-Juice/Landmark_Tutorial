//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by YEONGJIN JANG on 2022/09/24.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
