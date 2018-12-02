//
//  UEFAServicesImplementation.swift
//  UEFAProject
//
//  Created by Marcos Garcia on 11/21/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit
import Alamofire

final class UEFAServicesImplementation: NSObject, UEFAServicesProtocol {
    
    // start to create objects here with the required information -> USE THIS CLASS TO GET THE JSON DICTIONARIES ONLY
    
    // make this objects injectable so it can be mocked for testing purposes
    // add mock json files to test
    
    /// UEFAServicesImplementation Constants
    private struct Constants {
        static let authToken = "X-Auth-Token"
        static let services = "Services"
        static let plist = "plist"
        static let standings = "standings"
        static let teamInfo = "teamInfo"
        static let queryParam = "query-param"
    }
    
    public static let sharedInstance = UEFAServicesImplementation()
    
    func fetchStandingsFor(_ competitionID: Int, completion: @escaping (Bool) -> ()) {
        guard let standingsRequest = getStandingsAPI()?.replacingOccurrences(of: Constants.queryParam, with: String(competitionID)) else {
            return
        }
        
        Alamofire.request(standingsRequest, headers: getRequestHeaders()).responseJSON { response in
            //debugPrint(response)
            completion(true)
        }
    }
    
    func fetchTeamInfo(_ withId: Int, completion: @escaping (Bool) -> ()) {
        guard let teamsRequest = getTeamInfoAPI()?.replacingOccurrences(of: Constants.queryParam, with: String(withId)) else {
            return
        }
        
        Alamofire.request(teamsRequest, headers: getRequestHeaders()).responseJSON { response in
            //debugPrint(response)
            completion(true)
        }
    }
}


private extension UEFAServicesImplementation {
    
    /// Builds the headers dictionary with the authorization token
    func getRequestHeaders() -> HTTPHeaders {
        var headers: HTTPHeaders = ["" : ""]
        
        if let token = getToken() {
            headers = [Constants.authToken: token]
        }
        return headers
    }
    
    /// Use this method to get the services configuration
    func servicesConfiguration() -> NSDictionary? {
        if let path = Bundle.main.path(forResource: Constants.services, ofType: Constants.plist),
            let servicesInformation = NSDictionary(contentsOfFile: path) {
            return servicesInformation
        }
        return nil
    }
    
    /// Returns authorization token from the configuration file
    func getToken() -> String? {
        guard let token =  servicesConfiguration()?[Constants.authToken] as? String else {
            return nil
        }
        return token
    }
    
    /// Returns standings endpoint
    func getStandingsAPI() -> String? {
        guard let standingsApi =  servicesConfiguration()?[Constants.standings] as? String else {
            return nil
        }
        return standingsApi
    }
    
    /// Returns team info endpoint
    func getTeamInfoAPI() -> String? {
        guard let teamInfoApi =  servicesConfiguration()?[Constants.teamInfo] as? String else {
            return nil
        }
        return teamInfoApi
    }
}
