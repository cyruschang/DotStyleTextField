Pod::Spec.new do |s| 
s.name = "DotStyleTextField" 
s.version = "0.0.1"
s.summary = "密码输入框" 
s.description = "小圆点形式的密码输入框" 
s.homepage = "https://github.com/cyruschang/DotStyleTextField" 
s.license = { :type => 'MIT', :file => 'LICENSE' } 
s.author = { "ChangLuyang" => "chang_luyang@qq.com" } 
s.platform = :ios, '8.0'
s.source = { :git => "https://github.com/cyruschang/DotStyleTextField.git", :tag => "v#{s.version}" } 
s.source_files = 'DotStyleTextField/DotStyleTextField/*.{h,m}' 
s.requires_arc = true 
s.framework = "UIKit"
end
