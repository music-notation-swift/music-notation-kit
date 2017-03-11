import MusicNotationCore

extension _Clef {
    func transform() -> Clef {
        return Clef(tone: self.tone.transform(), location: self.location.transform())
    }
}

extension Clef {
    func transform() -> _Clef {
        var clef = _Clef()
        clef.location = self.staffLocation.transform()
        if let tone = self.tone {
            clef.tone = tone.transform()
        }
        return clef
    }
}
