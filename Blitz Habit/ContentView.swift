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
                            HabitGridItem(habitList: habitList, habit: habit)
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
