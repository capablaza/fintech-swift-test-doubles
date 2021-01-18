import Foundation
import FintechApp

public class TransferClientSub: TransferClient {
    
    var code:Int
    var message:String
    
    init(code:Int, msg:String) {
        self.code = code
        self.message = msg
    }
    
    public func transfer(request:TransferRequest) -> TransferClientResponse{
        return TransferClientResponse(code: self.code, msg: self.message)
    }
}
