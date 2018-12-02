//
//  UEFAServicesImplementationTests.swift
//  UEFAProjectTests
//
//  Created by Marcos Garcia on 12/1/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import XCTest

class UEFAServicesImplementationTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_fetchStandings_ForValidCompetitionID_DictionaryWithInformation() {
        /// Given
        let servicesImplementation = UEFAServicesImplementation.sharedInstance
        let uefaCompetitionID = 2001
        
        XCTAssertNotNil(servicesImplementation, "Shared instance of Services Implementation should not be nil at this point")
        XCTAssertNotNil(uefaCompetitionID, "Competition ID should not be nil")
        XCTAssertEqual(uefaCompetitionID, 2001, "Competition ID for UEFA should be 2001")
        
        let expectation = XCTestExpectation(description: "Call should be successfully completed for the provided competition ID")
        
        servicesImplementation.fetchStandingsFor(uefaCompetitionID) { (success) in
            if success {
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    func test_fetchTeamInfo_ForValidTeamID_DictionaryWithInformation() {
        /// Given
        let servicesImplementation = UEFAServicesImplementation.sharedInstance
        let teamID = 4
        
        XCTAssertNotNil(servicesImplementation, "Shared instance of Services Implementation should not be nil at this point")
        XCTAssertNotNil(teamID, "Competition ID should not be nil")
        XCTAssertEqual(teamID, 4, "Competition ID for UEFA should be 2001")
        
        let expectation = XCTestExpectation(description: "Call should be successfully completed for the provided team ID")
        
        servicesImplementation.fetchTeamInfo(teamID) { (success) in
            if success {
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
}

