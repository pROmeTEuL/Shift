//
//  help.swift
//  Shift
//
//  Created by Radu Teodor Vatra on 22.07.2022.
//

import Foundation

class Help {
    var m_input: Command
    init(input: Command) {
        m_input = input
    }
    func help(allOfThem: Bool) {
        if allOfThem {
            print("run - runs a shell command (new, please type \"help run\" for more details)")
            print("calc - shows the result of an expresion(please type \"help calc\" for more details)")
            print("echo - prints a message")
            print("gtn - Guess the number")
            print("hc - Hot-cold")
            print("version - shows the Shift version")
            print("help - shows these commands, it can be used to see more details about some commands")
            print("exit - it's obvious")
        } else {
            let cmd = String(m_input.cmd[m_input.cmd.index(m_input.cmd.startIndex, offsetBy: 5)...])
            switch (cmd) {
            case "run":
                print("run - runs a shell command")
                print(" - it can only use zsh (for now)")
                print(" - don't try to change directories, it won't work")
                print(" - it's in experimetal phase -> some command might not work (such as cd)")
                break
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
