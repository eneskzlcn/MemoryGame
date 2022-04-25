//
//  Pie.swift
//  MemoryGame
//
//  Created by Nazif Enes Kızılcin on 25.04.2022.
//
import SwiftUI

struct Pie : Shape {
    var startAngle : Angle
    var endAngle : Angle
    var clockwise : Bool = false
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * cos(startAngle.radians),
            y: center.y + radius * sin(startAngle.radians)
        )
        // Start to drawing
        var p = Path()
        // Move the pen to the center without any drawing
        p.move(to: center)
        
        // Draw a line from center to our start point
        p.addLine(to: start)
        
        // Draw an arc from start point to end point to make the rounded body of the pie.
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: !clockwise
        )
        // Draw a line from end point to the center to complete the pie.
        
        p.addLine(to: center)
        
        return p
    }
    
}
