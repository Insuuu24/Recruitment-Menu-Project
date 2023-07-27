//
//  File.swift
//  
//
//  Created by kiakim on 2023/07/26.
//

import Foundation

class Information{
    //
    //유효하지 않은 번호를 입력했을 때 출력되는 함수로 구성. 유효하지않음을 알려주고 다시선택할수있도록 developerList를 다시한번 출력
    func wrongSelectScreen(){
        print(
        """
        유효하지 않은 번호입니다.
        다시 입력해주세요 ^^*
        """,
        print("----------------------------.")
    //    ,
    //
    //    developerList(),
    //    InputNumber()


        )
    }
    
    // Info |
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
                //        case 0:
                //                    firstScreen(people: people)
            case 8:
                if let selectedDevelopers = selectedDevelopers, !selectedDevelopers.isEmpty { // New: Check if selectedDevelopers is not nil and not empty
                    print("\n--- List of Selected Developers ---")
                    //                           developerList() // New: Call developerList() with selected developers
                    print("\nYou can add more developers")
                    //                           InputNumber()
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
    
}
