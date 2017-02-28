import MusicNotationCore

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
