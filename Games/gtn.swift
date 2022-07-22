//
//  gtn.swift
//  SwiftTest
//
//  Created by Radu Teodor Vatra on 21.07.2022.
//

import Foundation
import Darwin

class Gtn {
    func gtn() {
        let version = 1.0;
        print("Guess the number version", version)
        let answer = arc4random_uniform(10)
        var m_input: Int = 0
        repeat {
            if let str = readLine() {
                if let number = Int(str) {
                    m_input = number
                }
            }
            if m_input < answer {
                print("Higher")
            } else if m_input > answer {
                print("Lower")
            } else {
                print("You found it!")
            }
        } while m_input != answer
    }
}
