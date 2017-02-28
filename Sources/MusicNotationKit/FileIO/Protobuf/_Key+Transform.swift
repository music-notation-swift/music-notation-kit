import MusicNotationCore

extension _Key {
    func transform() -> Key {
        return Key(noteLetter: self.noteLetter.transform(), accidental: self.accidental.transform(), type: self.type.transform())
    }
}
