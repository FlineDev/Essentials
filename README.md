# Foundation

This framework simply consists of the files [AppFoundation.swift](https://github.com/FlineDev/Foundation/blob/main/Sources/AppFoundation/AppFoundation.swift) and [TestFoundation.swift](https://github.com/FlineDev/Foundation/blob/main/Sources/TestFoundation/TestFoundation.swift) which contains just a collection of `@_exported import` statements of frameworks I use in every new app.

## Usage

Simply import `AppFoundation` or `TestFoundation` in your app or test targets Swift files and you no longer need to import `Foundation`, `SwiftUI`, `SwiftData`, `OSLog`, and a couple of other frameworks to eliminate the need for repeated imports. This serves a very similar purpose like the `import Foundation` Apple adds to every new Swift file by default, which is why I named this after it that.

You are free to use the `main` branch of this framework as-is, but note that I might be adding or replacing frameworks over time. You might prefer to fork it and adjust it to your needs.

## License

This library is released under the MIT License. See LICENSE for details.
