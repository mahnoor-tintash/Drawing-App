//
//  PencilKitViewController.swift
//  Drawing App
//
//  Created by Mahnoor Khan on 01/01/2020.
//  Copyright © 2020 Mahnoor Khan. All rights reserved.
//

import UIKit
import PencilKit

class PencilKitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let canvas = PKCanvasView(frame: view.bounds)
        view.addSubview(canvas)
        canvas.tool = PKInkingTool(.pen, color: .black, width: 15)
    }
}
