//
//  SideView.swift
//  vitals-test-display
//
//  Created by Lucas Wang on 3/13/24.
//

import SwiftUI

struct SideView: View {
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    
    @State private var mainWindowStyleIsAuto = true
    @State private var toggleIsEnabled = true
    
    var body: some View {
        VStack {
            Text("CARE Toolbar")
                .font(.title)
            
            Section {
                Text("Vitals Window Settings")
                    .font(.headline)
                
                Button(action: {
                    toggleIsEnabled = false
                    openWindow(id: mainWindowStyleIsAuto ? "mainviewAuto" : "mainviewPlain")
                }) {
                    Text("New Vitals Window")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .buttonStyle(.plain)
                
//                Button(action: {
//                    toggleIsEnabled = true
//                    dismissWindow(id: mainWindowStyleIsAuto ? "mainviewAuto" : "mainviewPlain")
//                }) {
//                    Text("Hide Vitals Window")
//                        .font(.headline)
//                        .padding()
//                        .background(Color.red)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//                .buttonStyle(.plain)
                
                Toggle("Windowed Vitals Window", isOn: $mainWindowStyleIsAuto)
                    .padding([.leading, .trailing], 20)
//                    .disabled(!toggleIsEnabled)
            }
            
            Section {
                Text("Recording Settings")
                    .font(.headline)
                
                Button(action: {
                    isRecording = true
                    Task {
                        await openImmersiveSpace(id:"immersiveSpace")
                        resultString.append("\n\n--------------------------------------------------\nNew Recording started at \(getTime())")
                    }
                }) {
                    Text("Start Recording")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .buttonStyle(.plain)
                
                Button(action: {
                    isRecording = false
                }) {
                    Text("STOP Recording")
                        .font(.headline)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .buttonStyle(.plain)
                
                Button(action: {
                    let filename = getDocumentsDirectory().appendingPathComponent("recording_\(getTime()).txt")
                    do {
                        try resultString.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
                    } catch {
                        print("Save unsuccessful!")
                    }
                    resultString = ""
                }) {
                    Text("Export Recording Data Locally")
                        .font(.headline)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .buttonStyle(.plain)
            }
        }.frame(maxWidth: .infinity, alignment: .top)
    }
}

#Preview {
    SideView()
}
