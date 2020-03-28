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
    var congratsPhrases = [String]()
    
    var notificationTitles = [String]()
    var notificationBodies = [String]()
    
    static let shared = CommentGen()
    
    private init(){
        // Comments
        comments.append(", you got this!")
        comments.append(", let's get this bread today!")
        comments.append(", today is your day!")
        comments.append(", don't forget to stay hydrated!")
        comments.append(", you are a hydration station!")
        comments.append(", hydration is key!")
        
        // Phrases
        phrases.append("Almost there,")
        phrases.append("Work toward your goal,")
        phrases.append("It's not too late,")
        phrases.append("So close,")
        
        // Congrats Phrases
        congratsPhrases.append("Keep going,")
        congratsPhrases.append("Don't stop,")
        congratsPhrases.append("Push the limit,")
        
        // Notification Titles
        notificationTitles.append("Drink")
        
        // Notification Bodies
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
    func generateCongratsPhrase() -> String {
        if(!congratsPhrases.isEmpty){
            return congratsPhrases[Int.random(in: 0 ... congratsPhrases.count-1)]
        }
        return "Almost there,"
    }
    
    func genNotificationTitle() -> String {
        if(!notificationTitles.isEmpty){
            return notificationTitles[Int.random(in: 0 ... notificationTitles.count-1)]
        }
        
        return "Drink"
    }
    
    func genNotificationbody() -> String {
        
        if(!notificationBodies.isEmpty){
            return notificationBodies[Int.random(in: 0 ... notificationBodies.count-1)]
        }
        
        return "You should Drink Water"
    }
}
