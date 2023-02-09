//
//  ContentView.swift
//  Blitz Habit
//
//  Created by Bahadır Ersin on 8.02.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habitList = HabitList()
    @State private var sheetDisplay = false

    var colors = [Color.red, Color.blue, Color.green, Color.indigo, Color.orange, Color.yellow, Color.pink, Color.mint, Color.purple, Color.cyan, Color.teal]
    
    let columns = [
        GridItem(.adaptive(minimum: 140, maximum: 200),alignment: .topLeading)
    ]
    
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: true){
                LazyVGrid(columns: columns){
                    ForEach(habitList.list){ habit in
                        NavigationLink{
                            HabitDetail(habitList: habitList, habit: habit)
                        }label: {
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
                }
            }
            .navigationTitle(Date.now.formatted(date: .abbreviated, time: .omitted))
            .toolbar{
                    Button(){
                        sheetDisplay = true
                    }label:{
                        Image(systemName:"plus")
                    }
                }
                .sheet(isPresented: $sheetDisplay){
                    AddHabitUI(habitList:habitList)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
