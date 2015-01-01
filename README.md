# SwiftEither [![Build Status](https://travis-ci.org/gfx/Swift-SwiftEither.svg?branch=master)](https://travis-ci.org/gfx/Swift-SwiftEither)

An Either pattern implementation in Swift

# SYNOPSIS

```swift
import SwiftEither

// 1. basic use
let x = success("foo")
// x represents either success:String or failure:Error
switch x {
case .Success(let s):
    println(s.value) // "foo"
case .Failure(let f):
    println(f.value.reason) // not reached
}

// 2. Either chaining, just like to optional chaining
success("success").chain({ (m) -> Either<String, Error> in
    return success("chained")
}) // "chained"

failure("error!").chain({ (m) -> Either<String, Error> in
    return Either(success: "chained")
}) // "error!"

// 3. Fallback operation, just like to null coalescing operator
success("success").fallback({ () -> Either<String, Error> in
    return success("chained")
}) // "success"

failure("error!").fallback({ () -> Either<String, Error> in
    return Either(success: "fallback")
}) // "fallback"

// fallback operator
failure("error!") ?? success("fallback") // Either(success:"fallback")
failure("error!") ?? "fallback" // Either(success:"fallback")
```

# DESCRIPTION

This is a proof-of-concept of an ideal error handling in Swift.

# AUTHOR

Fuji, Goro (gfx) gfuji@cpan.org

# LICENSE

The Apache 2.0 License
