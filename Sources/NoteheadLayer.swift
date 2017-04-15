//
//  NoteheadLayer.swift
//  MusicNotationKit
//
//  Created by Kyle Sherman on 4/15/17.
//
//

import CoreGraphics

public class NoteheadLayer: CAShapeLayer {
    private enum Constant {
        static let circleRadius: CGFloat = 6.0
        static let fillColor: UIColor = .black
    }

    public var startX: CGFloat = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }

    public var size: CGSize {
        return CGSize(
            width: Constant.circleRadius * 2,
            height: Constant.circleRadius * 2)
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
            x: startX,
            y: 0, // TODO: fix this for staff location
            width: Constant.circleRadius * 2,
            height: Constant.circleRadius * 2)).cgPath
    }
}
