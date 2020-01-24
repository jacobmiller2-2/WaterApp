//
//  StatsView.swift
//  WaterApp
//
//  Created by Jacob Miller on 1/12/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct StatsView: View {
    
    @State var viewNum = 0
    
    var body: some View {
        
        
        
        VStack {
            Button(action: {
                if(self.viewNum < 2){
                    self.viewNum += 1
                } else {
                    self.viewNum -= 1
                }
            }
            ){
            Text("Click here to Cycle")
            }
            if (viewNum == 0){
                Text("View number 1")
            } else if (viewNum == 1){
                Text("View number 2")
            } else{
                Text("View number 3")
            }
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
