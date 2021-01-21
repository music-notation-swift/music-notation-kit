//
//  BarLineLayer.swift
//  MusicNotationKit
//
//  Created by Kyle Sherman on 4/8/17.
//
//

import CoreGraphics

public class BarLineLayer: CAShapeLayer {

    private enum Constant {
        static let barLineWidth: CGFloat = GlobalConstant.staffLineWidth
        static let spaceBetweenLines: CGFloat = 4.0
        static let verticalSpaceBetweenCircles: CGFloat = GlobalConstant.staffLineSpacing / 2.0
        static let horizontalSpaceAfterCircles: CGFloat = Constant.verticalSpaceBetweenCircles / 2.0
        static let circleRadius: CGFloat = 2.0
        static let dashPattern: [NSNumber] = [6]
    }

    // Source: http://www.treblis.com/notation/bar.html
    public enum LineType {
        case single
        case doubleLine
        case doubleBarLine
        case dashed
        case startRepeat
        case endRepeat
    }

    public var numberOfStaffLines: Int = 5 {
        didSet {
            setNeedsDisplay()
        }
    }
    public var barLineType: LineType = .single {
        didSet {
            setNeedsDisplay()
        }
    }
    public var size: CGSize {
        return BarLineLayer.size(
            forLineType: barLineType,
            numberOfStaffLines: numberOfStaffLines)
    }

