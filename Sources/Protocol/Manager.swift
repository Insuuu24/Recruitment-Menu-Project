

import Foundation

protocol Manager {
    func getList() -> [Developer]
    
    func add(developer: Developer)
}
