import MusicNotationCore

extension _TimeSignature {
    func transform() -> TimeSignature {
        return TimeSignature(
            topNumber: Int(self.topNumber),
            bottomNumber: Int(self.bottomNumber),
            tempo: Int(self.tempo))
    }
}

extension TimeSignature {
    func transform() -> _TimeSignature {
        var ts = _TimeSignature()
        ts.topNumber = Int64(self.topNumber)
        ts.bottomNumber = Int64(self.bottomNumber)
        ts.tempo = Int64(self.tempo)
        return ts
    }
}
