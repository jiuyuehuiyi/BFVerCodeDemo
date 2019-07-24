//
//  BFVerCodeView.swift
//  BFVerCodeDemo
//
//  Created by 邓伟浩 on 2019/1/24.
//  Copyright © 2019 邓伟浩. All rights reserved.
//

import UIKit

typealias BFCodeImageBlock = (String) -> Void

class BFVerCodeView: UIView {
    
    private let ARC4RAND_MAX: Int64 = Int64(0x100000000)
    
    /** 显示的验证字符 */
    var imageCodeStr: String = ""
    
    /** 验证码字符个数, 默认4个, 需要在freshVerCode函数调用之前设置 */
    var codeCount: Int = 4
    
    /** 字符是否旋转, 默认旋转 */
    var isRotation: Bool = true
    
    var block: BFCodeImageBlock?
    
    let textArray = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    var bgView: UIView?
    
    func freshVerCode() {
        self.changeCodeStr()
        self.initImageCodeView()
    }
    
    func freshVerCodeBy(_ codeStr : String) {
        self.imageCodeStr = codeStr
        self.initImageCodeView()
    }
    
    private func changeCodeStr() {
        imageCodeStr = ""
        for _ in 0..<codeCount {
            let index = arc4random() % UInt32(self.textArray.count - 1)
            let oneText = self.textArray[Int(index)]
            self.imageCodeStr = self.imageCodeStr + oneText
        }
        if self.block != nil {
            self.block!(self.imageCodeStr)
        }
    }
    
    private func initImageCodeView() {
        if bgView != nil {
            bgView!.removeFromSuperview()
        }
        bgView = UIView.init(frame: self.bounds)
        self.addSubview(bgView!)
        bgView?.backgroundColor = self.getRandomBgColorWith(alpha: 0.5)
        let textSize = "W".size(withAttributes: [.font: UIFont.systemFont(ofSize: 20)])
        let randWidth = UInt32(self.frame.size.width / CGFloat(self.imageCodeStr.count) - textSize.width)
        let randHeight = UInt32(self.frame.size.height - textSize.height)
        
        for (i, value) in self.imageCodeStr.enumerated() {
            let px = CGFloat(arc4random()%randWidth) + CGFloat(i)*(self.frame.size.width-3)/CGFloat(self.imageCodeStr.count)
            let py = CGFloat(arc4random()%randHeight)
            let label = UILabel(frame: CGRect(x: px+3, y: py, width: textSize.width, height: textSize.height))
            label.text = String(value)
            label.font = UIFont.systemFont(ofSize: 20)
            if self.isRotation {
                let t = CGFloat(arc4random())
                let b = CGFloat(ARC4RAND_MAX)
                var r = t / b * 2 - 1.0 //随机-1到1
                if r > 0.3 {
                    r = 0.3
                } else if r < -0.3 {
                    r = -0.3
                }
                label.transform = CGAffineTransform(rotationAngle: r)
            }
            bgView!.addSubview(label)
            
        }
        
        for _ in 0..<10 {
            let path = UIBezierPath()
            let pX = arc4random() % UInt32(self.frame.width)
            let pY = arc4random() % UInt32(self.frame.height)
            path.move(to: CGPoint(x: CGFloat(pX), y: CGFloat(pY)))
            let ptX = arc4random() % UInt32(self.frame.width)
            let ptY = arc4random() % UInt32(self.frame.height)
            path.addLine(to: CGPoint(x: CGFloat(ptX), y: CGFloat(ptY)))
            
            let layer = CAShapeLayer()
            layer.strokeColor = self.getRandomBgColorWith(alpha: 0.2).cgColor //layer的边框色
            layer.lineWidth = 1.0
            layer.strokeEnd = 1
            layer.fillColor = UIColor.clear.cgColor
            layer.path = path.cgPath
            bgView!.layer.addSublayer(layer)
        }
    }
    
    func getRandomBgColorWith(alpha: CGFloat) -> UIColor {
        let red = CGFloat(arc4random() % 100) / 100.0
        let green = CGFloat(arc4random() % 100) / 100.0
        let blue = CGFloat(arc4random() % 100) / 100.0
        let color = UIColor.init(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }

}
