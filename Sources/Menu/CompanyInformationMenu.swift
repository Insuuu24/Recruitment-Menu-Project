

import Foundation

class CompanyInformationMenu: MainMenu {
    
    let myAssetManager = MyAssetManager.shared
    
    /// 메뉴 보여주기
    func showMyPage() {
        divider()
        print("             [ 회사 정보 ]")
        spacer()
        print(" 1. 자금 보기")
        spacer()
        divider()
        setBackMenu()
        selectMenu(number: getNumber())
    }
    
    /// 메뉴 처리하기
    private func selectMenu(number: Int) {
        switch number {
        case 0:
            return
        case 1:
            divider()
            print("회사 자금은 \(myAssetManager.getAccount()) 원 입니다.")
            sleep(2)
        default:
            return
        }
    }
}
