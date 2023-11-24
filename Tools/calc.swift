//
//  calc.swift
//  
//
//  Created by Radu Teodor Vatra on 18.02.2023.
//

import Foundation

class Calc {
    var m_input: Command
    init(input: Command) {
        m_input = input
    }
    func calc(GivenExp: Bool) -> Int{
        var ret = 0
        if (GivenExp) {
            var exp = String(m_input.cmd[m_input.cmd.index(m_input.cmd.startIndex, offsetBy: 5)...])
            while (exp.count != 0) {
                ret = algorithm(exp: &exp, number: ret)
                //exp = String(exp[exp.index(exp.startIndex, offsetBy: 1)])
            }
            return ret
        }
        var exp: String
        if let str = readLine() {
            exp = str
        } else {
            exp = ""
            print("CAN'T READ THE LINE")
        }
        while (exp.count != 0) {
            ret = algorithm(exp: &exp, number: ret)
            //exp = String(exp[exp.index(exp.startIndex, offsetBy: 1)])
        }
        return ret
    }
    private func algorithm(exp: inout String, number: Int = 0) -> Int {
        if exp.count <= 0 {
            return number
        }
        var ret = number
        let ch = exp[exp.startIndex]// *exp
        exp = String(exp[exp.index(exp.startIndex, offsetBy: 1)...])// ++exp;
        if Int(String(ch)) != nil {
            ret = transfNumber(str: &exp, char: ch)
            if exp.count <= 0 {
                return ret
            }
            let temp = exp[exp.startIndex]
            if  temp == "*" || temp == "/" {
                return algorithm(exp: &exp, number: ret)
            }
            return ret
        } else if ch == "+" {
            exp = String(exp[exp.index(exp.startIndex, offsetBy: 1)...])
            let add = algorithm(exp: &exp, number: number)
            return ret + add
        } else if ch == "-" {
            exp = String(exp[exp.index(exp.startIndex, offsetBy: 1)...])
            let sub = algorithm(exp: &exp, number: number)
            return ret - sub
        } else if ch == "*" {
            exp = String(exp[exp.index(exp.startIndex, offsetBy: 1)...])
            let mul = algorithm(exp: &exp, number: number)
            return ret * mul
        } else if ch == "/" {
            exp = String(exp[exp.index(exp.startIndex, offsetBy: 1)...])
            let div = algorithm(exp: &exp, number: number)
            return ret / div
        } else if ch == "(" {
            exp = String(exp[exp.index(exp.startIndex, offsetBy: 1)...])
            var char = exp[exp.startIndex]
            var ret = number
            while char != ")" {
                ret = algorithm(exp: &exp, number: ret)
                char = exp[exp.startIndex]
            }
            exp = String(exp[exp.index(exp.startIndex, offsetBy: 1)])
            char = exp[exp.startIndex]
            if char == "*" || char == "/" {
                return algorithm(exp: &exp, number: ret)
            }
            return ret
        }
        print("problem here")
        return algorithm(exp: &exp, number: number)
    }
    private func transfNumber(str: inout String, char: Character) -> Int {
        var ch = char
        var ret: Int = 0
        while ch >= "0" && ch <= "9" {
            if let number = Int(String(ch)) {
                ret = ret * 10 + number
            }
            if (str.count - 1 <= 0) {
                return ret
            }
            str = String(str[str.index(str.startIndex, offsetBy: 1)])
            ch = str[str.startIndex]
        }
        str = String(str[str.index(str.startIndex, offsetBy: 1)])
        return ret
    }
}
