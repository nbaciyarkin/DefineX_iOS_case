//
//  DefineXTests.swift
//  DefineXTests
//
//  Created by Yarkın Gazibaba on 26.07.2023.
//

import XCTest
@testable import DefineXTests

final class DefineXTests: XCTestCase {
    
    private var mailField: String = ""

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mailField = ""
    }

    func testExample() throws {

    }
    
    

    func testPerformanceExample() throws {

        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
