

import Foundation

// 합격자를 담당하는 객체
final class RecruitmentManager: Manager {
    
    static let shared = RecruitmentManager()
    
    /// 희망 연봉의 총 합을 저장
    private var totalSalary: Int = 0
    
    /// 합격자 명단
    private var passerList: [Developer] = []
    
    private init() {}
    
    // MARK: - Get

    /// 합격자 명단을 가져온다.
    func getPasserList() -> [Developer] {
        return passerList
    }
    
    /// 합격자 명단을 가져와서 'isInterviewed', 'isPassed' 두 개의 값이 true 인 개발자를 필터링한 명단을 가져온다.
    func getList() -> [Developer] {
        let developerList = getPasserList().filter { developer in
            developer.isInterviewed == true && developer.isPassed == true
        }
        return developerList
    }
    
    /// 'totalSalary' 희망 연봉의 총 합을 가져온다.
    func getTotalSalary() -> Int {
        return totalSalary
    }
    
    /// 'totalSalary' 희망 연봉의 총 합을 0 으로 리셋한다.
    func resetTotalSalary() {
        totalSalary = 0
    }
    
    // MARK: - Add
    
    /// 입력받은 개발자를 합격자 명단에 추가한다.
    func add(developer: Developer) {
        if developer.isPassed {
            print("이미 합격된 개발자입니다.")
            sleep(2)
        } else {
            developer.isPassed = true
            passerList.append(developer)
            print("\(developer.name) 님이 합격자 명단에 추가되었습니다.")
            sleep(2)
        }
    }
    
    /// 입력받은 연봉을 희망 연봉의 총 합에 더한다.
    func add(salary: Int) {
        totalSalary += salary
    }
    
    // MARK: - Remove
    
    /// '채용하기' '전' 합격자 명단에서 제거한다.
    func remove(developer: Developer) {
        if let index = passerList.firstIndex(where: { $0.name == developer.name }) {
            developer.isPassed = false
            passerList.remove(at: index)
            print("\(developer.name) 님에게 불합격을 통보합니다.")
            sleep(2)
        } else {
            print("\(developer.name) 님은 합격자 명단에 없습니다.")
            sleep(2)
        }
    }
    
    /// '채용하기' '후' 합격자 명단에서 제거한다.
    func remove(passer: Developer) {
        if let index = passerList.firstIndex(where: { $0.name == passer.name }) {
            spacer()
            print("\(passer.name) 님을 채용하셨습니다.")
            sleep(2)
            spacer()
            print("\(passer.name) 님에게 합격 메세지를 보냈습니다.")
            sleep(2)
            spacer()
            passerList.remove(at: index)
        }
    }
}

