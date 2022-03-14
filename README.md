# `_AsyncParsableCommand`

A drop-in replacement for `ParsableCommand` allowing you to use async/await in `ParsableCommand.run()` without managing tasks.

~~Hopefully just here to hold you over until async/await support lands in `swift-argument-parser`.~~

It's here! As `AsyncParsableCommand` is now officially part of the `swift-argument-parser` project, this package will no longer be maintained.

For more information: [apple/swift-argument-parser #404](https://github.com/apple/swift-argument-parser/pull/404)

## Usage

```swift
import ArgumentParser
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
