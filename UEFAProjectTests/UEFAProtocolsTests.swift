//
//  UEFAProtocolsTests.swift
//  UEFAProjectTests
//
//  Created by Marcos Garcia on 11/20/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import XCTest

class UEFAProtocolsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_UEFATeamSummaryInitialized_WithMockInformation_ShouldBeValidAndMatch() {
        //Given
        let sut = mockTeamSummary.init()
        let testURL = URL(string: "http://upload.wikimedia.org/wikipedia/commons/6/67/Borussia_Dortmund_logo.svg")
        
        ///Initialized valued should not be nil
        XCTAssertNotNil(sut.teamID, "Team id should not be nil")
        XCTAssertNotNil(sut.name, "Name should not be nil")
        XCTAssertNotNil(sut.crestUrl, "Crest URL Should not be nil")
        
        ///Values for test object should match provided information at initialization moment
        XCTAssertEqual(sut.teamID, 123, "Team id should match provided information at init")
        XCTAssertEqual(sut.name, "BV Borussia 09 Dortmund", "Team Name should match provided information at init")
        XCTAssertEqual(sut.crestUrl, testURL, "URL should match provided information at init")
    }
    
    func test_UEFATeam_Initialized_ShouldHaveValidInformation() {
        //Given
        let sut = mockUEFATeam.init()
        let teamInfo = mockTeamSummary.init()
        
        ///Initialized values should not be nil
        XCTAssertNotNil(sut.position, "Position should not be nil")
        XCTAssertNotNil(sut.teamBasicInfo, "Team basic information should not be nil")
        XCTAssertNotNil(sut.playedGames, "Number of played games should not be nil")
        XCTAssertNotNil(sut.won, "Games won shoul not be nil")
        XCTAssertNotNil(sut.draw, "Draw games should not be nil")
        XCTAssertNotNil(sut.lost, "Lost games should not be nil")
        XCTAssertNotNil(sut.points, "Points for the team should not be nil")
        XCTAssertNotNil(sut.goalsFor, "Goals in favor should not be nil")
        XCTAssertNotNil(sut.goalsAgainst, "Goals against should not be nil")
        XCTAssertNotNil(sut.goalDifference, "Goals difference should not be nil")
        
        ///Values for test object should match provided information at initialization moment
        XCTAssertEqual(sut.position, 1, "Position should match information provided")
        XCTAssertEqual(sut.teamBasicInfo.teamID, teamInfo.teamID, "Basic information should match with mock object information")
        XCTAssertEqual(sut.playedGames, 6, "Number of games should match")
        
        ///Matches valid logic
        XCTAssertEqual(sut.won, 3, "Number of games should match")
        XCTAssertLessThanOrEqual(sut.won, sut.playedGames, "Number of games won by a team should not be higger than played games")
        
        XCTAssertEqual(sut.draw, 1, "Number of draws should match")
        XCTAssertLessThanOrEqual(sut.draw, sut.playedGames, "Number of drwas by a team should not be higger than played games")
        
        XCTAssertEqual(sut.lost, 2, "Number of losts should match")
        XCTAssertLessThanOrEqual(sut.lost, sut.playedGames, "Number of lost games by a team should not be higger than played games")
        
        //Points logic
        XCTAssertEqual(sut.points, 10, "Number of points should match")
        XCTAssertLessThanOrEqual(sut.points, sut.won * 3 + sut.draw, "Number of lost games by a team should not be higger than played games")
        
        //Score logic
        XCTAssertEqual(sut.goalsFor, 7, "Number of goals for should match")
        XCTAssertEqual(sut.goalsAgainst, 2, "Number of goals againts should match")
        XCTAssertEqual(sut.goalDifference, 5, "Number of goals difference should match")
        XCTAssertEqual(sut.goalDifference, sut.goalsFor - sut.goalsAgainst, "Goals difference should match")
        
        //Testing negative difference
        sut.goalsFor = 4
        sut.goalsAgainst = 10
        sut.goalDifference = sut.goalsFor - sut.goalsAgainst
        XCTAssertEqual(sut.goalDifference, -6, "Goals difference can be a negavite value")
    }
    
    func test_UEFAGroup_Initialized_ShouldHaveValidInformation() {
        ///Given
        let sut = mockUEFAGroup.init()
        
        ///Initialized values should not be nil
        XCTAssertNotNil(sut.name, "Name should not be nil")
        XCTAssertNotNil(sut.teams, "Teams should not be nil")
        XCTAssertEqual(sut.teams.count, 3, "Group shuold have a total of 3 teams")
        
        XCTAssertNotNil(sut.stage, "Stage at this point should not be nil")
        XCTAssertNotNil(sut.type, "Type should not be nil")
        
        XCTAssertEqual(sut.stage, Stage.group, "Stage should be the same that the one provided at initialization")
        XCTAssertEqual(sut.type, Type.total, "Type should be the same that the one provided at initialization")
    }
}

/// Mock Object to test Team Summary
public class mockTeamSummary: NSObject, UEFATeamSummary {
    public var teamID: Int
    public var name: String
    public var crestUrl: URL?
    
    override init() {
        self.teamID = 123
        self.name = "BV Borussia 09 Dortmund"
        self.crestUrl = URL(string: "http://upload.wikimedia.org/wikipedia/commons/6/67/Borussia_Dortmund_logo.svg")
    }
}

/// Mock object to test UEFA Team Protocol
public class mockUEFATeam: NSObject, UEFATeam {
    public var position: Int
    public var teamBasicInfo: UEFATeamSummary
    public var playedGames: Int
    public var won: Int
    public var draw: Int
    public var lost: Int
    public var points: Int
    public var goalsFor: Int
    public var goalsAgainst: Int
    public var goalDifference: Int
    
    public override init() {
        self.position = 1
        self.teamBasicInfo = mockTeamSummary.init()
        self.playedGames = 6
        self.won = 3
        self.draw = 1
        self.lost = 2
        self.points = 10
        self.goalsFor = 7
        self.goalsAgainst = 2
        self.goalDifference = 5
    }
}

public class mockUEFAGroup: NSObject, UEFAGroup {
    public var name: IDGROUP
    public var teams: [UEFATeam]
    public var stage: Stage?
    public var type: Type?
    
    public override init() {
        self.name = .groupA
        self.teams = [mockUEFATeam(), mockUEFATeam(), mockUEFATeam()]
        self.stage = .group
        self.type = .total
    }
}
