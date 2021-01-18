import Foundation
import FintechApp

public class StorageFake: Storage{
    var messages:[String]  = []
    
    public func save(message:String){
        self.messages.append(message)
    }
    
    public func getMessages() -> [String]{
        return self.messages
    }
}
