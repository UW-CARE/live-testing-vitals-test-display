import SwiftUI

struct 🛠️AboutPanel: View {
    @EnvironmentObject var model: 🥽AppModel
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack(spacing: 20) {
                        Text("Major (blue) and minor (green) hand joints are labeled")
                            .font(.caption)
                            .multilineTextAlignment(.center)
                    }
                    .padding(4)
                }
                Section {
                    HStack(spacing: 20) {
                        Text("Head tracking is above you :)")
                            .font(.caption)
                            .multilineTextAlignment(.center)
                    }
                    .padding(4)
                }
                Section {
                    HStack(spacing: 20) {
                        VStack{
                            Text("Credits")
                            Text("Code extended by Andy Kong (https://andykong.org) from the HandsRuler app (https://github.com/FlipByBlink/HandsRuler)")
                                .font(.caption)
//                                .multilineTextAlignment(.center)
                            Text("Head model: Andy Kong")
                                .font(.caption)
//                                .multilineTextAlignment(.center)
                        }
                    }
                    .padding(4)
                }
                switch self.model.authorizationStatus {
                    case .notDetermined, .denied:
                        HStack(spacing: 24) {
                            Text("Hand tracking authorization:")
                                .fontWeight(.semibold)
                            Text(self.model.authorizationStatus?.description ?? "nil")
                        }
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    default:
                        EmptyView()
                }
            }
            .navigationTitle("About")
            .toolbar {
                Button {
                    self.model.presentPanel = nil
                } label: {
                    Image(systemName: "arrow.down.right.and.arrow.up.left")
                        .padding(8)
                }
                .buttonBorderShape(.circle)
                .buttonStyle(.plain)
            }
        }
        .frame(width: 0, height: 0)
    }
}
