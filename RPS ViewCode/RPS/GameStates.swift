//
//  GameStates.swift
//  RPS
//
//  Created by flaviaamorim on 09/02/21.
//

import Foundation

enum GameStates {
    case start, win, lose, draw
    
    var status: String {
        switch self {
        case .start:
            return "Rock, Papper, Scissors"
        case .win:
            return "You won!"
        case .lose:
            return "You lost!"
        case .draw:
            return "There was a tie!"
        }
    }
}
