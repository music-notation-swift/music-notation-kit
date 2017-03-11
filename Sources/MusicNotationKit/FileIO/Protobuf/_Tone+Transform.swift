import MusicNotationCore

extension _Tone {
    func transform() -> Tone {
        return Tone(
            noteLetter: self.noteLetter.transform(),
            accidental: self.accidental.transform(),
            octave: self.octave.transform())
    }
}

extension Tone {
    func transform() -> _Tone {
        var tone = _Tone()
        tone.noteLetter = self.noteLetter.transform()
        tone.accidental = self.accidental.transform()
        tone.octave = self.octave.transform()
        return tone
    }
}
