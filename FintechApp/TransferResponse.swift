import Foundation

public class TransferResponse{
    var code:Int
    var message:String
    
    public init(code:Int, msg:String) {
        self.code = code
        self.message = msg
    }    

    public func getCode() -> Int{
        return self.code
    }
}
