//
//  main.swift
//  dumpclr
//
//  Created by TAKEDA hiroyuki on 2017/11/05.
//  Copyright © 2017 3ign0n. All rights reserved.
//

import Foundation
import AppKit.NSColor

let executable = URL(string: CommandLine.arguments[0])!

func showHelp() {
    print("usage:")
    print("\(executable.lastPathComponent) <path to color palette file>")
}

func dumpColorPalette(file: URL) {
    guard let colorList = NSColorList(name: NSColorList.Name(file.lastPathComponent), fromFile: file.path) else {
        showHelp()
        return
    }
    
    colorList.allKeys.forEach {
        print("\(String(describing: colorList.color(withKey: $0)))")
    }
}

func main() {
    guard CommandLine.argc == 2 else {
        showHelp()
        return
    }
    
    guard let paletteFile = URL(string: CommandLine.arguments[1]), FileManager.default.fileExists(atPath: paletteFile.absoluteString) else {
        showHelp()
        return
    }
    
    dumpColorPalette(file: paletteFile)
}

main()
