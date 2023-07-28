

import Foundation

// 면접자 메뉴 객체
class InterviewMenu: MainMenu {
    
    private let interviewerManager = InterviewerManager.shared
    private let recruitmentManager = RecruitmentManager.shared
    
    func showInterviewerList() {
        showList(title: "면접자", manager: interviewerManager)
    }
    
    private func showList(title: String, manager: Manager) {
        if manager.getList().isEmpty {
            print("\(title) 목록이 비어있습니다. ")
            sleep(2)
        } else {
            divider()
            print("                [ \(title) 명단 ]")
            spacer()
            var index = 0
            for developer in manager.getList() {
                index += 1
                print(" [\(index)]. \(developer.name)")
            }
            divider()
            setBackMenu()
            showDetailPage(index: getNumber())
        }
    }
    
    private func showDetailPage(index: Int) {
        guard index > 0 else { return }
        let developer = interviewerManager.getList()[index - 1]
        divider()
        print("           [ \(developer.name) 님의 상세페이지 ]\n")
        print(" 이름 : \(developer.name)")
        print(" MBTI : \(developer.mbti)")
        print(" 기술 스택 : \(developer.techStack)")
        print(" 희망 연봉 : \(developer.salary) 원\n")
        print(" [1]. 합격자 명단에 추가하기")
        print(" [2]. 불합격 통보하기")
        divider()
        setBackMenu()
        selectDetailMenu(number: getNumber(), developer: developer)
    }
    
    private func selectDetailMenu(number: Int, developer: Developer) {
        switch number {
        case 0:
            showInterviewerList()
        case 1:
            recruitmentManager.add(developer: developer)
        case 2:
            interviewerManager.remove(interviewer: developer)
            
        default:
            print("번호를 다시 입력해주세요.")
            sleep(2)
            showDetailPage(index: interviewerManager.getList().firstIndex(where: { $0.name == developer.name }) ?? 0)
        }
    }
}
