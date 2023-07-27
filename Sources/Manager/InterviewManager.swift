
import Foundation

class InterviewManager {
    let manager = DeveloperManager.shared

    func viewInterviewees() {
        print(Constant.divisionLine)
        print("              [ 면접자 목록 ]\n")
        let interviewees = manager.getInterviewees()
        for (index, developer) in interviewees.enumerated() {
            print(" \(index+1). \(developer.name)")
        }
        print(Constant.divisionLine)
        print(" 0. 뒤로가기")
        print(Constant.divisionLine)
        print(" 결과를 입력할 면접자의 번호를 선택해주세요:")
        guard let input = readLine(), let index = Int(input) else {
            return
        }
        if index == 0 {
            return
        }
        if index > 0 && index <= interviewees.count {
            printInterviewResultInput(interviewee: interviewees[index-1], index: index-1)
        }
    }

    func printInterviewResultInput(interviewee: Developer, index: Int) {
        print(Constant.divisionLine)
        print(" \(interviewee.name)님의 면접 결과를 입력해주세요\n")
        print(" 1. 합격자 목록 추가하기\n")
        print(" 2. 불합격 통보하기\n")
        print(Constant.divisionLine)
        print(" 0. 뒤로가기")
        print(Constant.divisionLine)
        guard let input = readLine(), let choice = Int(input) else {
            return
        }
        switch choice {
        case 1:
            manager.inputInterviewResult(index, result: .pass)
            sleep(2)
        case 2:
            manager.inputInterviewResult(index, result: .fail)
            sleep(2)
        case 0:
            return viewInterviewees()
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            sleep(2)
            return printInterviewResultInput(interviewee: interviewee, index: index)
        }
    }
}


