import UIKit



class MockApiManager: ApiManagerProtocol {
    
    static let manager = MockApiManager()
    var fakeCompletionHandler:completionBlock?
   
    func apiGetRequerst(urlString: String, parameter: [String : AnyObject]?, completionHandler: @escaping completionBlock) {
        self.fakeCompletionHandler = completionHandler
    }
    
    
    func mockMethodForCompletionHandler(isSucces:Bool,response:[String:Any],error:Error?) {
        fakeCompletionHandler!(Result.responseData(response))
    }
    
    func apiPostRequest(urlString:String,parameter:[String:AnyObject]?,completionHandler:@escaping completionBlock){
        
    }
    
    func apiForUploadingRequest(urlString:String,parameter:[String:AnyObject]?,completionHandler:@escaping completionBlock)
    {
        
    }
    func apiForDownloadingRequest(urlString:String,parameter:[String:AnyObject]?,completionHandler:@escaping completionBlock){
        
    }

}


