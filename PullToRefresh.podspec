Pod::Spec.new do |s|

  s.name         = "PullToRefresh"
  s.version      = "0.0.1"
  s.summary      = "A simple CollectionViewController with UIRefreshControl"
  s.description  = <<-DESC
  A simple CollectionViewController with UIRefreshControl for iOS.
  DESC

  s.homepage     = "https://github.com/hirohisa/PullToRefresh"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "Hirohisa Kawasaki" => "hirohisa.kawasaki@gmail.com" }

  s.source       = { :git => "https://github.com/hirohisa/PullToRefresh.git", :branch => 'master' }

  s.source_files = "PullToRefresh/*.swift"
  s.requires_arc = true
  s.ios.deployment_target = '8.0'

end
