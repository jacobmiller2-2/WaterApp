//
//  DrawerContent.swift
//  WaterApp
//
//  Created by Jacob Miller on 1/20/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct DrawerContent: View {
    
    @Binding var isDrawerOpen: Bool
    
    var body: some View {
        
            NavigationView{
                VStack{
                    HStack{
                        NavigationLink(destination: MenuList()){
                            HStack {
                                Image(systemName: "gear")
                                    .foregroundColor(.gray)
                                    .imageScale(.large)
                                Text("Settings")
                                    .foregroundColor(.gray)
                                    .font(.headline)
                            }
                                .padding(.top, 30)
                        }
                        .onTapGesture {
                            self.isDrawerOpen.toggle()
                        }
                        Spacer()
                    }.padding()
                    Spacer()
                }
                       
            
                   }
       
    }
}

struct DrawerContent_Previews: PreviewProvider {
    
    @State static var isDrawerOpen = true
    
    static var previews: some View {
        DrawerContent(isDrawerOpen: $isDrawerOpen)
    }
}
