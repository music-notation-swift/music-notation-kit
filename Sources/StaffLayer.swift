import CoreGraphics

public class StaffLayer: CAShapeLayer {

    public var numberOfLines: Int = 5 {
        didSet {
            setNeedsDisplay()
        }
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
        fillColor = nil
        lineWidth = GlobalConstant.staffLineWidth
        strokeColor = GlobalConstant.lineColor.cgColor
    }

    public override func draw(in ctx: CGContext) {
        super.draw(in: ctx)

        let linePaths = (0..<numberOfLines).map { _ in UIBezierPath() }
        linePaths.enumerated().forEach { (index, path) in path.move(to: CGPoint(x: 0, y: GlobalConstant.staffLineSpacing * CGFloat(index))) }
        linePaths.forEach { $0.addLine(to: CGPoint(x: bounds.width, y: $0.currentPoint.y)) }
        let staffPath = UIBezierPath()
        linePaths.forEach { staffPath.append($0) }

        path = staffPath.cgPath
    }
}
