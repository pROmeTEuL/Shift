//
//  shell.swift
//  Shift
//
//  Created by Radu Teodor Vatra on 22.07.2022.
//

import Foundation

class Command {var cmd: String = "" }

class Shell {
    let VERSION = 6.0
    init() {
        print("Shift version", VERSION)
        self.m_Echo = Echo(input: m_command)
        self.m_Help = Help(input: m_command)
        self.m_Calc = Calc(input: m_command)
        self.m_Run = Run(input: m_command)
        m_username = "["
        print("username:", terminator: "")
        if let str = readLine() {
            m_username.append(contentsOf: str)
        }
        m_username.append(contentsOf: "]$")
    }
    
    func shell() {
        repeat {
            print(m_username, terminator: " ")
            if let str = readLine() {
                m_command.cmd = str
            }
            switch m_command.cmd {
            case "help":
                m_Help.help(allOfThem: true)
                break
            case "gtn":
                m_Gtn.gtn()
                break
            case "hc":
                m_Hc.hc()
                break
            case "echo":
                print()
                break
            case "exit":
                print("goodbye")
                break
            case "version":
                print("Shift version", VERSION)
                break
            case "calc":
                print("Please give an expression!")
                break
            case "run":
                print("Please give a command!")
                break
            default:
                if m_command.cmd.contains("echo ") {
                    m_Echo.echo()
                }  else if m_command.cmd.contains("help ") {
                    m_Help.help(allOfThem: false)
                } else if m_command.cmd.contains("calc ") {
                    print(m_Calc.calc())
                } else if m_command.cmd.contains("run "){
                    let result = m_Run.run()
                    if result != nil {
                        print(result!)
                    }
                } else {
                    print("unknown command")
                }
            }
        } while m_command.cmd != "exit"
    }
    private var m_command = Command()
    private var m_username: String
    private let m_Gtn = Gtn()
    private let m_Hc = Hc()
    private let m_Echo: Echo
    private let m_Help: Help
    private let m_Calc: Calc
    private let m_Run: Run
}
