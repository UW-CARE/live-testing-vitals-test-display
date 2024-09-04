import SwiftUI

struct 🛠️MenuTop: View {
    @EnvironmentObject var model: 🥽AppModel
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    var body: some View {
        VStack() {
            Text("Hi")
        }
        .frame(width: 0, height: 0)
        .onChange(of: isRecording) {
            if !isRecording {
                Task {
                    await self.dismissImmersiveSpace()
                    resultString.append("Recording stopped at \(getTime())\n\n")
                }
            }
        }
    }
}


enum 🛠️Panel {
    case setting,
         about
}
