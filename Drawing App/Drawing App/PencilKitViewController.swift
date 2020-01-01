//
//  PencilKitViewController.swift
//  Drawing App
//
//  Created by Mahnoor Khan on 01/01/2020.
//  Copyright © 2020 Mahnoor Khan. All rights reserved.
//

import UIKit

class PencilKitViewController: UIViewController {
    //1.
    var pencilKitCanvas =  PKCanvas()
    
    //MARK: - iOS Life Cycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //5.
        addPencilKit()
    }
    
    override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
          //4.
          updateCanvasOrientation(with: view.bounds)
      }
    
    //MARK: - iOS override properties
    override var prefersHomeIndicatorAutoHidden: Bool {
          return true
      }
    
    override var prefersStatusBarHidden: Bool {
        return true;
    }
    
    //MARK: -  Setup Functions
   //3.
    private func addPencilKit() {
       view.backgroundColor = .clear
        
       pencilKitCanvas  = createPencilKitCanvas(frame: view.frame, delegate: self)
       view.addSubview(pencilKitCanvas)
    }
}
//2.
extension PencilKitViewController: PencilKitInterface {}

extension PencilKitViewController: PencilKitDelegate {}
