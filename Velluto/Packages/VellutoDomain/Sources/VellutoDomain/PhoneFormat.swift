public struct PhoneFormat: Sendable {
    public let countryCode: String
    public let trunkPrefix: String?
    public let length: Int

    public static let egypt = PhoneFormat(countryCode: "20", trunkPrefix: "0", length: 10)

    public init(countryCode: String, trunkPrefix: String?, length: Int) {
        self.countryCode = countryCode
        self.trunkPrefix = trunkPrefix
        self.length = length
    }

    public func digits(from input: String) -> String {
        /// arabic keyboards type ٠-٩, wholeNumberValue turns them into 0-9
        var digits = input.compactMap(\.wholeNumberValue).map(String.init).joined()
        /// a pasted number can start with 0020, 20 or 0
        let prefixes = ["00" + countryCode, countryCode, trunkPrefix].compactMap { $0 }
        if digits.count > length, let prefix = prefixes.first(where: { digits.hasPrefix($0) }) {
            digits.removeFirst(prefix.count)
        }
        if let trunkPrefix, digits.hasPrefix(trunkPrefix) { digits.removeFirst(trunkPrefix.count) }
        return String(digits.prefix(length))
    }

    public func formatted(_ input: String) -> String {
        var text = ""
        for (index, digit) in digits(from: input).enumerated() {
            if index == 3 || index == 6 { text += " " }
            text.append(digit)
        }
        return text
    }

    public func isComplete(_ input: String) -> Bool {
        digits(from: input).count == length
    }
}
