import MusicNotationCore

extension _Clef {
    func transform() -> Clef {
        return Clef(tone: self.tone.transform(), location: self.location.transform())
    }
}
