

import Foundation

final class PassedManager {
    let manager = DeveloperManager.shared

    private var totalSalary: Int = 0
    var passerList: [Developer] = []

    static let shared = PassedManager()

    public init() {}

    func getPasserList() -> [Developer] {
        return passerList
    }

    func getList() -> [Developer] {
        let developerList = getPasserList().filter { developer in
            developer.isInterviewed == true && developer.isPassed == true
        }
        return developerList
    }

    func getTotalSalary() -> Int {
        return totalSalary
    }

    func resetTotalSalary() {
        totalSalary = 0
    }

    func addDeveloper(_ developer: Developer) {
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

    func addSalary(_ salary: Int) {
        totalSalary += salary
    }

    func removeDeveloper(_ developer: Developer) {
        if let index = passerList.firstIndex(where: { $0.name == developer.name }) {
            developer.isPassed = false
            passerList.remove(at: index)
            print("\(developer.name) 님이 합격자 명단에서 제거되었습니다.")
            sleep(2)
        }
    }

    func viewPassedDevelopers() {
        print(Constant.divisionLine)
        print("              [ 합격자 목록 ]\n")
        let passedDevelopers = getList()
        for (index, developer) in passedDevelopers.enumerated() {
            print(" \(index+1). \(developer.name) - 희망연봉: \(developer.salary)\n")
            addSalary(developer.salary)
        }
        print(Constant.divisionLine)
        print(" 0. 뒤로가기")
        print(Constant.divisionLine)
        print(" 채용할 개발자의 번호를 선택해주세요:")
        guard let input = readLine(), let index = Int(input) else {
            return
        }
        if index == 0 {
            return
        }
        if index > 0 && index <= passedDevelopers.count {
            manager.hireDeveloper(index-1)
            if passedDevelopers[index-1].isPassed == false {
                removeDeveloper(passedDevelopers[index-1])
            }
        }
    }
}



