//
//  UserProgressView.swift
//  WaterApp
//
//  Created by Jacob Miller on 1/12/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct UserProgressView: View {
    
    @EnvironmentObject var uStats: UserStats

    @State var comment: String = CommentGen.shared.generateComment()
    @State var phrase: String = CommentGen.shared.generatePhrase()
    
    @State var timeRemaining = 100
    let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    
    @State var progressDisplay: Bool = true;
    
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
                        VStack(){
                            Text("\(phrase)")
                            Text("\((Double(uStats.consumptionGoal)-uStats.dailyProgress).roundToString(places: 2))").fontWeight(.medium).font(.largeTitle)
                            Text("Oz. left to go")
                        }.onAppear(){
                            self.phrase = CommentGen.shared.generatePhrase()
                        }
                    }
                }.animation(.default, value: progressDisplay)
                .onTapGesture {
                    self.progressDisplay.toggle()
                }
                
                
            }.padding()
            
            Stepper(value: $uStats.dailyProgress) {
            Text("Increment Progress")
            }.padding()
            

            Spacer()
        }.onAppear(){
            self.comment = CommentGen.shared.generateComment()
        }
        
    }
}

struct UserProgressView_Previews: PreviewProvider {
    
 
    static var previews: some View {
        UserProgressView()
    }
}
