//
//  ViewController.swift
//  MusicNotationKitSampleApp
//
//  Created by Kyle Sherman on 3/26/17.
//  Copyright © 2017 Kyle Sherman. All rights reserved.
//

import UIKit
import MusicNotationKitiOS
import MusicNotationCore
import SpriteKit

class ViewController: UIViewController {

    let newView = TestView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        newView.translatesAutoresizingMaskIntoConstraints = false
        newView.backgroundColor = .orange
        newView.contentMode = .redraw
        view.addSubview(newView)
        newView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        newView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        newView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        newView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let staff = createStaffModel()
        let staffRenderer = StaffRenderer(staff: staff)
        staffRenderer.render(on: newView)
    }

    func createStaffModel() -> Staff {
        var staff = Staff(clef: .treble, instrument: .guitar6)
        let timeSignature = TimeSignature(topNumber: 4, bottomNumber: 4, tempo: 120)
        staff.appendMeasure(Measure(
            timeSignature: timeSignature,
            notes: [
                [
                    Note(noteDuration: .quarter, tone: Tone(noteLetter: .f, octave: .octave4)),
                    Note(noteDuration: .quarter, tone: Tone(noteLetter: .f, octave: .octave4)),
                    Note(noteDuration: .quarter, tone: Tone(noteLetter: .f, octave: .octave4))
                ]
            ]
        ))
        return staff
    }
}

class TestView: UIView {
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
        // TODO: This doesn't get called on bounds change even if redraw is set
        layer.sublayers?.forEach { $0.setNeedsDisplay() }
    }
}

class StaffRenderer {

    enum Constant {
        static let spaceBetweenNotes: CGFloat = 10.0
    }

    let staff: Staff

    init(staff: Staff) {
        self.staff = staff
    }

    func render(on view: UIView) {
        let staffLayer = StaffLayer()
        staffLayer.frame = view.bounds
        staffLayer.numberOfLines = 5

        view.layer.addSublayer(staffLayer)

        var currentX: CGFloat = 0.0

        let barLineLayer = BarLineLayer()
        barLineLayer.startX = currentX
        barLineLayer.barLineType = .single
        barLineLayer.frame = CGRect(origin: .zero, size: barLineLayer.size)
        view.layer.addSublayer(barLineLayer)
        currentX += barLineLayer.size.width
        currentX += Constant.spaceBetweenNotes

        for notesHolder in staff {
            switch notesHolder {
            case let measure as Measure:
                currentX = renderMeasure(measure, on: view, startX: currentX)
                print("measure: \(measure)")
            case let measureRepeat as MeasureRepeat:
                print("not done: \(measureRepeat)")
            default:
                assertionFailure()
            }
        }
    }

    func renderMeasure(_ measure: Measure, on view: UIView, startX: CGFloat) -> CGFloat {
        var currentX = startX

        for measureSlices in measure {
            // TODO: work with multiple notes in a slice
            guard let firstSlice = measureSlices.first else {
                fatalError("No slices")
            }
            switch firstSlice.noteCollection {
            case _ as Note:
                let noteHeadLayer = NoteheadLayer()
                noteHeadLayer.startX = currentX
                noteHeadLayer.frame = CGRect(
                    origin: CGPoint(x: currentX, y: 0),
                    size: noteHeadLayer.size)
                view.layer.addSublayer(noteHeadLayer)
                currentX += noteHeadLayer.size.width + Constant.spaceBetweenNotes
            case _ as Tuplet: break
            default:
                assertionFailure("No other types")
            }
        }
        // draw last bar line
        let endBarLineLayer = BarLineLayer()
        endBarLineLayer.startX = currentX
        endBarLineLayer.barLineType = .single
        endBarLineLayer.frame = CGRect(
            origin: CGPoint(x: currentX, y: 0),
            size: endBarLineLayer.size)
        view.layer.addSublayer(endBarLineLayer)
        currentX += endBarLineLayer.size.width
        currentX += Constant.spaceBetweenNotes
        return currentX
    }

    func createBarLineLayer() -> CAShapeLayer {
        return BarLineLayer()
    }
}
