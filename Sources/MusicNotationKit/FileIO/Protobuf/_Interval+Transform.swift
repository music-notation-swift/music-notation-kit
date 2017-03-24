import MusicNotationCore

extension _Interval {
    func transformQuality() -> MusicNotationCore.IntervalQuality {
        switch quality {
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
        return try Interval(quality: transformQuality(), number: Int(number))
    }
}

extension Interval {
    func transformQuality() -> _Interval.IntervalQuality {
        switch quality {
        case .augmented: return .augmented
        case .diminished: return .diminished
        case .doublyAugmented: return .doublyAugmented
        case .doublyDiminished: return .doublyDiminished
        case .major: return .major
        case .minor: return .minor
        case .perfect: return .perfect
        }
    }
    func transform() -> _Interval {
        var interval = _Interval()
        interval.number = Int64(number)
        interval.quality = transformQuality()
        return interval
    }
}
