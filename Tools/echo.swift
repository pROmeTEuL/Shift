//
//  echo.swift
//  SwiftTest
//
//  Created by Radu Teodor Vatra on 21.07.2022.
//

import Foundation

public class Echo {
    func echo() {
        //print(m_input.substring(from: m_input.index(m_input.startIndex, offsetBy: 6)))
        print(String(m_input[m_input.index(m_input.startIndex, offsetBy: 5)...]))
    }
}
