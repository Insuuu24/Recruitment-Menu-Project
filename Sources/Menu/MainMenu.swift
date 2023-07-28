

import Foundation

class MainMenu {
    
    private lazy var developer = DeveloperMenu()
    private lazy var interview = InterviewMenu()
    private lazy var recruitmnet = RecruitmentMenu()
    private lazy var companyInformation = CompanyInformationMenu()
    
    // 메뉴 보여주는 메서드
    func showMenu() -> Bool {
        printWelcomMessage()
        print(" [1]. 지원자 명단 | 지원한 명단 확인하기.")
        spacer()
        print(" [2]. 면접자 명단 | 서류 통과한 면접 대상자 확인하기.")
        spacer()
        print(" [3]. 합격자 명단 | 최종 합격자 및 연봉 협상 대상자 확인하기.")
        spacer()
        print(" [4]. 회사 정보  | 회사 자금 확인 및 지원금 받기.")
        spacer()
        print(" [0]. 종  료    | 프로그램 종료하기.")
        let number = getNumber()
        selectMenu(number: number)
        return number == 0 // number 가 0 인 경우 true 를 반환해서 RecruitmentService 의 isRunning = false 로 바꾼다.
    }
    
    // 메뉴에서 선택 된 번호를 처리하는 메서드
    private func selectMenu(number: Int) {
        switch number {
        case 1:
            developer.showDeveloperList()
        case 2:
            interview.showInterviewerList()
        case 3:
            recruitmnet.showPasserList()
        case 4:
            companyInformation.showMyPage()
        case 0:
            return
        default:
            print("잘못 입력하셨습니다.")
        }
    }
    
    // 번호를 입력받는 메서드 (입력 예외 처리)
    // MainMenu.swift

    func getNumber() -> Int {
        divider()
        print("""
        번호를 입력해주세요.
        ↓↓↓
        """)
        while true {
            guard let input = readLine() else { continue }
            if let number = Int(input) {
                return number
            } else {
                print("""
                유효하지 않은 입력입니다. 번호를 입력해주세요.
                ↓↓↓
                """)
                continue
            }
        }
    }

    
    // 뒤로가기 버튼 생성 메서드
    func setBackMenu() {
        print(" [0]. 뒤로 가기")
    }
}
