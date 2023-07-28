

import Foundation

/// 합격자 메뉴 객체
class RecruitmentMenu: MainMenu {
    
    private let recruitmentManager = RecruitmentManager.shared
    private let myAssetManager = MyAssetManager.shared
    
    private var isExcessSalary = false // 급여가 초과되었는지 확인
    
    func showPasserList() {
        showList(title: "합격자", manager: recruitmentManager)
    }
    
    /// 합격자 명단 보여주기
    private func showList(title: String, manager: Manager) {
        if manager.getList().isEmpty {
            print("\(title) 목록이 비어있습니다. ")
            sleep(2)
        } else {
            print("           [ \(title) 명단 ]")
            spacer()
            var index = 0
            for developer in manager.getList() {
                index += 1
                print(" [\(index)]. \(developer.name) | 희망 연봉 : \(developer.salary) 원")
                recruitmentManager.add(salary: developer.salary)
            }
            showTotalSalary(total: recruitmentManager.getTotalSalary())
            setBackMenu()
            showDetailPage(index: getNumber())
        }
    }
    
    /// 합격자 명단의 희망 연봉 총 합 보여주기
    private func showTotalSalary(total salary: Int) {
        spacer()
        print("            [ Total ]")
        spacer()
        print("전원 채용 시 지출 금액은 \(salary) 원 입니다.")
        showRemainingBalance(total: salary)
        spacer()
    }
    
    /// 합격자 명단의 희망 연봉 총 합과 회사의 잔고를 비교해서 안내 메세지 보여주기
    func showRemainingBalance(total salary: Int) {
        let account = myAssetManager.getAccount()
        if account > salary || account == salary {
            spacer()
            print(" 현재 회사 자산은 \(account) 원이 있습니다. ")
            print(" 전원 채용 시 \(account - salary) 원이 남습니다.")
        } else {
            print("\n현재 회사에는 \(account) 원이 있습니다. -> \(salary - account) 원이 부족해서 전원 채용할 수 없습니다.")
        }
    }
    
    /// 합격자 명단의 개발자 선택 시 해당 개발자의 상세페이지 보여주기
    private func showDetailPage(index: Int) {
        guard index > 0 else
        {
            recruitmentManager.resetTotalSalary()
            return
        }
        let developer = recruitmentManager.getList()[index - 1]
        divider()
        print("[ \(developer.name) 님의 상세페이지 ]")
        print("이름 : \(developer.name)")
        print("MBTI : \(developer.mbti)")
        print("기술 스택 : \(developer.techStack)")
        print("희망 연봉 : \(developer.salary) 원")
        setBackMenu()
        showDetailMenu(total: recruitmentManager.getTotalSalary(), account: myAssetManager.getAccount())
        selectDetailMenu(number: getNumber(), developer: developer)
    }
    
    /// 상세페이지에 추가되는 메뉴 보여주기
    func showDetailMenu(total: Int, account: Int) {
        if account >= total {
            isExcessSalary = false
            print("[1]. 채용하기")
            print("[2]. 불합격 통보하기")
        } else {
            isExcessSalary = true
            print(" [1]. 협상하기")
            print(" [2]. 불합격 통보하기")
        }
    }
    
    /// 상세페이지의 메뉴 처리하기
    private func selectDetailMenu(number: Int, developer: Developer) {
        switch number {
        case 0:
            showPasserList()
            recruitmentManager.resetTotalSalary()
        case 1:
            if isExcessSalary {
                printDealMessage(developer: developer)
                recruitmentManager.resetTotalSalary()
            } else {
                myAssetManager.pay(salary: developer.salary)
                recruitmentManager.remove(passer: developer)
                recruitmentManager.resetTotalSalary()
            }
            
        case 2:
            recruitmentManager.remove(developer: developer)
            recruitmentManager.resetTotalSalary()
        default:
            print("번호를 다시 입력해주세요.")
            sleep(2)
            showDetailPage(index: recruitmentManager.getList().firstIndex(where: { $0.name == developer.name }) ?? 0)
        }
    }
    
    /// 협상하기 선택 시 출력하는 안내 메세지
    func printDealMessage(developer: Developer) {
        spacer()
        print(" \(developer.name) 님의 이메일 : \(developer.email) 으로 협상관련 이메일을 발송하였습니다.")
        spacer()
        sleep(2)
    }
}

