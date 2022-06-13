//
//  ContentView.swift
//  GaugeDemo
//
//  Created by Thongchai Subsaidee on 13/6/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selected = 0
    
    var body: some View {
        VStack {
            Picker("Fccc", selection: $selected) {
                Text("Gauge1")
                    .tag(0)
                Text("Gauge2")
                    .tag(1)
            }
            .pickerStyle(.segmented)
            
            Spacer()
            
            if selected == 0 {
                Gauge1View()
            }else {
                Gauge2View()
            }
            
            Spacer()
        }

        
//        TabView {
//            Gauge1View()
//                .tabItem {
//                    Label {
//                        Text("Progress")
//                    } icon: {
//                        Image(systemName: "gauge")
//                    }
//                }
//            Gauge2View()
//                .tabItem {
//                    Label {
//                        Text("Circle")
//                    } icon: {
//                        Image(systemName: "circle.dashed")
//                    }
//
//                }
//        }
//        .tabViewStyle(.automatic)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Gauge1View: View {
    @State private var progress = 0.5
    var body: some View {
        Gauge(value: progress) {
            Text("Upload Status")
        }currentValueLabel: {
            Text(progress.formatted(.percent))
        }minimumValueLabel: {
            Text(0.formatted(.percent))
        }maximumValueLabel: {
            Text(100.formatted(.percent))
        }
    }
}

struct Gauge2View: View {
    @State private var progress = 0.5
    var body: some View {
        Gauge(value: progress) {
            Text("Status")
                .font(.system(size: 5))
        }currentValueLabel: {
            Text(progress.formatted(.percent))
                .font(.footnote)
        }
        .gaugeStyle(.accessoryCircularCapacity)
        .tint(.purple)
        .scaleEffect(3.0)
    }
}
