

import Foundation

//실행시 보여지는 첫화면
func firstScreen(people: [Person]?) {
    print("""
              ----------------------------------
            개발자 채용 시장에 오신것을 환영합니다
              ----------------------------------

          """)


    print("   [개발자 목록] ")

    if let people = people, !people.isEmpty {
        developerList ()

        InputNumber()
        print("------------firstScreen----------------.")

    } else {
        print("현재 지원중인 개발자가 없습니다...🥲")
    }

}



//상세페이지
func detailScreen(people:[Person]?){
    if let people = people, !people.isEmpty{
        for person in people {
                 print("""
                       [\(person.name)님의 상세페이지]
                        DreamCar:  \(person.dreamCar)
                        DreamHoues: \(person.dreamHouse)
                        희망연봉 : \(person.salary)

                       """)

            print("면접자 목록에 담으시겠습니까 ?")
            print("1.yes")
            print("2.No")
            print("------------detailScreen----------------.")
            //readLine은 console에 입력된 텍스트 라인을 읽어내는 swift 내장함수
            if let userInput = readLine(), let choice = Int(userInput) {
                switch choice {
                case 1:
                    // 사용자가 "예"를 선택하면 selectDeveloper 함수를 호출하여 개발자의 세부 정보를 전달합니다.
                    selectDeveloper(name: person.name, dreamCar: person.dreamCar, dreamHouse: person.dreamHouse, salary: Double(person.salary))
                case 2:
                    // 사용자가 "아니오"를 선택하면 필요한 경우 여기에 적절한 코드를 추가할 수 있습니다.
                    // 이 예시에서는 아무 작업도 하지 않습니다.
                    firstScreen(people: people)
                default:
                    print("잘못된 선택입니다.")
                }
            }

        }
    }else {

    }

    print("")

}

//개발자 정보
let people: [Person] = [
    Person(name: "김귀아", dreamCar: "Porsche Cayenne", dreamHouse: "PH129", salary: 60000000),
    Person(name: "박인수", dreamCar: "Morning", dreamHouse: "PH129", salary: 1000000000),
    Person(name: "박서영", dreamCar: "Morning", dreamHouse: "PH129", salary: 1000000000),
    Person(name: "최홍식", dreamCar: "Morning", dreamHouse: "PH129", salary: 1000000000)
]

//개발자 리스트(재사용목적)
func developerList (){
      print("""
            -develpoerList-
    """)
    for(index,person) in people.enumerated() {
        print("\(index+1).\(person.name)")


    }
}

//readLine(재사용목적)
func InputNumber(){
    print("""
              - InputNuber -
        면접을 요청할 개발자 번호를 입력해주세요
        ↓↓↓
        """)

    if let input = readLine(), let selectedIndex = Int(input), selectedIndex > 0, selectedIndex <= people.count {
        let selectedDeveloper = people[selectedIndex - 1]
        // New: Call the secondScreen function and pass the selected developer
        detailScreen(people: [selectedDeveloper])
    } else {

        developerList ()
    }
}

// 여기서는 선택된 개발자의 정보를 처리할 수 있습니다.
// 이 예시에서는 선택된 개발자의 세부 정보를 출력합니다.
func selectDeveloper(name: String, dreamCar: String, dreamHouse: String, salary: Double) {
  
   
    print("""
        ---selectDeveloper--
        [선택된 개발자]
        name: \(name)
        """)
    print("-------------selectDeveloper---------------.")
    subMenu(selectedDevelopers: [Person(name: name, dreamCar: dreamCar, dreamHouse: dreamHouse, salary: Int(salary))]) // New: Pass the selected developer to subMenu()
    developerList()
    print("개발자를 더 추가할 수 있습니다")
   
    InputNumber()


}


//유효하지 않은 번호가 입력됬을때 사용하는 함수
func wrongSelectScreen(){
    print(
    """
    유효하지 않은 번호입니다.
    다시 입력해주세요 ^^*
    """,
    print("----------------------------."),

    developerList(),
    InputNumber()


    )
}

//서브메뉴(재사용목적)
func subMenu(selectedDevelopers: [Person]? = nil){
    print(
    """
    ------------------
    0.처음으로
    8.선택한 개발자 목록 확인
    9.종료
    ------------------
    """)


    if let userInput = readLine(),let choice = Int(userInput){
        switch choice{
        case 0:
                    firstScreen(people: people)
        case 8:
            if let selectedDevelopers = selectedDevelopers, !selectedDevelopers.isEmpty { // New: Check if selectedDevelopers is not nil and not empty
                           print("\n--- List of Selected Developers ---")
                           developerList() // New: Call developerList() with selected developers
                           print("\nYou can add more developers")
                           InputNumber()
                       } else {
                           print("\nNo developers have been selected yet.")
                       }
        case 9:
            exit(0)

        default:
            print("유효하지않은 번호에요")

        }
    }

}


firstScreen(people: people)



