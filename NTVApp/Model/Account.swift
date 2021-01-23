




import Foundation

struct Account {
    let userName: String?
    let userLastName: String?
    let userInterests: String?
    let photoUrl: String?
    
    func fullName() -> String {
        return (userName ?? "") + " " + (userLastName ?? "")
    }
}

