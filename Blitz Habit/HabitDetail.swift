//
//  HabitDetail.swift
//  Blitz Habit
//
//  Created by Bahadır Ersin on 9.02.2023.
//

import SwiftUI

struct HabitDetail: View {
    
    @ObservedObject var habitList: HabitList
    var habit:Habit
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Text(habit.name)
                }header: {
                    Text("Habit Name")
                }
                
                Section{
                    Text(habit.image)
                }header: {
                    Text("Habit Icon")
                }
                
                Section{
                    HStack{
                        Text("\(habit.counter)")
                        Text(habit.toString())
                    }
                }header:{
                    Text("Total Tracked")
                }
                
                Button{
                    habitList.removeHabit(habit: habit)
                }label:{
                    HStack(alignment: .center){
                        Image(systemName: "trash")
                        Text("Delete Habit")
                    }.foregroundColor(.red)
                }
            }.navigationTitle(habit.name)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HabitDetail_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetail(habitList: HabitList(), habit:HabitList().list[0])
    }
}
