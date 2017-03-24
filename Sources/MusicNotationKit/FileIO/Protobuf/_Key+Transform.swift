import MusicNotationCore

extension _Key {
    func transform() -> Key {
        return Key(
            noteLetter: noteLetter.transform(),
            accidental: accidental.transform(),
            type: type.transform())
    }
}

extension Key {
    func transform() -> _Key {
        var key = _Key()
        key.noteLetter = noteLetter.transform()
        key.accidental = accidental.transform()
        key.type = type.transform()
        return key
    }
}
