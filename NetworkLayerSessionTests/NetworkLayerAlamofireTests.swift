//
//  NetworkLayerSessionTests.swift
//  NetworkLayerSessionTests
//
//  Created by Anoop Rawat on 26/02/17.
//  Copyright © 2017 Anoop Rawat. All rights reserved.
//

import XCTest


class NetworkLayerAlamofireTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
     ///  Stubbing Test for the api
    
    func testUserWithStubbing() {
        let userService = UserApiManager()
        let apiManager = MockApiManager.manager    // Create a Mock Api manager
        userService.apiManager = apiManager        // Dependency injection with mock api manager
            userService.callingUserService(urlString:"user/1", parameter: nil)
            { (isSuccess, user, errorString) in
                
                XCTAssertEqual(isSuccess, true,"Failing Webservice Call")
                XCTAssertEqual(user?.id, 1,"Wrong User id")
                XCTAssertEqual(user?.name, "Leanne Graham","Wrong Name")
                XCTAssertEqual(user?.username, "Bret","Wrong User Name")
                XCTAssertEqual(user?.email, "Sincere@april.biz","Wrong Email Id")
                
                // And you can add more assert like that
        }
        // Fetching mock data from local json file
        let file = Bundle.main.url(forResource: "User", withExtension: "json")
        let data = try! Data(contentsOf: file!)
        let json = try! JSONSerialization.jsonObject(with: data, options: [])
        
        // Setting Method Of mock api manager with mock data
        apiManager.mockMethodForCompletionHandler(isSucces: true, response: json as! [String : Any], error: nil)
    }
    
    ///  Real asynchronous Testing For The api
    func testUserAsync() {
        let expect = expectation(description: "Real asynchronous Testing")
        let userService = UserApiManager()
        
        userService.callingUserService(urlString: "users/1", parameter: nil)
        { (isSuccess, user, errorString) in
            XCTAssertEqual(isSuccess, true,"Failing Webservice Call")
            expect.fulfill()
        }
        
       self.waitForExpectations(timeout: 10.0) { (error) in
        XCTAssertNil(error,"Failing Webservice Call")
        }

    }
    
}
