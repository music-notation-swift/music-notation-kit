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

extension _KeyType {
    func transform() -> KeyType {
        switch self {
        case .major: return KeyType.major
        case .minor: return KeyType.minor
        default: return KeyType.major
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
