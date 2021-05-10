//
//  ContentView.swift
//  LifeCounter2
//
//  Created by stlp on 5/7/21.
//

import SwiftUI

var history = [String]()
var gameStarted = false

//ForEach(self.toDoStorage.toDos) { todo in
//
//    if todo.important {
//        Text(todo.title).bold()
//    } else {
//        Text(todo.title)
//    }
//}


struct ContentView: View {
    @State var count: Double = 0.0
    @State var numPlayers = 4
    
    var body: some View {
        NavigationView {
//            navigationBarItems(leading: NavigationLink(destination: HistoryView(historyStrings: history),
//                label: {Text("History")}))
            VStack() {
            NavigationLink(destination: HistoryView(),
                           label: {Text("History")}).padding(0)
        
                ScrollView() {

                    VStack {

                        Button(action: {
                            if(self.numPlayers < 8 && !gameStarted) {
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
    
    func startGame() {
        if (!gameStarted) {
            gameStarted = true
        }
    }
    func didLose() {
        if (self.numLives <= 0) {
            history.append("Player " + String(self.playerNum) + " loses")
        }
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
                    didLose()
                    startGame()
                    print(history[history.count - 1])

                }, label: {
                    Text("-")
                }).padding()
                Button(action: {
                    self.numLives -= 1
                    history.append("Player " + String(self.playerNum) + " lost 1 life")
                    didLose()
                    startGame()
                    print(history[history.count - 1])

                }, label: {
                    Text("-1")
                }).padding()
                Button(action: {
                    self.numLives += 1
                    history.append("Player " + String(self.playerNum) + " gained 1 life")
                    didLose()
                    startGame()
                    print(history[history.count - 1])

                }, label: {
                    Text("+1")
                }).padding()
                Button(action: {
                    self.numLives += amount
                    history.append("Player " + String(self.playerNum) + " gained " + String(self.amount) + " lives")
                    didLose()
                    startGame()
                    print(history[history.count - 1])
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

struct HistoryView: View {
    var body: some View {
        List {
            ForEach(0 ..< history.count, id: \.self) { i in
                Text(history[i])
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