    public override init() {
        super.init()
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    public static func size(forLineType lineType: LineType,
                            numberOfStaffLines: Int = 5) -> CGSize {
        let height = staffHeight(forNumberOfLines: numberOfStaffLines)
        switch lineType {
        case .single, .dashed:
            return CGSize(
                width: Constant.barLineWidth,
                height: height)
        case .doubleLine:
            return CGSize(
                width: Constant.barLineWidth * 2 + Constant.spaceBetweenLines,
                height: height)
        case .doubleBarLine:
            return CGSize(
                width: Constant.barLineWidth * 4 + Constant.spaceBetweenLines,
                height: height)
        case .startRepeat, .endRepeat:
            return CGSize(
                width: (Constant.barLineWidth * 4) + Constant.spaceBetweenLines
                + Constant.horizontalSpaceAfterCircles + (Constant.circleRadius * 2),
                height: height)
        }
    }

    private func setup() {
        fillColor = GlobalConstant.lineColor.cgColor
        lineWidth = Constant.barLineWidth
        strokeColor = GlobalConstant.lineColor.cgColor
    }

    public override func draw(in ctx: CGContext) {
        super.draw(in: ctx)

        let endY: CGFloat = BarLineLayer.staffHeight(forNumberOfLines: numberOfStaffLines)
        let linePaths: [UIBezierPath]
        let otherShapes: [UIBezierPath]
        let allShapesPath = UIBezierPath()

        switch barLineType {
        case .single:
            let linePath = UIBezierPath()
            linePath.move(to: CGPoint(x: lineWidth / 2, y: 0))
            linePaths = [linePath]
            otherShapes = []
        case .doubleLine:
            let line1Path = UIBezierPath()
            let line2Path = UIBezierPath()
            line1Path.move(to: CGPoint(x: lineWidth / 2, y: 0))
            line2Path.move(to: CGPoint(x: Constant.spaceBetweenLines + lineWidth + lineWidth / 2, y: 0))
            linePaths = [line1Path, line2Path]
            otherShapes = []
        case .doubleBarLine:
            linePaths = BarLineLayer.startDoubleBarLinePaths(
                startingAt: 0,
                lineWidth: lineWidth)
            otherShapes = []
        case .dashed:
            lineDashPattern = Constant.dashPattern
            let linePath = UIBezierPath()
            linePath.move(to: CGPoint(x: lineWidth / 2, y: 0))
            linePaths = [linePath]
            otherShapes = []
        case .endRepeat:
            let middleY = endY / 2
            // Need to draw 2 dots in the center with spacing
            let fullSpace = Constant.circleRadius * 4 + Constant.verticalSpaceBetweenCircles
            let top = middleY - fullSpace / 2
            let circle1 = UIBezierPath(ovalIn: CGRect(
                x: lineWidth,
                y: top,
                width: Constant.circleRadius * 2,
                height: Constant.circleRadius * 2))
            let circle2 = UIBezierPath(ovalIn: CGRect(
                x: lineWidth,
                y: top + Constant.circleRadius * 2 + Constant.verticalSpaceBetweenCircles,
                width: Constant.circleRadius * 2,
                height: Constant.circleRadius * 2))
            otherShapes = [circle1, circle2]
            linePaths = BarLineLayer.startDoubleBarLinePaths(
                startingAt: Constant.circleRadius * 2 + Constant.horizontalSpaceAfterCircles,
                lineWidth: lineWidth)
        case .startRepeat:
            let middleY = endY / 2
            // Need to draw 2 dots in the center with spacing
            let fullSpace = Constant.circleRadius * 4 + Constant.verticalSpaceBetweenCircles
            let top = middleY - fullSpace / 2
            // FIXME: Circles are not positioned properly in x direction
            let circle1 = UIBezierPath(ovalIn: CGRect(
                x: BarLineLayer.size(forLineType: .doubleBarLine).width,
                y: top,
                width: Constant.circleRadius * 2,
                height: Constant.circleRadius * 2))
            let circle2 = UIBezierPath(ovalIn: CGRect(
                x: BarLineLayer.size(forLineType: .doubleBarLine).width,
                y: top + Constant.circleRadius * 2 + Constant.verticalSpaceBetweenCircles,
                width: Constant.circleRadius * 2,
                height: Constant.circleRadius * 2))
            otherShapes = [circle1, circle2]
            linePaths = BarLineLayer.startDoubleBarLinePaths(
                startingAt: 0,
                lineWidth: lineWidth)
            // Mirror the double bar line
            linePaths.forEach { linePath in
                let mirrorOverXOrigin = CGAffineTransform(scaleX: -1.0, y: 1.0)
                let translate = CGAffineTransform(translationX: bounds.width, y: 0)
                linePath.apply(mirrorOverXOrigin)
                linePath.apply(translate)
            }
        }

        // draw lines
        linePaths.forEach { linePath in
            linePath.addLine(to: CGPoint(x: linePath.currentPoint.x, y: endY))
        }

        if linePaths.count > 1 || otherShapes.count > 1 {
            linePaths.forEach { allShapesPath.append($0) }
            otherShapes.forEach { allShapesPath.append($0) }
            path = allShapesPath.cgPath
        } else if let firstPath = linePaths.first {
            path = firstPath.cgPath
        } else {
            // No lines to draw
            print("Error. No lines to draw")
        }
    }

    private static func startDoubleBarLinePaths(
        startingAt startX: CGFloat,
        lineWidth: CGFloat) -> [UIBezierPath] {
        let line1Path = UIBezierPath()
        let line2Path = UIBezierPath()
        let line3Path = UIBezierPath()
        let line4Path = UIBezierPath()
        line1Path.move(to: CGPoint(x: startX + lineWidth / 2, y: 0))
        let line2Start = startX + lineWidth + Constant.spaceBetweenLines + (lineWidth / 2)
        line2Path.move(to: CGPoint(
            x: line2Start,
            y: 0))
        line3Path.move(to: CGPoint(
            x: line2Start + lineWidth,
            y: 0))
        line4Path.move(to: CGPoint(
            x: line2Start + 2 * lineWidth,
            y: 0))
        return [line1Path, line2Path, line3Path, line4Path]
    }

    private static func staffHeight(forNumberOfLines numberOfLines: Int) -> CGFloat {
        return GlobalConstant.staffLineSpacing *
            CGFloat(numberOfLines - 1) +
            GlobalConstant.staffLineWidth / 2
    }
}
