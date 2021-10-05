import XCTest
import ArgumentParser
@testable import AsyncParsableCommand

final class _AsyncParsableCommandTests: XCTestCase {
    #if os(macOS) // async test cases do not currently work on Linux
    func testExample() async throws {
        struct Countdown: _AsyncParsableCommand {
            @Argument var count: Int
            
            func run() async throws {
                var remaining = count
                
                while 0 < remaining {
                    print("\(remaining)!")
                    await Task.sleep(1_000_000_000)
                    remaining -= 1
                }
                
                print("Countdown complete!")
                
            }
            
        }
        
        var countdown = Countdown()
        countdown.count = 5
        
        try await countdown.run()
    }
    #endif    

}
