//
//  TaskState.swift
//
//
//  Created by Christopher Weems on 10/4/21.
//

import ArgumentParser

internal class TaskState<Command: ParsableCommand> {
    var command: Command
    var error: Error?
    
    init(command: Command) {
        self.command = command
        
    }
    
}
