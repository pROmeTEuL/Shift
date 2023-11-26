//
//  echo.swift
//  Shift
//
//  Created by Radu Teodor Vatra on 21.07.2022.
//

import Foundation

class Echo {
    var m_input: Command
    init(input: Command) {
        m_input = input
    }
    private func echoQuote() -> String {
        var temp: String? = String(m_input.cmd[m_input.cmd.index(m_input.cmd.startIndex, offsetBy: 6)...])
        while temp?.lastIndex(of: "\"") == nil || String(temp![temp!.index(temp!.lastIndex(of: "\"")!, offsetBy: -1)]) == "\\" {
            if let next = readLine() {
                temp?.append(contentsOf: "\n" + next)
            }
        }
        while let range = temp?.range(of: "\\\"") {
            temp?.replaceSubrange(range, with: "\"")
        }
        let output = String(temp![...(temp!.index(temp!.lastIndex(of: "\"")!, offsetBy: -1))])
        return output
    }
    func echo() {
        if (String(m_input.cmd[m_input.cmd.index(m_input.cmd.startIndex, offsetBy: 5)]) != "\"") {
            print(String(m_input.cmd[m_input.cmd.index(m_input.cmd.startIndex, offsetBy: 5)...]))
        } else {
            print(echoQuote())
        }
    }
}
