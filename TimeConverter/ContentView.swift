//
//  ContentView.swift
//  TimeConverter
//
//  Created by Onur Ozfuttu on 2.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var second: Double = 0.0
    @State private var pickedStuff = "Minute"
    let pickConvert = ["Minute", "Hour", "Day"]
    
    
    @FocusState private var isFocused: Bool
    
    var calculatedMinute: Double {
        second / 60
    }
    
    var calculatedHour: Double {
        calculatedMinute / 60
    }
    
    var calculatedDay: Double {
        calculatedHour / 24
    }
    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Write seconds", value: $second, format: .number)
                }header: {
                    Text("Second")
                }
                .keyboardType(.decimalPad)
                .focused($isFocused)
                Picker("Pick to convert", selection: $pickedStuff){
                    ForEach(pickConvert, id: \.self){
                        Text($0)
                    }
                }.pickerStyle(.segmented)
                Section{
                    if pickedStuff == "Minute" {
                        Text(calculatedMinute, format: .number)
                    } else if pickedStuff == "Hour" {
                        Text(calculatedHour, format: .number)
                    } else {
                        Text(calculatedDay, format: .number)
                    }
                        
                }header: {
                    if pickedStuff == "Minute"{
                        Text(pickConvert[0])
                    } else if pickedStuff == "Hour"{
                        Text(pickConvert[1])
                    } else {
                        Text(pickConvert[2])
                    }
                }
                
            }
            
            
            .navigationTitle("Time Converter")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    Button("Done"){
                        isFocused = false
                    }
                }
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
