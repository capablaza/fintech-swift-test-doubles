import Foundation

protocol TransferClient {
    func transfer(request:TransferRequest) -> TransferClientResponse
}
