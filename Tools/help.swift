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
            print("calc - shows the result of an expresion(new, please type \"help calc\" for more details)")
            print("echo - prints a message")
            print("gtn - Guess the number")
            print("hc - Hot-cold")
            print("version - shows the Shift version")
            print("help - shows these commands")
            print("exit - it's obvious")
        } else {
            let cmd = String(m_input.cmd[m_input.cmd.index(m_input.cmd.startIndex, offsetBy: 5)...])
            switch (cmd) {
            case "calc":
                print("calc - shows the result of an expresion")
                print(" - it can only give you a result of an expresion with basic operations")
                print(" - the instant expresion is not ready! use live expresion instead")
                print(" - the live expresion should be used like this: `calc\n1\n+1\n")
                break
            case "echo":
                print("echo - prints a message")
                print(" - it works only on console")
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
