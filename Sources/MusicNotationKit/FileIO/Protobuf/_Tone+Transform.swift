import MusicNotationCore

extension _Tone {
    func transform() -> Tone {
        return Tone(
            noteLetter: self.noteLetter.transform(),
            accidental: self.accidental.transform(),
            octave: self.octave.transform())
    }
}
