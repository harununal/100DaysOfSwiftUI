//
//  ContentView.swift
//  RockScissorsPaper
//
//  Created by Mac on 6.12.2021.
//

import SwiftUI

struct ContentView: View {
    //MARK: - variables
    
    var gameMax = 10
    var moveList = ["✊🏾", "🖐🏾", "✌🏾"]
    var cpuMove : String {moveList[Int.random(in: 0 ..< 3)]}
    
    @State var isShowingCpuMove = false
    @State var cpuMoveScreen = "❓"
    
    @State var betforWin = true
    var cpuBetEmoji : String {betforWin ? "❌" : "🏆"}
    var playerBetEmoji : String {betforWin ? "🏆" : "❌"}
    
    @State var cpuScore = 0
    @State var playerScore = 0
    @State var gameNow = 0
    
    @State var isPlayerWin = false
    @State var isCpuWin = false
    
    @State var isGameFinished = false
    @State var differentPoint = 0
    @State var scoreMessage = ""
    
    //MARK: - body
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    LinearGradient(gradient: Gradient(stops: [
                        .init(color: .cyan, location: 0.0),
                        .init(color: .indigo, location: 0.5),
                        .init(color: .cyan, location: 1.0),
                    ]), startPoint: .top, endPoint: .bottom)
                    VStack { //bet colon
                        Text("\nCPU").font(.system(size: 25).bold()).foregroundColor(.white)
                        Text("\(cpuBetEmoji)\n").font(.system(size: 50))
                        Spacer()
                        Button {
                            changeBet()
                        } label: {
                            Text("🔄")
                                .font(.system(size: 50))
                        }
                        Text("Swap").font(.title2.bold()).foregroundColor(.white)
                        Text("Bet").font(.title2.bold()).foregroundColor(.white)
                        Spacer()
                        Text("\n\(playerBetEmoji)").font(.system(size: 50))
                        Text("Player\n").font(.system(size: 25).bold()).foregroundColor(.white)
                        
                    }
                }.clipShape(Capsule(style: .circular))
                VStack { //middle colon
                    
                    Text(cpuMoveScreen).frame(maxWidth: .infinity).background(.yellow).clipShape(Circle()).font(.system(size: 100))
                    Spacer()
                }
                
                
                ZStack {
                    LinearGradient(gradient: Gradient(stops: [
                        .init(color: .cyan, location: 0.0),
                        .init(color: .indigo, location: 0.5),
                        .init(color: .cyan, location: 1.0),
                    ]), startPoint: .top, endPoint: .bottom)
                    VStack { // score colon
                        
                        Text("\nCPU\n").font(.system(size: 25).bold()).foregroundColor(.white)
                        Text(String(cpuScore)).font(.largeTitle.bold())
                        Spacer()
                        Text("Game:").font(.title2.bold()).foregroundColor(.white)
                        Text(String("\(gameNow) / \(gameMax)")).font(.title2.bold()).foregroundColor(.white)
                        Spacer()
                        Text(String(playerScore)).font(.largeTitle.bold())
                        Text("\nPlayer\n").font(.system(size: 25).bold()).foregroundColor(.white)
                    }
                }.clipShape(Capsule(style: .circular))
            }
            
            HStack { // bottom row
                Spacer()
                Button {
                    tappedButton(1)
                } label: {
                    Text("🤚")
                        .background(.blue).clipShape(Circle()).font(.system(size: 100))
                }
                Spacer()
            }
            
            
            
            HStack { // bottom row
                Button {
                    tappedButton(0)
                } label: {
                    Text("✊")
                        .background(.blue).clipShape(Circle()).font(.system(size: 100))
                }
                Spacer()
                Button {
                    tappedButton(2)
                } label: {
                    Text("✌️")
                        .background(.blue).clipShape(Circle()).font(.system(size: 100))
                }
                
                
            }// end of bottom row
        }
        .padding()
        .font(.system(size: 50))
        .alert("Game finished!\nYour score: \(playerScore)\nCpu score: \(cpuScore)\n\(scoreMessage)", isPresented: $isGameFinished) {
            Button("Again") {
                gameNow = 0
                playerScore = 0
                cpuScore = 0
                cpuMoveScreen = "❓"
            }
            Button("Exit") {
                gameNow = 0
                playerScore = 0
                cpuScore = 0
                cpuMoveScreen = "❓"
            }
        }
    }
    //MARK: - functions
    func changeBet() {
        betforWin.toggle()
    }
    
    func tappedButton(_ choice : Int) {
        gameNow += 1
        isShowingCpuMove = true
        calculateMatch(choice)
        differentPoint = playerScore - cpuScore
        
        if gameNow == gameMax {
            isGameFinished = true
            
            switch differentPoint {
            case 0...Int.max:
                print("player is winner!")
                scoreMessage = "You win!\nPlay again?"
            case Int.min...0:
                print("cpu is winner!")
                scoreMessage = "You lose!\nPlay again?"
            default:
                print("player and cpu are equal!")
                scoreMessage = "Equality!\nPlay again?"
            }
        }
        
    }
    
    
    func calculateMatch(_ choice : Int) {
        let combination =  [cpuMove, moveList[choice]]
        cpuMoveScreen = combination[0]
        
        switch combination {
        case ["✊🏾", "✊🏾"],["🖐🏾", "🖐🏾"],["✌🏾", "✌🏾"]:
            print("Equality!")
            if betforWin {
                isPlayerWin = false
            } else {
                isPlayerWin = true
            }
        case ["✊🏾", "🖐🏾"],["🖐🏾", "✌🏾"],["✌🏾", "✊🏾"]:
            print("player win!")
            isPlayerWin = true
        case ["🖐🏾", "✊🏾"],["✌🏾", "🖐🏾"],["✊🏾", "✌🏾"]:
            print("player lose!")
            isPlayerWin = false
        default:
            print("an error")
        }
        
        if (betforWin && isPlayerWin) || (!betforWin && !isPlayerWin) {
            playerScore += 1
            cpuScore -= 1
        } else {
            playerScore -= 1
            cpuScore += 1
        }
    }
}

//MARK: - preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//MARK: - structs


