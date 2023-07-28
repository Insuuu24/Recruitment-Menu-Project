

import Foundation

// 채용 서비스 객체
class RecruitmentService {
    
    private var isRunning = true // 서비스 실행 구분
    private let menu = MainMenu() // 전체 메뉴 담당 객체 생성
    
    func run() {
        // isRunning = true 인 경우 반복해서 실행
        while isRunning {
            if menu.showMenu() {
                isRunning.toggle()
            }
        }
    }
}

RecruitmentService().run()


