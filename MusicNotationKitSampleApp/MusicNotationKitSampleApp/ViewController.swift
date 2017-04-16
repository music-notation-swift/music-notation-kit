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
                    Note(noteDuration: .quarter, tone: Tone(noteLetter: .f, octave: .octave4)),
                    Note(noteDuration: .quarter, tone: Tone(noteLetter: .f, octave: .octave4))
                ]
            ]
        ))
        staff.appendMeasure(Measure(
            timeSignature: timeSignature,
            notes: [
                [
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
