//
//  Sign.swift
//  RPS
//
//  Created by flaviaamorim on 09/02/21.
//

import Foundation

func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .papper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock, papper, scissors
    
    //Propriedade computado
    var emoji: String {
        switch self{
        case .rock:
            return "👊🏼"
        case .papper:
            return "🖐🏼"
        case .scissors:
            return "✌🏼"
        }
    }
    
    func gameState(against opponentSign: Sign) -> GameStates {
        if self == opponentSign {
            return .draw
        }
        
        switch self {
        case .rock:
            if opponentSign == .scissors {
                return .win
            }
        case .papper:
            if opponentSign == .rock {
                return .win
            }
        case .scissors:
            if opponentSign == .papper {
                return .win
            }
        }
        return .lose
    }
}
