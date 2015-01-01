//
//  SwiftEitherTests.swift
//  SwiftEitherTests
//
//  Created by Fuji Goro on 2014/12/31.
//  Copyright (c) 2014年 FUJI Goro. All rights reserved.
//

import UIKit
import XCTest

import SwiftEither

struct Error {
    var reason: String
}

class SwiftEitherTests: XCTestCase {

    func try(success: Bool, _ message: String) -> Either<String, Error> {
        return success ? Either<String, Error>(success: message) : Either<String, Error>(failure: Error(reason: message))
    }

    func testExample() {
        let result = try(false, "a") ?? try(false, "b") ?? try(true, "c")

        switch result {
        case .Success(let l):
            XCTAssertEqual(l.value, "c")
        case .Failure(let r):
            XCTAssert(false, "not reached")
        }
    }


    func testLeft() {
        let e = Either<String, Error>(success: "foo")

        switch e {
        case .Success(let l):
            XCTAssertEqual(l.value, "foo")
        case .Failure(let r):
            XCTAssert(false, "not reached")
        }
    }

    func testRight() {
        let e = Either<String, Error>(failure: Error(reason: "foo"))

        switch e {
        case .Success(let l):
            XCTAssert(false, "not reached")
        case .Failure(let r):
            XCTAssertEqual(r.value.reason, "foo")
        }
    }

    func testFallbackMethodLeftUsed() {
        let e = try(true, "foo").fallback({
            return self.try(true, "bar")
        })

        switch e {
        case .Success(let l):
            XCTAssertEqual(l.value, "foo")
        case .Failure(let r):
            XCTAssert(false, "not reached")
        }
    }

    func testFallbackMethodRightUsed() {
        let e = try(false, "foo").fallback({
            return self.try(true, "bar")
        })

        switch e {
        case .Success(let l):
            XCTAssertEqual(l.value, "bar")
        case .Failure(let r):
            XCTAssert(false, "not reached")
        }
    }


    func testFallbackOperatorLeftUsed() {
        let e = try(true, "foo") ?? try(true, "bar")

        switch e {
        case .Success(let l):
            XCTAssertEqual(l.value, "foo")
        case .Failure(let r):
            XCTAssert(false, "not reached")
        }
    }

    func testFallbackOperatorRightUsed() {
        let e = try(false, "foo") ?? try(true, "bar")

        switch e {
        case .Success(let l):
            XCTAssertEqual(l.value, "bar")
        case .Failure(let r):
            XCTAssert(false, "not reached")
        }
    }

    func testFallbackOperatorWithRawValueInRHS() {
        let e = try(false, "foo") ?? "bar"

        switch e {
        case .Success(let l):
            XCTAssertEqual(l.value, "bar")
        case .Failure(let r):
            XCTAssert(false, "not reached")
        }
    }

    func testChain() {
        let e = try(true, "foo").chain({ (m) -> Either<String, Error> in
            return Either(success: "\(m) bar")
        })

        switch e {
        case .Success(let l):
            XCTAssertEqual(l.value, "foo bar")
        case .Failure(let r):
            XCTAssert(false, "not reached")
        }
    }

    func testGet() {
        let e = try(true, "foo")
        XCTAssertEqual(e.get(), "foo")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
