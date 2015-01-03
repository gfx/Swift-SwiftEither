Pod::Spec.new do |s|

  s.name         = "SwiftEither"
  s.version      = "0.0.1"
  s.summary      = "An error handling utility type Either<Success, Error>"

  s.description  = <<-DESC
                   Optional<T> sucks because of lack of erorr information.
                   SwiftEither.Either<Success, Error> likes Optional<T> but it is
                   able to have an error value if needed.
                   DESC

  s.homepage     = "https://github.com/gfx/Swift-SwiftEither"

  s.license      = "Apache License, Version 2.0"


  s.author             = { "FUJI Goro (gfx)" => "gfuji@cpan.org" }
  s.social_media_url   = "http://twitter.com/__gfx__"


  s.source       = { :git => "git@github.com:gfx/Swift-SwiftEither.git", :tag => s.version }


  s.source_files  = "SwiftEither/**/*.swift"

end

# vim: set ft=ruby:
