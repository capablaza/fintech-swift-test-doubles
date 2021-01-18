import Foundation
@testeable import FintechApp

class TransferClientSub: TransferClient {
    
    var code:Int
    var message:String
    
    init(code:Int, msg:String) {
        self.code = code
        self.message = msg
    }
    
    func transfer(request:TransferRequest) -> TransferClientResponse{
        return TransferClientResponse(code: self.code, msg: self.message)
    }
}
