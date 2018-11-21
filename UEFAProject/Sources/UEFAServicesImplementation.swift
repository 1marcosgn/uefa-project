//
//  UEFAServicesImplementation.swift
//  UEFAProject
//
//  Created by Marcos Garcia on 11/21/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit

//add required constants here

class UEFAServicesImplementation: NSObject, UEFAServicesProtocol {
    
    // Get APIs from config file here with a method
    
    // Create a shared instance here and set up:
    /*
     
        standings
        teamInfo ?? //not sure about this .. this can be dynamically updated based on the request 
 
     */
    
    // start to create objects here with the required information
    
    // make this objects injectable so it can be mocked for testing purposes
    
    // add mock json files to test
    
    
    func fetchStandingsFor(_ competitionID: Int) -> [UEFAGroup]? {
        
        return nil
    }
    
    func fetchTeamInfo(_ withId: Int) -> UEFATeam? {
        
        return nil
        
    }
    

}
