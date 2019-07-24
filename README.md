# 使用[BFVerCodeView](http://cocoapods.org/pods/BFVerCodeView)

## 初始化

```
    let verCodeView = BFVerCodeView.init(frame: CGRect(x: 100, y: 100, width: 160, height: 70))
    self.view.addSubview(verCodeView)
    verCodeView.block = { (imageCodeStr: String) -> Void in
        NSLog("imageCodeStr = %@", imageCodeStr)
    }
```

## 刷新随机验证码

```
    verCodeView.freshVerCode()
```

## 刷新指定验证码

```
    verCodeView.freshVerCodeBy("BBMDT")
```

## 其他属性

```
    verCodeView.codeCount = 6 // 验证码字符个数
    verCodeView.isRotation = false // 是否旋转
```
