//
//  UserProgressView.swift
//  WaterApp
//
//  Created by Jacob Miller on 1/12/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI
import CoreHaptics

struct UserProgressView: View {
    
    @EnvironmentObject var uStats: UserStats

    @State var comment: String = CommentGen.shared.generateComment()
    @State var phrase: String = CommentGen.shared.generatePhrase()
    @State var congratsPhrase: String = CommentGen.shared.generateCongratsPhrase()
    
    @State var timeRemaining = 100
    
    @State var progressDisplay: Bool = true;
    @State  var lastCount:Double = 0
    
    var body: some View {
        
        VStack{
            Spacer()
            Text("\(uStats.name)\(comment)").padding(.bottom, 60)
            
            ZStack{
                ProgressRingView().fixedSize()
                VStack{
                    if(progressDisplay){
                        VStack(){
                            Text("You have drank:")
                            Text("\(uStats.dailyProgress.roundToString(places: 2))").fontWeight(.medium).font(.largeTitle)
                            Text("Oz. today")
                        }
                    } else {
                        if(uStats.dailyProgress-Double(uStats.consumptionGoal)>0){
                            VStack{
                                Text("\(congratsPhrase)")
                                Text("\((Double(uStats.consumptionGoal)-uStats.dailyProgress).magnitude.roundToString(places: 2))").fontWeight(.medium).font(.largeTitle)
                                Text("Oz. past your goal")
                                
                            }
                            .onAppear(){
                                self.congratsPhrase = CommentGen.shared.generateCongratsPhrase()
                            }
                        } else {
                            VStack{
                                Text("\(phrase)")
                                Text("\((Double(uStats.consumptionGoal)-uStats.dailyProgress).roundToString(places: 2))").fontWeight(.medium).font(.largeTitle)
                                Text("Oz. left to go")
                            }
                            .onAppear(){
                                self.phrase = CommentGen.shared.generatePhrase()
                            }
                        }
                    }
                }.animation(.default, value: progressDisplay)
                .onTapGesture {
                    self.progressDisplay.toggle()
                }
            }.padding()
            
            VStack{
                Stepper(onIncrement: {
                    self.uStats.dailyProgress += 1
                }, onDecrement: {
                    (self.uStats.dailyProgress >= 1) ? (self.uStats.dailyProgress -= 1) : (self.uStats.dailyProgress = 0)
                }) {
                Text("1 Ounce")
                }
                Stepper(onIncrement: {
                    self.uStats.dailyProgress += 5
                }, onDecrement: {
                    (self.uStats.dailyProgress >= 5) ? (self.uStats.dailyProgress -= 5) : (self.uStats.dailyProgress = 0)
                }){
                    Text("5 Ounces")
                }
                Stepper(onIncrement: {
                    self.uStats.dailyProgress += 10
                }, onDecrement: {
                    (self.uStats.dailyProgress >= 10) ? (self.uStats.dailyProgress -= 10) : (self.uStats.dailyProgress = 0)
                }){
                    Text("10 Ounces.")
                }
            }.padding()
                .onReceive(uStats.objectWillChange){
                    if(self.lastCount < Double(self.uStats.consumptionGoal)){
                        if(self.uStats.dailyProgress >= Double(self.uStats.consumptionGoal)){
                            let haptic = UINotificationFeedbackGenerator()
                            haptic.notificationOccurred(.success)
                        }
                    }
                    self.lastCount = self.uStats.dailyProgress
            }
            Spacer()
        }.onAppear(){
            self.comment = CommentGen.shared.generateComment()
            self.lastCount = self.uStats.dailyProgress
        }
    }
}

struct UserProgressView_Previews: PreviewProvider {
    static var previews: some View {
        UserProgressView()
    }
}
