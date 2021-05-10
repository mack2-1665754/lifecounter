//
//  ContentView.swift
//  LifeCounter2
//
//  Created by stlp on 5/7/21.
//

import SwiftUI

var history = [String]()

struct ContentView: View {
    @State var count: Double = 0.0
    @State var numPlayers = 2
    
    var body: some View {
        
        ScrollView {
            
            VStack {

                Button(action: {
                    if(self.numPlayers < 8) {
                        self.numPlayers += 1
                    }
                }, label: {
                    Text("Add Player")
                }).padding(50)
     
                Text("Select Life Amount to Subtract: \(count, specifier: "%.2f")")
                Slider(value: $count, in: 0...20).padding()
                ForEach(0 ..< self.numPlayers, id: \.self) { i in
                    PlayerView(amount: self.count, playerNum: i + 1)
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

struct PlayerView: View {
    var amount: Double
    var playerNum: Int
    @State var numLives = 20.0

    init(amount: Double, playerNum: Int) {
        self.amount = amount
        self.playerNum = playerNum
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Player " + String(playerNum)).padding()
                Spacer()
                Text("Lives Left: \(numLives, specifier: "%.2f")").padding()
            }
            HStack{
                Button(action: {
                    self.numLives -= amount
                    history.append("Player " + String(self.playerNum) + " gained " + String(self.amount) + " lives")
                }, label: {
                    Text("-" + String(3))
                }).padding()
                Button(action: {
                    self.numLives -= 1
                    history.append("Player " + String(self.playerNum) + " lost 1 life")
                }, label: {
                    Text("-1")
                }).padding()
                Button(action: {
                    self.numLives += 1
                    history.append("Player " + String(self.playerNum) + " gained 1 life")
                }, label: {
                    Text("+1")
                }).padding()
                Button(action: {
                    self.numLives += amount
                    history.append("Player " + String(self.playerNum) + " gained " + String(self.amount) + " lives")
                }, label: {
                    Text("+")
                }).padding()
            }
        }
    }
    
    
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(amount: 1.0, playerNum: 1)
    }
}
