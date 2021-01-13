import Foundation

public class TransferRequest{
    var amount:Int
    var fromAccount:String
    var toAccount:String
    
    init(amount:Int, from:String, to:String) {
        self.amount = amount
        self.fromAccount = from
        self.toAccount = to
    }
}
