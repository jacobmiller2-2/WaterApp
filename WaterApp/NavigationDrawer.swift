//
//  NavigationDrawer.swift
//  WaterApp
//
//  Created by Jacob Miller on 1/20/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct NavigationDrawer: View {
    
    private let width = UIScreen.main.bounds.width - 100
    @Binding var isOpen: Bool
    
    var body: some View {
        HStack {
            DrawerContent(isDrawerOpen: $isOpen)
                .frame(width: self.width)
                .offset(x: self.isOpen ? 0 : -self.width)
                .animation(.default)
            Spacer()
        }
    }
}

struct NavigationDrawer_Previews: PreviewProvider {
    
    @State static var isOpen = true
    
    static var previews: some View {
        NavigationDrawer(isOpen: $isOpen)
    }
}
