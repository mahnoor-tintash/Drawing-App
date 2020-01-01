//
//  PKCanvas.swift
//  Drawing App
//
//  Created by Mahnoor Khan on 01/01/2020.
//  Copyright © 2020 Mahnoor Khan. All rights reserved.
//

import UIKit
import PencilKit

class PKCanvas: UIView {
    var canvasView: PKCanvasView?
    weak var pencilKitDelegate: PencilKitDelegate?
        
    //MARK: - iOS Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        //1. Setup PencilKit Canvas
        setupPencilKitCanvas()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCanvasUI(frame: CGRect) {
       //2. Update PencilKit Orientation
    }
        
    func updateCanvasOrientation(with frame: CGRect) {
        //1. assign updated frame to canvas
        self.canvasView?.frame = frame
        //2.assign updated frame to self view
        self.frame = frame
    }
    
    private func setupPencilKitCanvas() {
        //1
        canvasView = PKCanvasView(frame:self.bounds)
        //2
        canvasView?.delegate = self
        //3
        canvasView?.alwaysBounceVertical = false
        //4
        canvasView?.allowsFingerDrawing = true
        //5
        canvasView?.becomeFirstResponder()
        //6
        guard let canvasView = canvasView else { return }
        addSubview(canvasView)
        //7
        if let window = UIApplication.shared.windows.last, let toolPicker = PKToolPicker.shared(for: window) {
            //8
            toolPicker.setVisible(true, forFirstResponder: canvasView)
            toolPicker.addObserver(canvasView)
            toolPicker.addObserver(self)
            canvasView.becomeFirstResponder()
        }
    }
}


// MARK: Canvas View Delegate
extension PKCanvas: PKCanvasViewDelegate {
    /// Delegate method: Note that the drawing has changed.
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        print("canvasViewDrawingDidChange")
    }
}

extension PKCanvas: PKToolPickerObserver {
    func toolPickerSelectedToolDidChange(_ toolPicker: PKToolPicker) {
        print("toolPickerSelectedToolDidChange")
    }
    
    func toolPickerIsRulerActiveDidChange(_ toolPicker: PKToolPicker) {
        print("toolPickerIsRulerActiveDidChange")
    }
    
    func toolPickerVisibilityDidChange(_ toolPicker: PKToolPicker) {
        print("toolPickerVisibilityDidChange")
    }
    
    func toolPickerFramesObscuredDidChange(_ toolPicker: PKToolPicker) {
        print("toolPickerFramesObscuredDidChange")
    }
}
