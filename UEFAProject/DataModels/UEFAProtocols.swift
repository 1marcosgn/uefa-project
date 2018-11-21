//
//  UEFAProtocols.swift
//  UEFAProject
//
//  Created by Marcos Garcia on 11/20/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit

/// Enum to manage the different competition groups
public enum IDGROUP: String {
    case groupA = "GROUP_A"
    case groupB = "GROUP_B"
    case groupC = "GROUP_C"
    case groupD = "GROUP_D"
    case groupE = "GROUP_E"
    case groupF = "GROUP_F"
    case groupG = "GROUP_G"
    case groupH = "GROUP_H"
}

/// Handles the type of Standing
public enum Type: String {
    case total = "TOTAL"
    case home = "HOME"
    case away = "AWAY"
}

/// Enum to manage the stage of the competition
public enum Stage: String {
    case group = "GROUP_STAGE"
}

/// UEFATeamSummary protocol manages the team basic information
public protocol UEFATeamSummary: class {
    /// Unique identifier for the team
    var teamID: Int { get }
    /// Name of the team
    var name: String { get }
    /// URL of the image associated to the team
    var crestUrl: URL? { get }
}

/// UEFATeam protocol handles the information associated to a team
public protocol UEFATeam: class {
    /// Value that represents the position of the team in the group
    var position: Int { get }
    /// Holds the basic information of the team
    var teamBasicInfo: UEFATeamSummary { get }
    /// Value that represents the games played
    var playedGames: Int { get }
    /// Value that represents the finished games as a winner
    var won: Int { get }
    /// Value that represents the finished games as a draw
    var draw: Int { get }
    /// Value that represents the finished games as a loser
    var lost: Int { get }
    /// Value that represents the number of points for the team
    var points: Int { get }
    /// Value that represents the goals in favor of the team
    var goalsFor: Int { get }
    /// Value that represents the goals against of the team
    var goalsAgainst: Int { get }
    /// Value that represents the goal difference between favor and against
    var goalDifference: Int { get }
}

/// UEFAGroup protocol handles the information associated to a group
public protocol UEFAGroup: class {
    var name: IDGROUP { get}
    var teams: [UEFATeam] { get }
    var stage: Stage? { get }
    var type: Type? { get }
}

public protocol UEFAStandings: class {
    var standings: [UEFAGroup]? { get set }
}
