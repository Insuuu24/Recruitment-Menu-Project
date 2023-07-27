

import Foundation

enum Result: String {
    case pass = "pass"
    case fail = "fail"
}

final class DeveloperManager {
    
    static let shared = DeveloperManager()
    
    private var developers: [Developer] = [
        Developer(name: "최홍식", mbti: "ENFP", techStack: "Swift", salary: 150000000, email: "hongsik@example.com"),
        Developer(name: "김귀아", mbti: "ISFJ", techStack: "Swift", salary: 50000000, email: "guia@example.com"),
        Developer(name: "박인수", mbti: "INTP", techStack: "Swift", salary: 1000000000, email: "insu@example.com"),
        Developer(name: "박서영", mbti: "ENTP", techStack: "Swift", salary: 60000000, email: "seoyoung@example.com")
    ]
    
    private var interviewList: [Developer] = []
    private var passedList: [Developer] = []
    private let companyAsset = 1000000000
    
    private init() {}

    func getApplicants() -> [Developer] {
        return developers
    }

    func getInterviewees() -> [Developer] {
        return interviewList
    }

    func getPassedDevelopers() -> [Developer] {
        return passedList
    }

    func inviteToInterview(_ index: Int) {
        let developer = developers[index]
        showDetailPage(developer: developer)
    }

    private func showDetailPage(developer: Developer) {
        print(Constant.divisionLine)
        print("           [ \(developer.name) 님의 상세페이지 ]\n")
        print(" 이름 : \(developer.name)")
        print(" MBTI : \(developer.mbti)")
        print(" 기술 스택 : \(developer.techStack)")
        print(" 희망 연봉 : \(developer.salary) 원")
        print(Constant.divisionLine)
        print(" 1. 면접 명단에 추가하기\n")
        print(" 0. 뒤로가기")
        print(Constant.divisionLine)
        if let input = readLine() {
            selectDetailPageMenu(number: input, developer: developer)
        }
    }

    private func selectDetailPageMenu(number: String, developer: Developer) {
        switch number {
        case "0":
            return
        case "1":
            if let index = developers.firstIndex(where: { $0.name == developer.name }) {
                developers.remove(at: index)
                interviewList.append(developer)
                print(" \(developer.name) 님을 면접 명단에 추가했습니다.\n")
            }
        default:
            print(" 잘못된 입력입니다. 다시 시도해주세요.")
            showDetailPage(developer: developer)
        }
    }

    func inputInterviewResult(_ index: Int, result: Result) {
        let developer = interviewList.remove(at: index)
        switch result {
        case .pass:
            developer.isPassed = true
            passedList.append(developer)
            print(" \(developer.name)님을 합격 명단에 추가했습니다.")
        case .fail:
            print(" \(developer.name)님을 불합격 처리 하였습니다.")
        }
    }

    func hireDeveloper(_ index: Int) {
        let developer = passedList[index]
        if developer.salary > companyAsset {
            print(" 회사 자산이 부족합니다. 다음 옵션 중 선택해주세요.")
            print(" 1. 연봉 협상 하시겠습니까? - 이메일: \(developer.email)")
            print(" 2. 인재를 포기하시겠습니까?")
        } else {
            print(" \(developer.name)님, 축하드립니다! 합격하셨습니다.")
        }
    }
}


