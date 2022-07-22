//
//  shell.swift
//  Shift
//
//  Created by Radu Teodor Vatra on 22.07.2022.
//

import Foundation

public class Shell {
    init() {
        self.m_Echo = Echo(input: m_command)
        m_username = "["
        print("username:", terminator: "")
        if let str = readLine() {
            m_username.append(contentsOf: str)
        }
        m_username.append(contentsOf: "]$")
    }
    
    private func help() {
        print("help - show this and the following commands")
        print("echo - prints a message")
        print("gtn - Guess the number")
        print("hc - Hot-cold")
        print("exit - it's obvious")
    }
    
    func shell() {
        let version = 4.0
        print("Improvised shell version", version)
        repeat {
            print(m_username, terminator: " ")
            if let str = readLine() {
                m_command.cmd = str
            }
            switch m_command.cmd {
            case "help":
                help()
                break
            case "gtn":
                m_Gtn.gtn()
                break
            case "hc":
                m_Hc.hc()
                break
            case "exit":
                print("goodbye")
                break
            default:
                if (m_command.cmd.contains("echo ")) {
                    m_Echo.echo()
                } else {
                    print("unknown command")
                }
            }
        } while m_command.cmd != "exit"
    }
    private var m_command = Command();
    private var m_username: String;
    private let m_Gtn = Gtn();
    private let m_Hc = Hc();
    private let m_Echo: Echo
}
