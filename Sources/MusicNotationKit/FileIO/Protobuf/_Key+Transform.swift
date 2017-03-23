import MusicNotationCore

extension _Key {
    func transform() -> Key {
        return Key(
            noteLetter: self.noteLetter.transform(),
            accidental: self.accidental.transform(),
            type: self.type.transform())
    }
}

extension Key {
    func transform() -> _Key {
        var key = _Key()
        key.noteLetter = self.noteLetter.transform()
        key.accidental = self.accidental.transform()
        key.type = self.type.transform()
        return key
    }
}
