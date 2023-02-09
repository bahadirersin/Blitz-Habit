//
//  AddHabitUI.swift
//  Blitz Habit
//
//  Created by Bahadır Ersin on 8.02.2023.
//

import SwiftUI

struct AddHabitUI: View {
    
    @State private var habitName:String = ""
    @State private var habitType:TrackType = TrackType.Count
    @Environment(\.dismiss) var dismiss
    @ObservedObject var habitList: HabitList
    
    var trackTypes = [TrackType.Count, TrackType.Day, TrackType.Minute, TrackType.Hour]
    
    
    var body: some View {
        NavigationView{
            VStack(alignment:.leading){
                List{
                    HStack{
                        Text("Habit Name:")
                        TextField("Enter here",text: $habitName)
                    }
                    
                    HStack{
                        Text("Measure:")
                        Picker("Track", selection: $habitType){
                            ForEach(trackTypes, id:\.self){
                                Text($0.description)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                }
            }
            .navigationTitle("Track New Habit")
            .toolbar{
                Button("Add"){
                    habitList.addHabit(habit: Habit(name: habitName, type: habitType))
                    dismiss()
                }.padding(.horizontal)
                    .fontWeight(.bold)
            }
        }
    }
}

struct AddHabitUI_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitUI(habitList: HabitList())
    }
}
