import MusicNotationCore


extension _Staff {
    func transform() throws -> Staff {
        if let instrument = instrument.transform() {
            return Staff(clef: clef.transform(), instrument: instrument)
        }
        throw StaffTransformError.invalidSetOfParameters
    }
}

extension Staff {
    func transform() -> _Staff {
        var staff = _Staff()
        staff.clef = clef.transform()
        staff.instrument = instrument.transform()
        return staff
    }
}

public enum StaffTransformError: Error {
    case invalidSetOfParameters
}
