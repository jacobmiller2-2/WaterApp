//
//  ProgressRingView.swift
//  WaterApp
//
//  Created by Jacob Miller on 2/21/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct ProgressRingView: View {
    
    @EnvironmentObject var uStats: UserStats
    
    var colors: [Color] = [Color.darkBlue, Color.lightBlue]
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.outlineBlue, lineWidth: 40)
            Circle()
                .trim(from: 0, to: CGFloat(uStats.dailyProgress/Double(uStats.consumptionGoal)))
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: colors),
                        center: .center,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360)
                    ),
                    style: StrokeStyle(lineWidth: 40, lineCap: .round)
            ).rotationEffect(.degrees(-90))
            Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.darkBlue)
                    .offset(y: -150)
            Circle()
                .frame(width: 40, height: 40)
                .foregroundColor(uStats.dailyProgress/Double(uStats.consumptionGoal) > 0.95 ? Color.lightBlue: Color.lightBlue.opacity(0))
                .offset(y: -150)
                .rotationEffect(Angle.degrees(360 * uStats.dailyProgress/Double(uStats.consumptionGoal)))
                .shadow(color: uStats.dailyProgress/Double(uStats.consumptionGoal) > 0.96 ? Color.black.opacity(0.1): Color.clear, radius: 3, x: 4, y: 0)
            
        }
            .frame(idealWidth: 300, idealHeight: 300, alignment: .center)
            .animation(.spring(response: 0.6, dampingFraction: 1.0, blendDuration: 1.0))
    }
}

struct ProgressRingView_Previews: PreviewProvider {
    @EnvironmentObject var uStats: UserStats
    static var previews: some View {
        ProgressRingView()
    }
}



extension Color {
    public static var outlineRed: Color {
        return Color(decimalRed: 34, green: 0, blue: 3)
    }
    
    public static var darkRed: Color {
        return Color(decimalRed: 221, green: 31, blue: 59)
    }
    
    public static var lightRed: Color {
        return Color(decimalRed: 239, green: 54, blue: 128)
    }
    
    public init(decimalRed red: Double, green: Double, blue: Double) {
        self.init(red: red / 255, green: green / 255, blue: blue / 255)
    }
    
    
    public static var darkBlue: Color {
        return Color(decimalRed: 0, green: 75, blue: 237)
    }
    
    public static var lightBlue: Color {
        return Color(decimalRed: 0, green: 208, blue: 255)
    }
    
    public static var outlineBlue: Color {
        return Color(decimalRed: 3, green: 0, blue: 34)
    }
}
