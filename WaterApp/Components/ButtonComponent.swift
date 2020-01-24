//
//  ButtonComponent.swift
//  WaterApp
//
//  Created by Jacob Miller on 1/3/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct ButtonComponent: View {
    var body: some View {
        HStack {
            
        
            Button(action: {
               
                UserDefaults.standard.set(false, forKey: "Athletic")
            }) {
                HStack{
                    Image("OfficeWorker-Silhouette")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                    
                    Text("Non-Athlete")
                        .fontWeight(.semibold)
                        .font(.subheadline)
                }
                .padding()
                .foregroundColor(Color.black)
                .background(Color.green)
                .cornerRadius(40)
                
            }.scaledToFit()
        
            Spacer()
            
            Button(action: {
                let defaults = UserDefaults.standard
                defaults.set(true, forKey: "Athletic")
                
            }) {
                HStack{
                    Image("runner-silhouette")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                    
                    Text("Athlete")
                        .fontWeight(.semibold)
                        .font(.subheadline)
                }
                .padding()
                .foregroundColor(Color.black)
                .background(Color.green)
                .cornerRadius(40)
                .fixedSize()
               
            }.scaledToFit()
            
        }.padding()
            
            
    }
}

struct ButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        ButtonComponent()
    }
}
