import Foundation

public protocol TransferClient {
    func transfer(request:TransferRequest) -> TransferClientResponse
}
