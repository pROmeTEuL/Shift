//
//  help.swift
//  
//
//  Created by Radu Teodor Vatra on 22.07.2022.
//

import Foundation

class Help {
    var m_input: Command;
    init(input: Command) {
        m_input = input;
    }
    func help(allOfThem: Bool) {
        if allOfThem {
            print("echo - prints a message(not quite ready)")
            print("gtn - Guess the number")
            print("hc - Hot-cold")
            print("version - shows the Shift version")
            print("help - shows these commands")
            print("exit - it's obvious")
        } else {
            let cmd = String(m_input.cmd[m_input.cmd.index(m_input.cmd.startIndex, offsetBy: 5)...])
            switch (cmd) {
            case "echo":
                print("echo - prints a message(not quite ready)")
                break
            case "gtn":
                print("gtn - Guess the number game from 0 to 10")
                break
            case "hc":
                print("hc - Hot-cold game from 0 to 10")
                break
            case "version":
                print("version - shows the Shift version")
                break
            case "exit":
                print("exit - exits the program :|")
                break
            case "help":
                print("really?")
            default:
                print("command", cmd, "is unknown");
            }
        }
    }
}
