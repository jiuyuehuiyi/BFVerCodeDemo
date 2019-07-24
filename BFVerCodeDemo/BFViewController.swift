//
//  BFViewController.swift
//  BFVerCodeDemo
//
//  Created by 邓伟浩 on 2019/1/24.
//  Copyright © 2019 邓伟浩. All rights reserved.
//

import UIKit

class BFViewController: UIViewController {

    @IBOutlet weak var this: BFVerCodeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let verCodeView = BFVerCodeView.init(frame: CGRect(x: 100, y: 100, width: 160, height: 70))
        self.view.addSubview(verCodeView)
        verCodeView.block = { (imageCodeStr: String) -> Void in
            NSLog("imageCodeStr = %@", imageCodeStr)
        }
        verCodeView.freshVerCodeBy("BBMDT")
        
        this.block = { (imageCodeStr: String) -> Void in
            NSLog("imageCodeStr = %@", imageCodeStr)
        }
        this.codeCount = 6
        this.isRotation = true
        this.freshVerCode()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        this.freshVerCode()
    }
}

