//
//  MacOSInteractor.swift
//  MacOSInteractor
//
//  Created by Jeremy Bannister on 7/1/18.
//  Copyright © 2018 Jeremy Bannister. All rights reserved.
//

import Foundation
import OSInteractor
import Shell
import Cliclick

// MARK: - Initial Declaration
public struct MacOSInteractor: OSInteractor {
  private let shell: Shell
  private let cliclick: Cliclick
  
  public init () {
    self.shell = Shell(defaultStaggarDelay: 0.05)
    self.cliclick = Cliclick(shell: self.shell)
  }
}

// MARK: - Public API
extension MacOSInteractor {
  public func click (at x: Double, _ y: Double) {
    cliclick.click(at: x, y)
  }
  
  public func type (_ text: String) {
    cliclick.type(text)
  }
  
  public func press (_ key: PressableKey) {
    cliclick.press(key)
  }
  
  public func whileHolding (_ key: HoldableKey, do action: ()->()) { whileHolding(keys: [key], do: action) }
  public func whileHolding (keys: [HoldableKey], do action: () -> ()) {
    cliclick.whileHolding(keys: keys, do: action)
  }
  
  public func openApp (_ name: String) {
    shell.staggarExecution(path: "/usr/bin/open", arguments: ["-a", name])
  }
  
  
  public func selectAll () { whileHolding(.cmd) { type("a") } }
  public func copySelection () { whileHolding(.cmd) { type("c") } }
  public func cutSelection () { whileHolding(.cmd) { type("x") } }
  public func paste () { whileHolding(.cmd) { type("v") } }
  public func quit () { whileHolding(.cmd) { type("q") } }
  public func newTab () { whileHolding(.cmd) { type("t") } }
  public func closeTab () { whileHolding(.cmd) { type("w") } }
}
