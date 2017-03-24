import MusicNotationCore

extension _StaffLocation {
    func transformType() -> StaffLocation.LocationType {
        switch type {
        case .line: return StaffLocation.LocationType.line
        default:    return StaffLocation.LocationType.space
        }
    }

    func transform() -> StaffLocation {
        return StaffLocation(type: transformType(), number: Int(number))
    }
}

extension StaffLocation {
    func transformType() -> _StaffLocation.LocationType {
        switch locationType {
        case StaffLocation.LocationType.line: return .line
        case StaffLocation.LocationType.space: return .space
        }
    }
    func transform() -> _StaffLocation {
        var staffLocation = _StaffLocation()
        staffLocation.type = transformType()
        staffLocation.number = Int32(number)
        return staffLocation
    }
}
