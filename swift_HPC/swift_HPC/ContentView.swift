//
//  ContentView.swift
//  swift_HPC
//
//  Created by Mac15 on 2023/3/22.
//

import SwiftUI
struct operatorButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 70.0, height: 70.0)
            .font(.system(size:60))
            .foregroundColor(Color.white)
            .background(.black)
    }
}
struct NumberButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 70.0, height: 70.0)
            .font(.system(size:60))
            .foregroundColor(Color.white)
            .background(.red)
    }
}


struct ContentView: View {
    @State private var  result: String = "0.0"
    @State private var  op1 = 0.0
    @State private var  op2 = 0.0
    @State private var  operatorType = ""
    @State private var  operator0 = false
    @State private var  isFloating = false
    var body: some View {

        
        VStack {
            Text(result)
                .font(.system(size:50))
                .padding(.trailing)
                .lineLimit(1)
                .frame(minWidth: 0, maxWidth: 300 , alignment: .trailing)
            HStack {
                Button("÷") {
                    op1 = Double(result)!
                    operator0 = true
                    operatorType = "÷"
                }.buttonStyle(operatorButtonStyle())
                
                Button("x") {
                    op1 = Double(result)!
                    operator0 = true
                    operatorType = "x"
                }.buttonStyle(operatorButtonStyle())
                Button("-") {
                    op1 = Double(result)!
                    operator0 = true
                    operatorType = "-"
                }.buttonStyle(operatorButtonStyle())
                Button("+") {
                    op1 = Double(result)!
                    operator0 = true
                    operatorType = "+"
            }.buttonStyle(operatorButtonStyle())
        }.padding(1)
            HStack {
                Button("%") {
                    op1 = Double(result)!
                    operator0 = true
                    operatorType = "%"
            }.buttonStyle(operatorButtonStyle())
                Button("7") {
                    if(result == "0.0" || operator0 == true){
                        result = "7"
                        operator0 = false
                    } else{
                        result += "7"
                    }
            }.buttonStyle(NumberButtonStyle())
                Button("8") {
                    if(result == "0.0" || operator0 == true){
                        result = "8"
                        operator0 = false
                    } else{
                        result += "8"
                    }
            }.buttonStyle(NumberButtonStyle())
                Button("9") {
                    if(result == "0.0" || operator0 == true){
                        result = "9"
                        operator0 = false
                    } else{
                        result += "9"
                    }
            }.buttonStyle(NumberButtonStyle())
        }.padding(1)
            HStack {
                Button("√") {
                    op1 = Double(result)!
                    result = String(sqrt(op1))
            }.buttonStyle(operatorButtonStyle())
                Button("4") {
                    if(result == "0.0" || operator0 == true){
                        result = "4"
                        operator0 = false
                    } else{
                        result += "4"
                    }
            }.buttonStyle(NumberButtonStyle())
                Button("5") {
                    if(result == "0.0" || operator0 == true){
                        result = "5"
                        operator0 = false
                    } else{
                        result += "5"
                    }
            }.buttonStyle(NumberButtonStyle())
                Button("6") {
                    if(result == "0.0" || operator0 == true){
                        result = "6"
                        operator0 = false
                    } else{
                        result += "6"
                    }
            }.buttonStyle(NumberButtonStyle())
        }.padding(1)
            
            HStack {
                Button("±") {
                    op1 = Double(result)!
                    result = String(-op1)
            }.buttonStyle(operatorButtonStyle())
                
                Button("1") {
                    if(result == "0.0" || operator0 == true){
                        result = "1"
                        operator0 = false
                    } else{
                        result += "1"
                    }
            }.buttonStyle(NumberButtonStyle())
                
                Button("2") {
                    if(result == "0.0" || operator0 == true){
                        result = "2"
                        operator0 = false
                    } else{
                        result += "2"
                    }
            }.buttonStyle(NumberButtonStyle())
                
                Button("3") {
                    if(result == "0.0" || operator0 == true){
                        result = "3"
                        operator0 = false
                    } else{
                        result += "3"
                    }
            }.buttonStyle(NumberButtonStyle())
        } .padding(1)
            HStack {
                Button("AC") {
                    result = "0.0"
                    operator0 = false
                    isFloating = false
                }.frame(width: 70.0, height: 70.0)
                    .font(.system(size:50))
                    .foregroundColor(Color.white)
                    .background(.black)
                
                Button(".") {
                    if(isFloating == false || operator0 == true){
                        result += "."
                        isFloating = true
                    }
                }.buttonStyle(NumberButtonStyle())
                Button("0") {
                    if(result == "0.0" || operator0 == true){
                        result = "0"
                        operator0 = false
                    } else{
                        result += "0"
                    }
                }.buttonStyle(NumberButtonStyle())
                Button("=") {
                    op2 = Double(result)!
                    isFloating = true
                    switch(operatorType){
                    case "+":
                        result = String(op1 + op2)
                    case "-":
                        result = String(op1 - op2)
                    case "x":
                        result = String(op1 * op2)
                    case "÷":
                        result = String(op1 / op2)
                    case "%":
                        result = String(Double(Int(op1) % Int(op2)))
                    default:
                        break
                    }
                    operator0 = false
                    operatorType = ""
            }.buttonStyle(operatorButtonStyle())
        }
            
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
