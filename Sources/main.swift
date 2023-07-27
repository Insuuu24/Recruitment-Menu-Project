

import Foundation

enum RecruitMenu: Int {
    case viewApplicants = 1
    case viewInterviewList
    case viewPassedList
    case exit
}

let applicantManager = ApplicantManager()
let interviewManager = InterviewManager()
let passedManager = PassedManager()

while true {
    print(Constant.welcomeMessage)
    print("""
     1. 지원 목록 | 지원자 명단을 확인합니다.\n
     2. 면접 명단 | 서류 통과한 면접 대상자를 확인합니다.\n
     3. 합격 명단 | 최종 합격자 및 연봉협상 대상자를 확인합니다.\n
    -------------------------------------------------
     0. 프로그램 종료
    """)
    print(Constant.divisionLine)
    print(" 명단 확인하려는 번호를 입력해주세요:")

    let input = readLine()
    
    if let inputString = input, Int(inputString) == nil {
        print(" 잘못 입력하셨습니다. 번호로 입력해주세요.")
        continue
    }

    if let inputString = input, let number = Int(inputString), let recruitMenu = RecruitMenu(rawValue: number) {
        switch recruitMenu {
        case .viewApplicants:
            applicantManager.viewApplicants()

        case .viewInterviewList:
            interviewManager.viewInterviewees()

        case .viewPassedList:
            passedManager.viewPassedDevelopers()

        case .exit:
            print(" 프로그램을 종료합니다.")
            exit(0)
        }
    } else {
        print(" 존재하지 않는 번호입니다. 다시 입력해주세요.")
    }
}



