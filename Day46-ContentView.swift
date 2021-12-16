//
//  ContentView.swift
//  deneme
//
//  Created by Mac on 13.12.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var colorCycle = 0.0
    @State private var arrowBorder = 5.0

    var body: some View {
        VStack {
            
            Arrow(lineWidth: arrowBorder)
            Slider(value: $arrowBorder, in: 5...50)
            
            
            Spacer()
            
            
            ColorCyclingRectangle(amount: colorCycle)
                .frame(width: 300, height: 300)

            Slider(value: $colorCycle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100

    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct Arrow : View {
    
    var lineWidth = 5.0
    
    var body: some View {
        
        GeometryReader  { geo in
            
            let x = geo.size.width
            let y = geo.size.height
        
            Path { path in
                path.move(to: CGPoint(x: x * 2/6, y: y * 6/8))
                path.addLine(to: CGPoint(x: x * 2/6, y: y * 3/8))
                path.addLine(to: CGPoint(x: x * 1/6, y: y * 3/8))
                path.addLine(to: CGPoint(x: x * 3/6, y: y * 1/8))
                path.addLine(to: CGPoint(x: x * 5/6, y: y * 3/8))
                path.addLine(to: CGPoint(x: x * 4/6, y: y * 3/8))
                path.addLine(to: CGPoint(x: x * 4/6, y: y * 6/8))
                path.addLine(to: CGPoint(x: x * 2/6, y: y * 6/8))
            }
            .stroke(.blue, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
            
        }
    }
}
