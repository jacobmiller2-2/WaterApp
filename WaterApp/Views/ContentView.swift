//
//  ContentView.swift
//  WaterApp
//
//  Created by Jacob Miller on 1/3/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI
import UserNotifications

struct ContentView : View {
    
    @State var isMenuOpen: Bool = false
    @Binding var isAthletic: Bool
    
    
    
    var body: some View {
        let drag = DragGesture()
                .onEnded {
                    if $0.translation.width < -100 {
                        withAnimation {
                            self.isMenuOpen = false
                        }
                    }
                    if $0.translation.width > 100 {
                        withAnimation {
                            self.isMenuOpen = true
                        }
                    }
                }
        
        return
            GeometryReader { geometry in
                ZStack(alignment: .leading){
                    MainView(isMenuOpen: self.$isMenuOpen,isAthletic: self.$isAthletic)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.isMenuOpen ? geometry.size.width/2 : 0)
                        .disabled(self.isMenuOpen ? true : false)
                    if self.isMenuOpen{
                        MenuView(isAthletic: self.$isAthletic)
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    }
                }
                    .gesture(drag)
                
            }
            .navigationBarTitle("Side Menu",displayMode: .inline)
                .navigationBarItems(leading: (Button(action: {
                    withAnimation {
                        self.isMenuOpen.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                }
                ))
    }
    
    struct MainView: View {
        @Binding var isMenuOpen: Bool
        @Binding var isAthletic: Bool
        
        var body: some View {
            
            
            VStack{
                
                
                // fsedfesfsdfsdfdsfsd
                Image("waterdrop")
                    .resizable()
                    .scaledToFit()
                UserProgressView(isAthletic: $isAthletic)
                
                Spacer()
            }
        }
    }
    

    struct ContentView_Previews: PreviewProvider {
        
        @State static var isAthletic = UserStatsManager.shared.getAthleticism()
        
        static var previews: some View {
            ContentView(isAthletic: $isAthletic)
        }
    }
}
