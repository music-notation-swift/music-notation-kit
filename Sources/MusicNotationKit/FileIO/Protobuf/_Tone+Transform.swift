import MusicNotationCore

extension _Tone {
    func transform() -> Tone {
        return Tone(
            noteLetter: noteLetter.transform(),
            accidental: accidental.transform(),
            octave: octave.transform())
    }
}

extension Tone {
    func transform() -> _Tone {
        var tone = _Tone()
        tone.noteLetter = noteLetter.transform()
        tone.accidental = accidental.transform()
        tone.octave = octave.transform()
        return tone
    }
}
