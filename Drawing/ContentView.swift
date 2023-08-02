//
//  ContentView.swift
//  Drawing
//
//  Created by Louis Mille on 29/07/2023.
//

import SwiftUI

//struct Triangle: Shape {
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
//
//        return path
//    }
//}
//
//struct Arc: InsettableShape {
//    var startAngle: Angle
//    var endAngle: Angle
//    var clockWise: Bool
//    var insetAmount = 0.0
//
//    func inset(by amount: CGFloat) -> some InsettableShape {
//        var arc = self
//        arc.insetAmount += amount
//        return arc
//    }
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        let rotationAdjustment = Angle.degrees(90)
//        let modifiedStart = startAngle - rotationAdjustment
//        let modifiedEnd = endAngle - rotationAdjustment
//
//        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockWise)
//
//        return path
//    }
//
//}
//struct Flower: Shape {
//    var petalOffset = -20.0
//    var petalWidth = 100.0
//
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
//            let rotation = CGAffineTransform(rotationAngle: number)
//            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
//
//            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
//
//            let rotatedPetal = originalPetal.applying(position)
//
//            path.addPath(rotatedPetal)
//
//        }
//
//        return path
//    }
//}
struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100

    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(gradient: Gradient(colors: [
                            color(for: value, brightness: 1),
                            color(for: value, brightness: 0.5)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom),
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
//struct Trapezoid: Shape {
//    var insetAmount: Double
//
//    //make withAnimation work
//    var animatableData: Double {
//        get { insetAmount }
//        set { insetAmount = newValue }
//    }
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        path.move(to: CGPoint(x: 0, y: rect.maxY))
//        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
//
//        return path
//    }
//}
//struct Checkerboard: Shape {
//    var rows: Int
//    var columns: Int
//
//    var animatableData: AnimatablePair<Double, Double> {
//        get {
//            AnimatablePair(Double(rows), Double(columns))
//        }
//        set {
//            rows = Int(newValue.first)
//            columns = Int(newValue.second)
//        }
//    }
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        let rowSize = rect.height / Double(rows)
//        let columnSize = rect.width / Double(columns)
//
//        for row in 0..<rows {
//            for column in 0..<columns {
//                if (row + column).isMultiple(of:2) {
//                    let startX = columnSize * Double(column)
//                    let startY = rowSize * Double(row)
//
//                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
//                    path.addRect(rect)
//                }
//            }
//        }
//        return path
//    }
//}

struct ContentView: View {
//    @State private var petalOffset = -20.0
//    @State private var petalWidth = 100.0
//    @State private var colorCycle = 0.0
    @State private var amount = 0.0
//    @State private var insetAmount = 0.0
//    @State private var rows = 4
//    @State private var columns = 4
    
    var body: some View {
//        Checkerboard(rows: rows, columns: columns)
//            .onTapGesture {
//                withAnimation(.linear(duration: 3)) {
//                    rows = 8
//                    columns = 16
//                }
//            }
//        Trapezoid(insetAmount: insetAmount)
//            .frame(width: 200, height: 100)
//            .onTapGesture {
//                withAnimation {
//                    insetAmount = Double.random(in: 10...90)
//                }
//            }
            ZStack {
                Color(.gray)
                ZStack {
                    Rectangle()
                        .fill(.orange)
                        .cornerRadius(100.0)
                        .frame(width: 200 * 0.40, height: 100)
                        .offset(x: 0, y: -60)
                        .blendMode(.plusDarker)
                    Rectangle()
                        .fill(.blue)
                        .cornerRadius(100.0)
                        .frame(width: 200 * 0.40, height: 100)
                        .offset(x: 0, y: 60)
                        .blendMode(.plusDarker)
                    Rectangle()
                        .fill(.green)
                        .cornerRadius(100.0)
                        .frame(width: 100, height: 200 * 0.40)
                        .offset(x: 60, y: 0)
                        .blendMode(.plusDarker)
                    Rectangle()
                        .fill(.pink)
                        .cornerRadius(100.0)
                        .frame(width: 100, height: 200 * 0.40)
                        .offset(x: -60, y: 0)
                        .blendMode(.plusDarker)
                    Rectangle()
                        .fill(.red)
                        .cornerRadius(100.0)
                        .frame(width: 200 * 0.40, height: 100)
                        .offset(x: 0, y: -60)
                        .rotationEffect(Angle(degrees: 315.0))
                        .blendMode(.plusDarker)
                    Rectangle()
                        .fill(.yellow)
                        .cornerRadius(100.0)
                        .frame(width: 200 * 0.40, height: 100)
                        .offset(x: 0, y: -60)
                        .rotationEffect(Angle(degrees: 45.0))
                        .blendMode(.plusDarker)
                    Rectangle()
                        .fill(.mint)
                        .cornerRadius(100.0)
                        .frame(width: 200 * 0.40, height: 100)
                        .offset(x: 0, y: -60)
                        .rotationEffect(Angle(degrees: 135.0))
                        .blendMode(.plusDarker)
                    Rectangle()
                        .fill(.purple)
                        .cornerRadius(100.0)
                        .frame(width: 200 * 0.40, height: 100)
                        .offset(x: 0, y: -60)
                        .rotationEffect(Angle(degrees: 225.0))
                        .blendMode(.plusDarker)
                    //                Circle()
                    //                    .fill(.yellow)
                    //                    .frame(width: 200 * amount)
                    //                    .offset(x: 0, y: -62)
                    //                    .blendMode(.screen)
                    
                }
                .frame(maxWidth: 300, maxHeight: 300)
                .background(.white)
                .ignoresSafeArea()
                
//                VStack {
//                    Slider(value: $amount)
//                        .padding()
//                }
            }
        
//        VStack {
//            ColorCyclingCircle(amount: colorCycle)
//                .frame(width: 300, height: 300)
//            Slider(value: $colorCycle)
//        }

        
//        Text("Hello world")
//            .frame(width: 300, height: 300)
//            .border(ImagePaint(image: Image("example"), sourceRect:CGRect(x: 0, y: 0.25, width: 1, height: 0.5) , scale: 0.2), width: 30)
//        VStack {
//            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
////                .stroke(.red, lineWidth: 1)
//                .fill(.red, style: FillStyle(eoFill: true))
//
//            Text("Offset")
//            Slider(value: $petalOffset, in: -40...40)
//                .padding([.horizontal, .bottom])
//
//            Text("width")
//            Slider(value: $petalOffset, in: 0...100)
//                .padding(.horizontal)
//        }
        
        //        Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockWise: true)
        //            .stroke(.blue, lineWidth: 10)
        //            .frame(width: 300, height: 300)
        //
        //        Triangle()
        //            .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
        //            .frame(width: 300, height: 300)
        //        Path { path in
        //            path.move(to: CGPoint(x: 200, y: 100))
        //            path.addLine(to: CGPoint(x: 100, y: 300))
        //            path.addLine(to: CGPoint(x: 300, y: 300))
        //            path.addLine(to: CGPoint(x: 200, y: 100))
        //            path.closeSubpath()
        //        }
        //        .fill(.blue)
        //        .stroke(.blue, lineWidth: 10)
        //        .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
