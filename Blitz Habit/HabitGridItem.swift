//
//  HabitGridItem.swift
//  Blitz Habit
//
//  Created by Bahadır Ersin on 9.02.2023.
//

import SwiftUI

struct HabitGridItem: View {
    
    @ObservedObject var habitList:HabitList
    var habit:Habit
    var colors = [Color.red, Color.blue, Color.green, Color.indigo, Color.orange, Color.yellow, Color.pink, Color.mint, Color.purple, Color.cyan, Color.teal]
    
    var body: some View {
        VStack(alignment:.leading){
            
            HStack(alignment: .top){
                habit.image
                Text(habit.name)
            }.font(.subheadline)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(.bottom,5)
                .padding(.top,20)
            
            HStack(alignment: .center){
                Button{
                    habitList.removeLog(count: 1, habit: habit)
                }label:{
                    Image(systemName: "minus.circle.fill")
                        .font(.title)
                }
                Text("\(habit.counter)")
                    .font(.title)
                    .fontWeight(.bold)
                Text(habit.toString())
                Button{
                    habitList.addLog(count: 1, habit: habit)
                }label:{
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                }
            }
            .foregroundColor(.white)
            .padding(.bottom,20)
            
        }
        .frame(maxWidth:200,maxHeight: 150)
        .shadow(radius: 10)
        .background(LinearGradient(gradient: Gradient(colors: [colors[habit.colorCode], colors[habit.colorCode].opacity(0.8)]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct HabitGridItem_Previews: PreviewProvider {
    static var previews: some View {
        HabitGridItem(habitList:HabitList(),habit:HabitList().list[0])
    }
}
