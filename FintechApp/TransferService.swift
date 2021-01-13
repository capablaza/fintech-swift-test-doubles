import Foundation

public class TransferService{
    
    var client:TransferClient
    var repository:Storage
    
    
    init(trxClient:TransferClient, storage:Storage){
        self.client = trxClient
        self.repository = storage
    }
    
    public func transfer(request:TransferRequest) -> TransferResponse{
                
        let response:TransferClientResponse = client.transfer(request: request)
                
        if(response.code == 520){
            repository.save(message: "Try transfer amount not valid")
            return TransferResponse(code:520, msg: "The amount must be major than zero.")
        }
        if(response.code == 521){
            repository.save(message: "Try transfer amount not valid")
            return TransferResponse(code:521, msg: "The amount can't be major than 200.000.")
        }
        if(response.code == 522){
            repository.save(message: "Try with same accounts for transactions")
            return TransferResponse(code:522, msg: "The accounts can't be equals.")
        }
        
        if(response.code == 503){
            repository.save(message: "Service Unavailable")
            return TransferResponse(code:503, msg: "The operation can't be process, please try again.")
        }
        
        return TransferResponse(code: response.code, msg: response.message)
                
    }

}
