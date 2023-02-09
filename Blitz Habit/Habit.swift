//
//  Habit.swift
//  Blitz Habit
//
//  Created by Bahadır Ersin on 8.02.2023.
//

import Foundation
import SwiftUI

enum TrackType{
    case Day
    case Minute
    case Hour
    case Count
    
    var description : String {
        switch self {
            // Use Internationalization, as appropriate.
        case .Day: return "Days"
        case .Minute: return "Minutes"
        case .Hour: return "Hours"
        case .Count: return "Counts"
        }
    }
}

struct Habit:Identifiable, Equatable{
    let id:UUID = UUID()
    var name:String
    var type:TrackType
    var counter:Int = 0
    var image:Image{
        if(type == TrackType.Count){
            return Image(systemName: "number.square")
        }else if(type == TrackType.Day){
            return Image(systemName: "calendar")
        }else if(type == TrackType.Hour || type == TrackType.Minute){
            return Image(systemName: "hourglass")
        }
        return Image(systemName: "h.square")
    }
    
    func toString() -> String{
        if(type == TrackType.Count){
            return "times"
        }else if(type == TrackType.Day){
            return "days"
        }else if(type == TrackType.Hour){
            return "hours"
        }else if(type == TrackType.Minute){
            return "minutes"
        }
        
        return ""
    }
}
