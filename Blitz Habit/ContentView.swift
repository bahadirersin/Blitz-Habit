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

    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView{
            LazyVGrid(columns: columns){
                ForEach(habitList.list){ habit in
                    VStack(alignment:.leading){
                        
                        HStack(alignment: .top){
                            habit.image
                            Text(habit.name)
                        }.font(.subheadline)
                            .foregroundColor(.white)
                        
                        HStack(alignment: .center){
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
                        
                    }
                    .frame(width:150,height:150)
                    .shadow(radius: 10)
                    .background(.primary)
//                    .background(LinearGradient(colors: [.blue,.white], startPoint: .top, endPoint: .bottom))
                }
            }
            .navigationTitle("Blitz Habit")
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
