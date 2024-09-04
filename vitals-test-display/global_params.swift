//
//  global_params.swift
//  vitals-test-display
//
//  Created by Lucas Wang on 3/13/24.
//

import Foundation
import SwiftUI

struct UniversalData: Identifiable {
    let id = UUID()
    let x: Int
    let y: Int
 
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

public var resultString: String = "Hello World!"
public var vDataString: String = ""

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

public var isRecording: Bool = false

func getTime() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "y-MM-dd H:mm:ss.SSSS"
    let dateString = formatter.string(from: Date())
    return dateString
}
