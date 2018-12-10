//
//  Logger.swift
//  Logger
//
//  Created by Benedek Varga on 03/14 W 73.
//  Copyright © 2018. Benedek Varga. All rights reserved.
//
// Poor man's best debugger is print.

import Foundation
import DateToolsSwift

enum LogEvent: String {
    case info = "[ℹ️]"
    case todo = "[💪]"
    case networking = "[📡]"
    case debug = "[🐛]"
    case warning = "[⚠️]"
    case error = "[‼️]"
    case fatalError = "[🤷🏼‍♂️]"
    case severe = "[🔥]"
}

/// Provide informative log to console. Default event is `debug` and default isDate is `false`.
func logger(_ messageElements: Any...,
    fileName: String = #file,
    line: Int = #line,
    funcName: String = #function,
    event: LogEvent = .debug,
    isDate: Bool = false) {
    let pathComponents = fileName.components(separatedBy: "/")
    let extractedFileName = pathComponents.isEmpty ? "" : pathComponents.last!
    let message = messageElements.map { "\($0)" }.joined(separator: " ")
    print("<\(event.rawValue)> - \(message) - at line \(line) in \(funcName),\(extractedFileName)\(isDate ? " - \(Date().format(with: "yyyy.MM.dd hh:mm:ss:SSSS" ))" : "")")
}
