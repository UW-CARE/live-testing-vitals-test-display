//
//  vitals_test_displayApp.swift
//  vitals-test-display
//
//  Created by Lucas Wang on 2/21/24.
//

import SwiftUI

@main
struct vitals_test_displayApp: App {
    var body: some Scene {
        WindowGroup(id: "sideviewAuto") {
            SideView()
        }.windowStyle(.automatic).defaultSize(width: 250, height: 550)
        
        WindowGroup(id: "mainviewAuto") {
            ContentView()
        }.windowStyle(.automatic).defaultSize(width: 350, height: 750)
        
        WindowGroup(id: "mainviewPlain") {
            ContentView()
        }.windowStyle(.plain).defaultSize(width: 350, height: 750)
        
        ImmersiveSpace(id: "immersiveSpace") {
            🌐RealityView()
        }
    }
    
    init() {
        🧑HeadTrackingComponent.registerComponent()
        🧑HeadTrackingSystem.registerSystem()
    }
}
