import MusicNotationCore

extension _Clef {
    func transform() -> Clef {
        return Clef(tone: tone.transform(), location: location.transform())
    }
}

extension Clef {
    func transform() -> _Clef {
        var clef = _Clef()
        clef.location = staffLocation.transform()
        if let tone = tone {
            clef.tone = tone.transform()
        }
        return clef
    }
}
