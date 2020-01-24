//
//  SurveyView.swift
//  WaterApp
//
//  Created by Jacob Miller on 1/3/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import SwiftUI

struct SurveyView: View {
    var body: some View {
        
    
        VStack {
            Text("How would you describe yourself?")
            ButtonComponent()
            
        }
            
    }
}

struct SurveyView_Previews: PreviewProvider {
    static var previews: some View {
        SurveyView()
    }
}
