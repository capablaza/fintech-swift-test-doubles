import XCTest
import FintechApp

class TransferServiceSolutionTest: XCTestCase {
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testGivenTransRequestWhenAmountIsLessThanZeroThenResponseIs520() throws {
        let client = TransferClientSub(code: 520, msg: "")
        let storage = StorageDummy()
        
        let service = TransferService(trxClient: client, storage: storage)
        
        let amount:Int = -100
        let from:String = ""
        let to:String = ""
        
        let request = TransferRequest(amount: amount, from: from, to: to)
        
        let response = service.transfer(request: request)
        
        XCTAssertEqual(response.getCode(), 520)
        
    }
    
    func testGivenTransRequestWhenAmountIsEqualToZeroThenResponseIs520() throws {
        let client = TransferClientSub(code: 520, msg: "")
        let storage = StorageDummy()
        
        let service = TransferService(trxClient: client, storage: storage)
        
        let amount:Int = 0
        let from:String = ""
        let to:String = ""
        
        let request = TransferRequest(amount: amount, from: from, to: to)
        
        let response = service.transfer(request: request)
        
        XCTAssertEqual(response.getCode(), 520)
    }
    
    func testGivenTransRequestWhenAmountIsMajorThanMaximumThenResponseIs521() throws {
        let client = TransferClientSub(code: 521, msg: "")
        let storage = StorageDummy()
        
        let service = TransferService(trxClient: client, storage: storage)
        
        let amount:Int = 500000
        let from:String = ""
        let to:String = ""
        
        let request = TransferRequest(amount: amount, from: from, to: to)
        
        let response = service.transfer(request: request)
        
        XCTAssertEqual(response.getCode(), 521)
    }
    
    func testGivenTransRequestWhenOriginsAreEqualsThenResponseIs522() throws {
        let client = TransferClientSub(code: 522, msg: "")
        let storage = StorageDummy()
        
        let service = TransferService(trxClient: client, storage: storage)
        
        let amount:Int = 1000
        let from:String = "santander"
        let to:String = "santander"
        
        let request = TransferRequest(amount: amount, from: from, to: to)
        
        let response = service.transfer(request: request)
        
        XCTAssertEqual(response.getCode(), 522)
    }
    
    func testGivenTransRequestWhenConditionsAreBadThenSaveErrorInStorage() throws {
        let client = TransferClientSub(code: 522, msg: "")
        let storage = StorageFake()
        
        let service = TransferService(trxClient: client, storage: storage)
        
        let amount:Int = 1000
        let from:String = "santander"
        let to:String = "santander"
        
        let request = TransferRequest(amount: amount, from: from, to: to)
        
        let response = service.transfer(request: request)
        
        XCTAssertEqual(response.getCode(), 522)
        XCTAssertFalse(storage.getMessages().isEmpty)
    }

}
