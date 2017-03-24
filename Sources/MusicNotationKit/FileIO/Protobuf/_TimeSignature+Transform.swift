import MusicNotationCore

extension _TimeSignature {
    func transform() -> TimeSignature {
        return TimeSignature(
            topNumber: Int(topNumber),
            bottomNumber: Int(bottomNumber),
            tempo: Int(tempo))
    }
}

extension TimeSignature {
    func transform() -> _TimeSignature {
        var ts = _TimeSignature()
        ts.topNumber = Int64(topNumber)
        ts.bottomNumber = Int64(bottomNumber)
        ts.tempo = Int64(tempo)
        return ts
    }
}
