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
    
    func setNotification(title: String,body:String) -> Void {
        let manager = LocalNotificationManager()
        
        manager.addNotification(title: title,body: body)
        manager.scheduleNotifications()
    }
    
    
    
    var body: some View {
        VStack {
            
        
            VStack {
                Text("My Water")
                
                    
                Image("water_drop")
                    .frame(height: 140).scaleEffect(0.25)
                
                Text("It is vital to drink 8 glasses of water a day")
                Text("That means drinking 64 ounces of water per day")
                Text("Athletes should drink even more.")
                Text("How would you describe yourself?")
                
                HStack{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Non-Athlete")
                    }
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Athlete")
                    }
                    
                }
                
                Text("How often would you like t")
                
            }
            
            VStack {
                Picker(selection: .constant(2), label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                Text("1").tag(1)
                /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/
                }
                
                
                Button(action: {self.setNotification(title: "Drink",body: "You should drink water")}) {
                    Text("Reschedule Notifications")
                }
            }
            
        }
        .frame(width: 2.0, height: 2.0)
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        
    }
}


