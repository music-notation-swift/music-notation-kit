import MusicNotationCore

extension _Octave {
    func transform() -> Octave {
        switch self {
        case .negative1: return Octave.octaveNegative1
        case .oct0: return Octave.octave0
        case .oct1: return Octave.octave1
        case .oct2: return Octave.octave2
        case .oct3: return Octave.octave3
        case .oct4: return Octave.octave4
        case .oct5: return Octave.octave5
        case .oct6: return Octave.octave6
        case .oct7: return Octave.octave7
        case .oct8: return Octave.octave8
        case .oct9: return Octave.octave9
        default: return Octave.octave0
        }
    }
}

extension Octave {
    func transform() -> _Octave {
        switch self {
        case Octave.octaveNegative1: return .negative1
        case Octave.octave0: return .oct0
        case Octave.octave1: return .oct1
        case Octave.octave2: return .oct2
        case Octave.octave3: return .oct3
        case Octave.octave4: return .oct4
        case Octave.octave5: return .oct5
        case Octave.octave6: return .oct6
        case Octave.octave7: return .oct7
        case Octave.octave8: return .oct8
        case Octave.octave9: return .oct9
        }
    }
}

extension _NoteLetter {
    func transform() -> NoteLetter {
        switch self {
        case .c: return NoteLetter.c
        case .d: return NoteLetter.d
        case .e: return NoteLetter.e
        case .f: return NoteLetter.f
        case .g: return NoteLetter.g
        case .a: return NoteLetter.a
        case .b: return NoteLetter.b
        default: return NoteLetter.c
        }
    }
}

extension NoteLetter {
    func transform() -> _NoteLetter {
        switch self {
        case NoteLetter.c: return .c
        case NoteLetter.d: return .d
        case NoteLetter.e: return .e
        case NoteLetter.f: return .f
        case NoteLetter.g: return .g
        case NoteLetter.a: return .a
        case NoteLetter.b: return .b
        }
    }
}

extension _KeyType {
    func transform() -> KeyType {
        switch self {
        case .major: return .major
        case .minor: return .minor
        default: return .major
        }
    }
}

extension KeyType {
    func transform() -> _KeyType {
        switch self {
        case .major: return .major
        case .minor: return .minor
        }
    }
}

extension _Accidental {
    func transform() -> Accidental {
        switch self {
        case .sharp: return Accidental.sharp
        case .doubleSharp: return Accidental.doubleSharp
        case .flat: return Accidental.flat
        case .doubleFlat: return Accidental.doubleFlat
        case .natural: return Accidental.natural
        default: return Accidental.natural
        }
    }
}

extension Accidental {
    func transform() -> _Accidental {
        switch self {
        case Accidental.sharp: return .sharp
        case Accidental.doubleSharp: return .doubleSharp
        case Accidental.flat: return .flat
        case Accidental.doubleFlat: return .doubleFlat
        case Accidental.natural: return .natural
        }
    }
}
