

Pod::Spec.new do |spec|

  spec.name           = "BFVerCodeView"
  spec.version        = "0.0.4"
  spec.summary        = "一个可刷新的验证码显示控件."
  spec.description    = <<-DESC
类似图片验证码，可定义验证码个数和指定刷新字符
                   DESC

  spec.homepage       = "https://github.com/jiuyuehuiyi/BFVerCodeDemo.git"
  spec.license        = { :type => "MIT", :file => "LICENSE" }

  spec.author         = { "踏歌长行" => "1031484446@qq.com" }
  spec.platform       = :ios, "8.0"
  spec.swift_version  = "4.0"
  spec.source         = { :git => "https://github.com/jiuyuehuiyi/BFVerCodeDemo.git", :tag => "#{spec.version}" }
  spec.source_files   = "BFVerCodeDemo/BFVerCodeView"

end
