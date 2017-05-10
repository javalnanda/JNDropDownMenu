Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '9.0'
s.name = "JNDropDownMenu"
s.summary = "JNDropDownMenu lets a user to add dropdown tableview menu"
s.requires_arc = true

# 2
s.version = "0.1.5"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4
s.author = { "Javal Nanda" => "javalnanda@gmail.com" }

# 5 - Replace this URL with your own Github page's URL (from the address bar)
s.homepage = "https://github.com/javalnanda/JNDropDownMenu"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/javalnanda/JNDropDownMenu.git", :tag => "#{s.version}"}

# 7
s.framework = "UIKit"

# 8
s.source_files = "JNDropDownMenu/**/*.{swift}"

end
