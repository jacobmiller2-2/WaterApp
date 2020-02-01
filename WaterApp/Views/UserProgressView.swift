//
//  UserProgressView.swift
//  WaterApp
//
//  Created by Jacob Miller on 1/12/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct UserProgressView: View {
    
    @EnvironmentObject var userStats: UserStats
    var answer = true

    var body: some View {
        VStack{
            
            HStack {
                Text("Jacob,").padding()
                Spacer()
            }
            Text("0.00 Oz.").font(.largeTitle).fontWeight(.light)
            Text("left to met your daily goal")
            
            Text("You are \(userStats.isAthletic ? "Athletic" : "Dumb")").padding()
            
            
        }
        
    }
}

struct UserProgressView_Previews: PreviewProvider {
    
 
    static var previews: some View {
        UserProgressView()
    }
}
