import UIKit

var greeting = "Hello, playground"
let old = .now - 36000
print(old)

let difference = Date().timeIntervalSince(old)
print(difference)
print(type(of: difference))

let duration = Duration.seconds(2)
let style = Duration.TimeFormatStyle(pattern: .hourMinuteSecond(padHourToLength: 2))
let formatted = duration.formatted(style)
print(formatted)

