//
//  StaffRenderer.swift
//  MusicNotationKit
//
//  Created by Kyle Sherman on 4/15/17.
//
//

import MusicNotationCore
import CoreGraphics

public class StaffRenderer {

    enum Constant {
        // TODO: Calculate based on noteDuration/ticks/scaleFactor
        static let spaceBetweenNotes: CGFloat = 20.0
    }

    let staff: Staff

    public init(staff: Staff) {
        self.staff = staff
    }

    public func render(on view: UIView) {
        let staffLayer = StaffLayer()
        staffLayer.frame = view.bounds
        staffLayer.numberOfLines = 5

        view.layer.addSublayer(staffLayer)

        var currentX: CGFloat = 0.0

        let barLineLayer = BarLineLayer()
        barLineLayer.barLineType = .single
        barLineLayer.frame = CGRect(origin: .zero, size: barLineLayer.size)
        view.layer.addSublayer(barLineLayer)
        currentX += barLineLayer.size.width
        currentX += Constant.spaceBetweenNotes

        for notesHolder in staff {
            switch notesHolder {
            case let measure as Measure:
                renderMeasure(measure, on: view, currentX: &currentX)
            case let measureRepeat as MeasureRepeat:
                renderMeasureRepeat(measureRepeat, on: view, currentX: &currentX)
            default:
                assertionFailure()
            }
        }
    }

    private func renderMeasure(_ measure: Measure, on view: UIView, currentX: inout CGFloat) {
        for measureSlices in measure {
            // TODO: work with multiple notes in a slice
            guard let firstSlice = measureSlices.first else {
                fatalError("No slices")
            }
            switch firstSlice.noteCollection {
            case _ as Note:
                let noteHeadLayer = NoteheadLayer()
                noteHeadLayer.frame = CGRect(
                    origin: CGPoint(x: currentX, y: 0),
                    size: noteHeadLayer.size)
                noteHeadLayer.setNeedsDisplay()
                view.layer.addSublayer(noteHeadLayer)
                currentX += (noteHeadLayer.size.width + Constant.spaceBetweenNotes)
            case _ as Tuplet: break
            default:
                assertionFailure("No other types")
            }
        }
        // draw last bar line
        let endBarLineLayer = BarLineLayer()
        endBarLineLayer.barLineType = .single
        endBarLineLayer.frame = CGRect(
            origin: CGPoint(x: currentX, y: 0),
            size: endBarLineLayer.size)
        view.layer.addSublayer(endBarLineLayer)
        currentX += endBarLineLayer.size.width
        currentX += Constant.spaceBetweenNotes
    }

    private func renderMeasureRepeat(_ measureRepeat: MeasureRepeat, on view: UIView, currentX: inout CGFloat) {
        // TODO: Implement this
    }
}
