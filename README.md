# `_AsyncParsableCommand`

A drop in replacement for `ParsableCommand` allowing you to use async/await in your `ParsableCommand` run method without managing tasks.

Hopefully just here to hold you over until async/await support lands in `swift-argument-parser`.

## Usage

```swift
import AsyncParsableCommand

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
```
