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
    func calc() -> Int{
        var exp: String? = String(m_input.cmd[m_input.cmd.index(m_input.cmd.startIndex, offsetBy: 5)...])
        if exp!.isEmpty {
            return 0
        }
        return algorithm(exp: &exp)
    }
    private func seek(exp: inout String?, type: Character, pos: Int) -> String? {
        var str: String = ""
        let div = exp!.index(exp!.startIndex, offsetBy: pos)
        if (exp![div] == type) {
            var pace = -1
            var start: String.Index = div
            while let index = exp?.index(div, offsetBy: pace, limitedBy: exp!.startIndex), exp![index] >= "0", exp![index] <= "9" {
                str = String(exp![exp!.index(div, offsetBy: pace)...div])
                start = exp!.index(div, offsetBy: pace)
                pace -= 1
            }
            pace = 1
            while let index = exp?.index(div, offsetBy: pace, limitedBy: exp!.endIndex), index < exp!.endIndex, exp![index] >= "0", exp![index] <= "9" {
                str = String(exp![start...exp!.index(div, offsetBy: pace)])
                pace += 1
            }
            return str
        }
        return nil
    }
    private func calculate(exp: inout String, separator: String.Index) -> Int {
        var temp1: String? = String(exp[exp.startIndex..<separator])
        var temp2: String? = String(exp[exp.index(separator, offsetBy: 1)...])
        let no1 = transfNumber(input: &temp1)
        let no2 = transfNumber(input: &temp2)
        switch exp[separator] {
        case "/":
            return no1 / no2
        case "*":
            return no1 * no2
        case "-":
            return no1 - no1
        default:
            return no1 + no2
        }
    }
    private func seek_all(exp: inout String?, type: Character) {
        var pos = 0
        while pos < exp!.count {
            var new_exp: String? = seek(exp: &exp, type: type, pos: pos)
            pos += 1
            if new_exp == nil {
                continue
            }
            let result = calculate(exp: &new_exp!, separator: (new_exp!.firstIndex(of: type))!)
            exp!.replaceSubrange(exp!.range(of: new_exp!)!, with: String(result))
        }
    }
    private func algorithm(exp: inout String?) -> Int {
        seek_all(exp: &exp, type: "/")
        seek_all(exp: &exp, type: "*")
        seek_all(exp: &exp, type: "-")
        seek_all(exp: &exp, type: "+")
        return transfNumber(input: &exp)
    }
    private func transfNumber(input: inout String?) -> Int {
        var str: String = input!
        var ch = str[str.startIndex]
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
