import MusicNotationCore

extension _NoteDuration {
    func transformValue() -> NoteDuration.Value? {
        switch self.value {
        case .large: return .large
        case .long: return .long
        case .doubleWhole: return .doubleWhole
        case .whole: return .whole
        case .half: return .half
        case .quarter: return .quarter
        case .eighth: return .eighth
        case .sixteenth: return .sixteenth
        case .thirtySecond: return .thirtySecond
        case .sixtyFourth: return .sixtyFourth
        case .oneTwentyEighth: return .oneTwentyEighth
        case .twoFiftySixth: return .twoFiftySixth
        default: return nil
        }
    }

    func transformTimeSignature() -> NoteDuration.TimeSignatureValue? {
        switch self.timeSignatureValue {
        case .tsWhole: return .whole
        case .tsHalf: return .half
        case .tsQuarter: return .quarter
        case .tsEighth: return .eighth
        case .tsSixteenth: return .sixteenth
        case .tsThirtySecond: return .thirtySecond
        case .tsSixtyFourth: return .sixtyFourth
        case .tsOneTwentyEighth: return .oneTwentyEighth
        default: return nil
        }
    }

    func transform() throws -> NoteDuration {
        if let value = self.transformValue() {
            return try NoteDuration(value: value, dotCount: Int(self.dotCount))
        }
        if let timeSignature = self.transformTimeSignature() {
            return NoteDuration(timeSignatureValue: timeSignature)
        }
        throw NoteDurationTransformError.invalidSetOfParameters
    }
}

extension NoteDuration {
    func transformValue() -> _NoteDuration.Value {
        switch self.value {
        case .large: return .large
        case .long: return .long
        case .doubleWhole: return .doubleWhole
        case .whole: return .whole
        case .half: return .half
        case .quarter: return .quarter
        case .eighth: return .eighth
        case .sixteenth: return .sixteenth
        case .thirtySecond: return .thirtySecond
        case .sixtyFourth: return .sixtyFourth
        case .oneTwentyEighth: return .oneTwentyEighth
        case .twoFiftySixth: return .twoFiftySixth
        }
    }

    func transformTimeSignature() -> _NoteDuration.TimeSignatureValue? {
        if let timeSignature = self.timeSignatureValue {
            switch timeSignature {
            case .whole: return .tsWhole
            case .half: return .tsHalf
            case .quarter: return .tsQuarter
            case .eighth: return .tsEighth
            case .sixteenth: return .tsSixteenth
            case .thirtySecond: return .tsThirtySecond
            case .sixtyFourth: return .tsSixtyFourth
            case .oneTwentyEighth: return .tsOneTwentyEighth
            }
        }
        return nil
    }

    func transform() -> _NoteDuration {
        var noteDuration = _NoteDuration()
        noteDuration.value = self.transformValue()
        noteDuration.dotCount = Int64(self.dotCount)
        if let timeSignature = self.transformTimeSignature() {
            noteDuration.timeSignatureValue = timeSignature
        }
        return noteDuration
    }
}

public enum NoteDurationTransformError: Error {
    case invalidSetOfParameters
}
