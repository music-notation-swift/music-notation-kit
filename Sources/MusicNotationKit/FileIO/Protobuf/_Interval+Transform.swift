import MusicNotationCore

extension _Interval {
    func transformQuality() -> MusicNotationCore.IntervalQuality {
        switch self.quality {
        case .augmented: return .augmented
        case .diminished: return .diminished
        case .doublyAugmented: return .doublyAugmented
        case .doublyDiminished: return .doublyDiminished
        case .major: return .major
        case .minor: return .minor
        case .perfect: return .perfect
        default: return .major
        }
    }
    func transform() throws -> Interval {
        return try Interval(quality: self.transformQuality(), number: Int(self.number))
    }
}
