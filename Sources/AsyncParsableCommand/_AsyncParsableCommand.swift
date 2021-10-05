import ArgumentParser
import Dispatch

public protocol _AsyncParsableCommand: ParsableCommand {
    mutating func run() async throws
    
}

extension _AsyncParsableCommand {
    public mutating func run() throws {
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        
        let taskState = TaskState(command: self)
        
        Task.detached(priority: .userInitiated) {
            defer { dispatchGroup.leave() }
            
            do {
                try await taskState.command.run()
                
            } catch {
                taskState.error = error
                
            }
            
        }
        
        dispatchGroup.wait()
        
        self = taskState.command
        
        if let error = taskState.error {
            throw error
        }
        
    }
    
}
