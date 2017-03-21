//
//  ApiManager.swift
//  NetworkLayerURLSession
//
//  Created by Anoop Rawat on 26/02/17.
//  Copyright © 2017 Anoop Rawat. All rights reserved.
//

import UIKit
import Alamofire

// Webservice result Enum
public enum Result {
    case responseData([String:Any])
    case error(Error)
}

// Completion Block
typealias completionBlock = (Result) -> Void

// Protocol
protocol ApiManagerProtocol {
    func apiGetRequerst(urlString:String,parameter:[String:AnyObject]?,completionHandler:@escaping completionBlock)
    func apiPostRequest(urlString:String,parameter:[String:AnyObject]?,completionHandler:@escaping completionBlock)
    
    func apiForUploadingRequest(urlString:String,parameter:[String:AnyObject]?,completionHandler:@escaping completionBlock)
    
    func apiForDownloadingRequest(urlString:String,parameter:[String:AnyObject]?,completionHandler:@escaping completionBlock)
}



// Api Manager class will be the single source connection to network

class ApiManager: ApiManagerProtocol {
    
    static let sharedInstance = ApiManager()   // Singleton Class
    
    // Method for Get request
    func apiGetRequerst(urlString:String,parameter:[String:AnyObject]?,completionHandler:@escaping completionBlock)  {
        let combineUrl = ServiceApi.baseUrl+urlString
        
        guard let url = URL(string:combineUrl) else {
            return
        }
        // Alamofire always callback on maine queue by default. If we want call on background queue then we have to assign a queue to url request method
        let queue = DispatchQueue(label: "com.test.alamofire", qos: .background, attributes: .concurrent)

        Alamofire.request(url).responseJSON(queue: queue, options:.mutableContainers) { (response) in
            
            switch(response.result) {
            case .success(_):
                completionHandler(Result.responseData(response.result.value as! [String : Any]))
            // Here we are assuming our response as Dictionary, If you are not sure guard it.
            case .failure(_):
                completionHandler(Result.error(response.error!));
                
            }
        }
      
        /// If you want to serialization with your method
//        Alamofire.request(url as! URLConvertible).responseData { (response) in
//            guard response.error == nil, let json = self.jsonSerializationWithData(data: response.data)
//                else {
//                    completionHandler(Result.error(response.error!)); return
//            }
//            completionHandler(Result.responseData(json))
//        }
        
        
    }
    
    // Like above you can add methods for Post request Or Upload request or Download Request
    func apiPostRequest(urlString:String,parameter:[String:AnyObject]?,completionHandler:@escaping completionBlock)  {
        
    }
    
    func apiForUploadingRequest(urlString:String,parameter:[String:AnyObject]?,completionHandler:@escaping completionBlock) {
        
    }
    
    func apiForDownloadingRequest(urlString:String,parameter:[String:AnyObject]?,completionHandler:@escaping completionBlock) {
        
    }
    
    // Method for json Serialaization
   private func jsonSerializationWithData(data:Data?) -> [String:Any]? {
        guard (data != nil) else {
            return nil
        }
        do
        {
             return try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
        }
        catch
        {
             print("error in JSONSerialization")
        }
        return nil
        
    }
    
    // You can create a common method for Error Handling
//    private func errorHandling(error:String) -> String{
//    
//    }
//    
//    
}
