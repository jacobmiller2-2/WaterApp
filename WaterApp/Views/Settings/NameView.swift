//
//  NameView.swift
//  WaterApp
//
//  Created by Jacob Miller on 2/3/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct NameView: View {
    @EnvironmentObject var uStats : UserStats
    
    var body: some View {
        VStack{
            Text("What would you liked to be called?")
            TextField("Name", text: $uStats.name).textFieldStyle(RoundedBorderTextFieldStyle()).padding(.horizontal,30)
            Spacer()
        }
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView()
    }
}
