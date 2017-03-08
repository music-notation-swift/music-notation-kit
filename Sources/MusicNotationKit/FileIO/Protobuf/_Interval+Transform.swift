import MusicNotationCore

extension _Interval {
    func transformQuality() -> MusicNotationCore.IntervalQuality {
        switch self.quality {
        case .augmented: return MusicNotationCore.IntervalQuality.augmented
        case .diminished: return MusicNotationCore.IntervalQuality.diminished
        case .doublyAugmented: return MusicNotationCore.IntervalQuality.doublyAugmented
        case .doublyDiminished: return MusicNotationCore.IntervalQuality.doublyDiminished
        case .major: return MusicNotationCore.IntervalQuality.major
        case .minor: return MusicNotationCore.IntervalQuality.minor
        case .perfect: return MusicNotationCore.IntervalQuality.perfect
        default: return MusicNotationCore.IntervalQuality.major
        }
    }
    func transform() throws -> Interval {
        return try Interval(quality: self.transformQuality(), number: Int(self.number))
    }
}
