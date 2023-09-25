//
//  ProbafeladatTests.swift
//  ProbafeladatTests
//
//  Created by Suhaj Milán on 2023. 09. 23..
//

import XCTest
@testable import Probafeladat

final class ProbafeladatTests: XCTestCase {
    
    func testSuccessfulFormat() {
        let enteredDate = "2023-04-16T19:16:17Z"
        let formattedDate = DateFormat.formatDate(date: enteredDate)
        XCTAssertEqual(formattedDate, "2023.04.16 21:16")
    }
    
    func testUnsuccessFormat() {
        let enteredDate = "2023-04-16T19:16:17Z"
        let formattedDate = DateFormat.formatDate(date: enteredDate)
        XCTAssertNotEqual(formattedDate, "2023.04.1621:16")
    }
}
