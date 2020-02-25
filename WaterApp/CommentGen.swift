//
//  CommentGen.swift
//  WaterApp
//
//  Created by Jacob Miller on 2/21/20.
//  Copyright © 2020 Jacob Miller. All rights reserved.
//

import Foundation

class CommentGen{
    
    var comments = [String]()
    var phrases = [String]()
    
    static let shared = CommentGen()
    
    private init(){
        comments.append(", you got this!")
        comments.append(", let's get this bread today!")
        comments.append(", today is your day!")
        comments.append(", don't forget to stay hydrated!")
        comments.append(", you are a hydration station!")
        comments.append(", hydration is key!")
        
        phrases.append("Almost there,")
        phrases.append("Work toward your goal,")
        phrases.append("It's not too late,")
        phrases.append("So close,")
    }
    
    func generateComment() -> String {
        
        if (!comments.isEmpty){
             return comments[Int.random(in: 0 ... comments.count-1)]
        }
        return ", you have an audience in us!"
    }
    
    func generatePhrase() -> String {
        if(!phrases.isEmpty){
            return phrases[Int.random(in: 0 ... phrases.count-1)]
        }
        return "Almost there,"
    }
}
