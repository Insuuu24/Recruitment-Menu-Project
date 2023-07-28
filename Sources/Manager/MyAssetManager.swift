

import Foundation

class MyAssetManager {
    
    static let shared = MyAssetManager()
    
    // 회사 계좌
    private var account: Int = 200000000
    
    private init() {}
    
    // 계좌에 얼마가 있는지 확인한다.
    func getAccount() -> Int {
        return account
    }
    
    /*
     연봉을 지불하고 계좌에서 차감한다.
     Parameter salary : 개발자 희망 연봉
     */
    func pay(salary: Int) {
        account -= salary
        print(" \(salary) 원을 지불하셨습니다. 감사합니다.")
    }
}
