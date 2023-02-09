//
//  HabitList.swift
//  Blitz Habit
//
//  Created by Bahadır Ersin on 8.02.2023.
//

import Foundation

class HabitList:ObservableObject{
    @Published var list:[Habit] = [Habit]()
    
    func addHabit(habit:Habit){
        list.append(habit)
    }
    
    func removeHabit(habit:Habit){
        if let index = list.firstIndex(where:{$0 == habit}){
            list.remove(at: index)
        }else{
            print("List Error: Can not find habit in the list")
        }
    }
    
    func addLog(count:Int, habit:Habit){
        if let index = list.firstIndex(where:{$0 == habit}){
            list[index].counter += count
        }else{
            print("List Error: Can not find habit in the list")
        }
    }
    
}
