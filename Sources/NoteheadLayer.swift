//
//  NoteheadLayer.swift
//  MusicNotationKit
//
//  Created by Kyle Sherman on 4/15/17.
//
//

import MusicNotationCore
import CoreGraphics

public class NoteheadLayer: CAShapeLayer {
    private enum Constant {
        static let circleRadius: CGFloat = 6.0
        static let fillColor: UIColor = .black
    }

    public var size: CGSize {
        return CGSize(
            width: Constant.circleRadius * 2,
            height: Constant.circleRadius * 2)
    }
    public var staffLocation = StaffLocation(type: .line, number: 0) {
        didSet {
            setNeedsDisplay()
        }
    }

    private var yPosition: CGFloat {
        // TODO: Calculate based on staffLocation
        return 0.0
    }

    public override init() {
        super.init()
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        fillColor = Constant.fillColor.cgColor
    }

    public override func draw(in ctx: CGContext) {
        super.draw(in: ctx)

        path = UIBezierPath(ovalIn: CGRect(
            x: 0,
            y: yPosition, // TODO: fix this for staff location
            width: Constant.circleRadius * 2,
            height: Constant.circleRadius * 2)).cgPath
    }
}
