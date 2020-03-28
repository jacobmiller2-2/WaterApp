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
    
    var colors1: [Color] = [Color.darkBlue, Color.lightBlue]
    var colors2: [Color] = [Color.lightBlue, Color.lightTeal]
    
    var body: some View {
        ZStack {
            //Underline Circle
            Circle()
                .stroke(Color.outlineBlue, lineWidth: 40)
            Circle()
                .trim(from: 0, to: CGFloat(uStats.dailyProgress/Double(uStats.consumptionGoal)))
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: colors1),
                        center: .center,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360)
                    ),
                    style: StrokeStyle(lineWidth: 40, lineCap: .round)
                ).rotationEffect(.degrees(-90))
            //Trailing Circle
            Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.darkBlue)
                    .offset(y: -150)
                .animation(.easeOut)
                .disabled(uStats.dailyProgress/Double(uStats.consumptionGoal) >= 1)
            if(uStats.dailyProgress/Double(uStats.consumptionGoal) >= 1) {
                Circle()
                    .trim(from: 0, to: CGFloat(uStats.dailyProgress/Double(uStats.consumptionGoal))-1)
                    .stroke(
                        AngularGradient(
                            gradient: Gradient(colors: colors2),
                            center: .center,
                            startAngle: .degrees(0),
                            endAngle: .degrees(360)
                        ),
                        style: StrokeStyle(lineWidth: 40, lineCap: .round)
                    ).rotationEffect(.degrees(-90))
                    .animation(.easeIn)
                Circle()
                .frame(width: 40, height: 40)
                .foregroundColor(Color.lightBlue)
                .offset(y: -150)
                
            }
            
            // Leading Circle
            if(uStats.dailyProgress/Double(uStats.consumptionGoal) >= 1){
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(uStats.dailyProgress/Double(uStats.consumptionGoal) > 1.95 ? Color.lightTeal: Color.lightTeal.opacity(0))
                    .offset(y: -150)
                    .rotationEffect(Angle.degrees(360 * uStats.dailyProgress/Double(uStats.consumptionGoal)))
                    .shadow(color: uStats.dailyProgress/Double(uStats.consumptionGoal) > 0.95 ? Color.black.opacity(0.1): Color.clear, radius: 3, x: 4, y: 0)
                
            }else{
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(uStats.dailyProgress/Double(uStats.consumptionGoal) > 0.95 ? Color.lightBlue: Color.lightBlue.opacity(0))
                    .offset(y: -150)
                    .rotationEffect(Angle.degrees(360 * uStats.dailyProgress/Double(uStats.consumptionGoal)))
                    .shadow(color: uStats.dailyProgress/Double(uStats.consumptionGoal) > 1.95 ? Color.black.opacity(0.1): Color.clear, radius: 3, x: 4, y: 0)
                
            }

            
        }
            .frame(idealWidth: 300, idealHeight: 300, alignment: .center)
            .animation(.spring(response: 0.6, dampingFraction: 1.0, blendDuration: 1.0))
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
    
    public static var lightTeal: Color {
        return Color(decimalRed: 0, green: 255, blue: 200)
    }
}
