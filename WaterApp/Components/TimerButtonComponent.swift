//
//  TimerButtonComponent.swift
//  WaterApp
//
//  Created by Jacob Miller on 1/28/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

func test () -> Void {
    
}

struct TimerButtonComponent: View {
    var action: () -> Void
    
    var body: some View {
        HStack{
            Button(action: action) {
                    Text("Set")
                        .padding(30)
                        .overlay(Circle().stroke(Color.systemBackground, lineWidth: 4))
            }
            .background(Color.secondarySystemBackground)
            .foregroundColor(Color.label)
                .mask(Circle())
                
            
            
            
        }.padding()
    }
}

struct TimerButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        TimerButtonComponent {
            print("Test")
        }
    }
}
