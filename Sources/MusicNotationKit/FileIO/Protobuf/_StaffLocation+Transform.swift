import MusicNotationCore

extension _StaffLocation {
    func transformType() -> StaffLocation.LocationType {
        switch self.type {
        case .line: return StaffLocation.LocationType.line
        default:    return StaffLocation.LocationType.space
        }
    }

    func transform() -> StaffLocation {
        return StaffLocation(type: self.transformType(), number: Int(self.number))
    }
}
