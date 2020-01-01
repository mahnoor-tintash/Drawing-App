//
//  PencilKitDelegate.swift
//  Drawing App
//
//  Created by Mahnoor Khan on 01/01/2020.
//  Copyright © 2020 Mahnoor Khan. All rights reserved.
//

import Foundation

import UIKit

protocol PencilKitDelegate: class {
    func snapshot(from canvas: PKCanvas) -> UIImage
}

extension PencilKitDelegate {
    
    func snapshot(from canvas: PKCanvas) -> UIImage {
        //Take PencilKit Drawings snapshot
        return UIImage()
    }
}

protocol PencilKitInterface: NSObject {
    var pencilKitCanvas: PKCanvas { get set }
    func createPencilKitCanvas(frame: CGRect, delegate: PencilKitDelegate) -> PKCanvas
    func updateCanvasOrientation(with frame: CGRect)
}

extension PencilKitInterface {
    func createPencilKitCanvas(frame: CGRect, delegate: PencilKitDelegate) -> PKCanvas {
      //1. Assign PKCanvas to our interface property
      pencilKitCanvas = PKCanvas(frame: frame)
      //2. Connect the delegates
      pencilKitCanvas.pencilKitDelegate = delegate
      //3.
      return pencilKitCanvas
    }
    
    func updateCanvasOrientation(with frame: CGRect) {
        //1.
        pencilKitCanvas.updateCanvasOrientation(with: frame)
    }
}
