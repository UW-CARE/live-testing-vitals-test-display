//
//  ContentView.swift
//  vitals-test-display
//
//  Created by Lucas Wang on 2/21/24.
//

import SwiftUI
import RealityKit
import RealityKitContent
import Charts

struct ContentView: View {
    
    @State var bpmData: [UniversalData] = []
    @State var respData: [UniversalData] = []
    @State var spo2Data: [UniversalData] = []
    @State var co2Data: [UniversalData] = []
    @State var ibpData: [UniversalData] = []
    
    var body: some View {
        VStack {
            Section {
                HStack {
                    VStack {
                        HStack {
                            Text("BPM")
                                .font(.largeTitle)
                                .foregroundColor(.red)
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                                .font(.system(size: 20))
                        }
                        if !bpmData.isEmpty {
                            Text("\(bpmData.last!.y)")
                                .font(.system(size: 50))
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                        } else {
                            Text("N/A")
                                .font(.system(size: 50))
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                        }
                    }.padding([.trailing], 5)
                    Chart {
                        ForEach(bpmData) { point in
                            LineMark(x: .value("s", point.x),
                                     y: .value("bpm", point.y))
                            .foregroundStyle(.red)
                        }
                    }.frame(width: 200, height: 100)
                }
            }
            
            Section {
                HStack {
                    VStack {
                        HStack {
                            Text("RESP")
                                .font(.largeTitle)
                                .foregroundColor(.yellow)
                            Image(systemName: "wind")
                                .foregroundColor(.yellow)
                                .font(.system(size: 20))
                        }
                        if !respData.isEmpty {
                            Text("\(respData.last!.y)")
                                .font(.system(size: 50))
                                .fontWeight(.bold)
                                .foregroundColor(.yellow)
                        } else {
                            Text("N/A")
                                .font(.system(size: 50))
                                .fontWeight(.bold)
                                .foregroundColor(.yellow)
                        }
                    }.padding([.trailing], 5)
                    Chart {
                        ForEach(respData) { point in
                            LineMark(x: .value("s", point.x),
                                     y: .value("resp", point.y))
                            .foregroundStyle(.yellow)
                        }
                    }.frame(width: 200, height: 100)
                }
            }
            
            Section {
                HStack {
                    VStack {
                        HStack {
                            Text("SpO2")
                                .font(.largeTitle)
                                .foregroundColor(.blue)
                            Image(systemName: "gauge.with.dots.needle.33percent")
                                .foregroundColor(.blue)
                                .font(.system(size: 20))
                        }
                        if !spo2Data.isEmpty {
                            Text("\(spo2Data.last!.y)")
                                .font(.system(size: 50))
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                        } else {
                            Text("N/A")
                                .font(.system(size: 50))
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                        }
                    }.padding([.trailing], 5)
                    Chart {
                        ForEach(spo2Data) { point in
                            LineMark(x: .value("s", point.x),
                                     y: .value("spo2", point.y))
                            .foregroundStyle(.blue)
                        }
                    }.frame(width: 200, height: 100)
                }
            }
            
            Section {
                HStack {
                    VStack {
                        HStack {
                            Text("CO2")
                                .font(.largeTitle)
                                .foregroundColor(.pink)
                            Image(systemName: "carbon.dioxide.cloud")
                                .foregroundColor(.pink)
                                .font(.system(size: 20))
                        }
                        if !co2Data.isEmpty {
                            Text("\(co2Data.last!.y)")
                                .font(.system(size: 50))
                                .fontWeight(.bold)
                                .foregroundColor(.pink)
                        } else {
                            Text("N/A")
                                .font(.system(size: 50))
                                .fontWeight(.bold)
                                .foregroundColor(.pink)
                        }
                    }.padding([.trailing], 5)
                    Chart {
                        ForEach(co2Data) { point in
                            LineMark(x: .value("s", point.x),
                                     y: .value("co2", point.y))
                            .foregroundStyle(.pink)
                        }
                    }.frame(width: 200, height: 100)
                }
            }
            
            Section {
                HStack {
                    VStack {
                        HStack {
                            Text("IBP")
                                .font(.largeTitle)
                                .foregroundColor(.green)
                            Image(systemName: "drop.degreesign.fill")
                                .foregroundColor(.green)
                                .font(.system(size: 20))
                        }
                        if !ibpData.isEmpty {
                            Text("\(ibpData.last!.y)/80")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                        } else {
                            Text("N/A")
                                .font(.system(size: 50))
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                        }
                    }.padding([.trailing], 5)
                    Chart {
                        ForEach(ibpData) { point in
                            LineMark(x: .value("s", point.x),
                                     y: .value("co2", point.y))
                            .foregroundStyle(.green)
                        }
                    }.frame(width: 200, height: 100)
                }
            }
            
            Section {
                Button(action: {
                    let filename = getDocumentsDirectory().appendingPathComponent("vData.txt")
                    do {
                        vDataString = try String(contentsOf: filename)
                    } catch {
                        print("Reading vData String failed with error \(error)")
                    }
                    let vLines = vDataString.split(whereSeparator: \.isNewline)
                    let bpmLine = vLines[0].split(separator: ",").map{Int($0) ?? 0}
                    let respLine = vLines[1].split(separator: ",").map{Int($0) ?? 0}
                    let spo2Line = vLines[2].split(separator: ",").map{Int($0) ?? 0}
                    let co2Line = vLines[3].split(separator: ",").map{Int($0) ?? 0}
                    let ibpLine = vLines[4].split(separator: ",").map{Int($0) ?? 0}
                    
                    bpmData = [UniversalData(x: 0, y: bpmLine[0]), UniversalData(x: 1, y: bpmLine[1]), UniversalData(x: 1, y: bpmLine[2])]
                    respData = [UniversalData(x: 0, y: respLine[0]), UniversalData(x: 1, y: respLine[1]), UniversalData(x: 1, y: respLine[2])]
                    spo2Data = [UniversalData(x: 0, y: spo2Line[0]), UniversalData(x: 1, y: spo2Line[1]), UniversalData(x: 1, y: spo2Line[2])]
                    co2Data = [UniversalData(x: 0, y: co2Line[0]), UniversalData(x: 1, y: co2Line[1]), UniversalData(x: 1, y: co2Line[2])]
                    ibpData = [UniversalData(x: 0, y: ibpLine[0]), UniversalData(x: 1, y: ibpLine[1]), UniversalData(x: 1, y: ibpLine[2])]
                }) {
                    Text("Update Vitals")
                        .font(.body)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .buttonStyle(.plain)
            }

        }.frame(maxWidth: .infinity, alignment: .top)
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
