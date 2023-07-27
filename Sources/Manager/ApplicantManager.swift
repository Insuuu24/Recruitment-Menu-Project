

import Foundation

class ApplicantManager {
    let manager = DeveloperManager.shared
    
    func viewApplicants() {
        print(Constant.divisionLine)
        print("              [ 지원자 목록 ]\n")
        let applicants = manager.getApplicants()
        for (index, developer) in applicants.enumerated() {
            print(" \(index+1). \(developer.name)\n")
        }
        print(Constant.divisionLine)
        print(" 0. 뒤로 가기")
        print(Constant.divisionLine)
        print(" 면접 대상에 추가할 지원자의 번호를 입력해주세요:\n")
        guard let input = readLine(), let index = Int(input) else {
            return
        }
        if index == 0 {
            return
        }
        if index > 0 && index <= applicants.count {
            manager.inviteToInterview(index-1)
        }
    }
}
