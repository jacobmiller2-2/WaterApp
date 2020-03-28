//
//  TestView.swift
//  WaterApp
//
//  Created by Jacob Miller on 3/28/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct TestView: View {
    var body: some View {
         NavigationView{
                   VStack{
                           
                           List {
                               
                               Section{
                                   NavigationLink(destination: TestTestView()){
                                       Text("Map")
                                   }
                               }
                               
                               
                           }.navigationBarTitle("Settings")
                       .listStyle(GroupedListStyle())
                       .environment(\.horizontalSizeClass, .regular)
                   }
               }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
