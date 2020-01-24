//
//  MenuView.swift
//  WaterApp
//
//  Created by Jacob Miller on 1/22/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    
    @Binding var isAthletic: Bool
    
    var body: some View {
        
        VStack {
                
                Spacer()
                HStack{
                    NavigationLink(destination: SettingsView(isAthletic: $isAthletic)){
                        Image(systemName: "person")
                            .foregroundColor(.gray)
                            .imageScale(.large)
                        Text("Profile")
                            .foregroundColor(.gray)
                            .font(.headline)
                    }
                    
                }
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Messages")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                    .padding(.top, 30)
                HStack {
                    NavigationLink(destination: SettingsView(isAthletic: $isAthletic)){
                        Image(systemName: "gear")
                            .foregroundColor(.gray)
                            .imageScale(.large)
                        Text("Settings")
                            .foregroundColor(.gray)
                            .font(.headline)
                    }
                }
                    .padding(.top, 30)
                 Spacer()
            }
                .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(red: 32/255, green: 32/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
        }
}

struct MenuView_Previews: PreviewProvider {
    @State static var isAthletic = false
    static var previews: some View {
        MenuView(isAthletic: $isAthletic)
    }
}
