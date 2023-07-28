

import Foundation

// 면접자를 담당하는 객체.
class InterviewerManager: Manager {
    
    static let shared = InterviewerManager()
    
    private var interviewerList: [Developer] = []
    
    private init() {}
    
    // 면접자 명단 받는 메서드
    func getInterviewerList() -> [Developer] {
        return interviewerList
    }
    
    // 면접자 명단 필터링 한 결과를 받는 메서드
    func getList() -> [Developer] {
        let developerList = getInterviewerList().filter { developer in
            developer.isInterviewed == true && developer.isPassed == false
        }
        return developerList
    }
    
    func add(developer: Developer) {
        if developer.isInterviewed {
            print(" \(developer.name) 님은 면접자 명단에 있습니다.")
            sleep(2)
        } else {
            developer.isInterviewed = true
            interviewerList.append(developer)
            print("\(developer.name) 님이 면접자 명단에 추가되었습니다.")
            sleep(2)
        }
    }
    
    func remove(interviewer: Developer) {
        if let index = interviewerList.firstIndex(where: { $0.name == interviewer.name }) {
            interviewer.isInterviewed = false
            interviewerList.remove(at: index)
            print(" \(interviewer.name) 님에게 불합격을 통보합니다.")
            sleep(2)
        } else {
            print(" \(interviewer.name) 님은 면접자 명단에 없습니다.")
            sleep(2)
        }
    }
}
