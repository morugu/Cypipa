
Pod::Spec.new do |s|
  s.name         = "Cypipa"
  s.version      = "0.0.1"
  s.summary      = "Check your public IP Address."

  s.description  = <<-DESC
                  Check your public IP address library for iOS.
                   DESC

  s.homepage     = "https://github.com/morugu/Cypipa"
  s.license      = "MIT"
  s.author       = { "Shoya" => "12c1055@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/morugu/Cypipa.git", :tag => '0.0.1' }

  s.source_files  = "Cypipa/*.h"
  # s.exclude_files = "Classes/Exclude"

  s.public_header_files = "Cypipa/*.{h,swift}"

end
