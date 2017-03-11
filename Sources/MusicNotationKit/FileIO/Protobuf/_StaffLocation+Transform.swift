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

extension StaffLocation {
    func transformType() -> _StaffLocation.LocationType {
        switch self.locationType {
        case StaffLocation.LocationType.line: return .line
        case StaffLocation.LocationType.space: return .space
        }
    }
    func transform() -> _StaffLocation {
        var staffLocation = _StaffLocation()
        staffLocation.type = self.transformType()
        staffLocation.number = Int32(self.number)
        return staffLocation
    }
}
