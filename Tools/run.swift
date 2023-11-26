//
//  run.swift
//  Shift
//
//  Created by Radu Teodor Vatra on 26.11.2023.
//

import Foundation

class Run {
    var m_input: Command
    init(input: Command) {
        m_input = input
    }
    func run() -> String? {
        var cmd = String(m_input.cmd[m_input.cmd.index(m_input.cmd.startIndex, offsetBy: 4)...])
        if let range = cmd.range(of: "--verbose ") {
            cmd.replaceSubrange(range, with: "")
            let result = try? process_cmd(cmd)
            return result
        } else if let range = cmd.range(of: "-v ") {
            cmd.replaceSubrange(range, with: "")
            let result = try? process_cmd(cmd)
            return result
        }
        try? process_cmd(cmd)
        return nil
    }
    @discardableResult
    private func process_cmd(_ cmd: String) throws -> String {
        let task = Process()
        let pipe = Pipe()
        task.standardOutput = pipe
        task.standardError = pipe
        task.arguments = ["-c", cmd]
        task.standardInput = nil
        if #available(macOS 10.13, *) {
            task.executableURL = URL(fileURLWithPath: "/bin/zsh")
            try task.run()
        } else {
            // Fallback on earlier versions
            task.launchPath = "/bin/zsh"
            task.launch()
        }
        if #available(macOS 10.15.4, *) {
            let result = try? pipe.fileHandleForReading.readToEnd()
            if result != nil {
                return String(data: result!, encoding: .utf8)!
            } else {
                return ""
            }
        } else {
            return String(data: pipe.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8)!
        }
    }
}
