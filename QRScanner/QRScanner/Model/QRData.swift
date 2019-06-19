import Foundation

struct QRData {
    var codeString: String?
}
struct Defaults {
    
    static let (nameKey, dateKey) = ("name", "date")
    static let userSessionKey = "com.save.usersession"
    
    struct Model {
        var name: String
        var date: String
        
        init(_ json: [String: String]) {
            self.name = json[nameKey] ?? ""
            self.date = json[dateKey] ?? ""
        }
    }
    
    static func save(_ name: String, with address: String){
        UserDefaults.standard.set([nameKey: name, dateKey: address], forKey: userSessionKey)
    }
    
    static func getNameAndAddress()-> Model {
        return Model((UserDefaults.standard.value(forKey: userSessionKey) as? [String: String]) ?? [:])
    }
    
    static func clearUserData(){
        UserDefaults.standard.removeObject(forKey: userSessionKey)
    }
}
