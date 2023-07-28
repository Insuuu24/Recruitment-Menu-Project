

import Foundation

// 개발자를 담당하는 객체
final class DeveloperManager: Manager {
    
    static let shared = DeveloperManager()
    
    private var developers: [Developer] = [
        Developer(name: "최홍식", mbti: "ENFP", techStack: "Swift", salary: 150000000, email: "playhong16@gmail.com"),
        Developer(name: "김귀아", mbti: "ISFJ", techStack: "Swift", salary: 50000000, email: "hnmpot0318@naver.com"),
        Developer(name: "박인수", mbti: "INTP", techStack: "Swift", salary: 1000000000, email: "insu2405@gmail.com"),
        Developer(name: "박서영", mbti: "ENTP", techStack: "Swift", salary: 60000000, email: "seoyoung0427@icloud.com")
        ]
    
    private init() {}

    private func getDevelopers() -> [Developer] {
        return developers
    }
    
    func getList() -> [Developer] {
        let developerList = getDevelopers().filter { developer in
            developer.isInterviewed == false && developer.isPassed == false
        }
        return developerList
    }
    
    func add(developer: Developer) {
        print("나중에 추가도 구현.")
    }
}


 
