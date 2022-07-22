//
//  echo.swift
//  SwiftTest
//
//  Created by Radu Teodor Vatra on 21.07.2022.
//

import Foundation

class Echo {
    var m_input: Command;
    init(input: Command) {
        m_input = input;
    }
    func echo() {
        //print(m_input.substring(from: m_input.index(m_input.startIndex, offsetBy: 5)))
        print(String(m_input.cmd[m_input.cmd.index(m_input.cmd.startIndex, offsetBy: 5)...]))
    }
}
