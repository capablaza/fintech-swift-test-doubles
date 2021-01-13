import Foundation

public protocol Storage {
    func save(message:String)
    func getMessages(count:Int) -> [String]
}
