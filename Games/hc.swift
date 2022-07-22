//
//  hc.swift
//  SwiftTest
//
//  Created by Radu Teodor Vatra on 21.07.2022.
//

import Foundation
import Darwin

public class Hc {
    func hc() {
        let version = 1.0;
        print("Hot-cold version", version)
        let answer = Int(arc4random_uniform(10))
        var m_input: Int = 0
        repeat {
            if let str = readLine() {
                if let number = Int(str) {
                    m_input = number
                }
            }
            if m_input == answer {
                print("You found it!")
            } else if abs(m_input - answer) < 2 {
                print("Hot")
            } else if abs(m_input - answer) < 4 {
                print("Warm")
            } else {
                print("Cold")
            }
        } while m_input != answer
    }
}
