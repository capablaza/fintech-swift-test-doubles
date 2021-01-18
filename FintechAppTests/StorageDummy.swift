import Foundation
import FintechApp

public class StorageDummy: Storage{
    
    public func save(message:String){
        
    }
    public func getMessages() -> [String]{
        let messages:[String]  = []
        return messages
    }
    
}
