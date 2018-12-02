//
//  UEFAServicesProtocol.swift
//  UEFAProject
//
//  Created by Marcos Garcia on 11/21/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit

/// Protocol to fecth remote information
public protocol UEFAServicesProtocol {
    
//    var standings
//    var competition
    
    /// Fetch the standings information
    func fetchStandingsFor(_ competitionID: Int, completion: @escaping (Bool) -> ())
    /// Fetch the information for a particular team
    func fetchTeamInfo(_ withId: Int, completion: @escaping (Bool) -> ())
}
