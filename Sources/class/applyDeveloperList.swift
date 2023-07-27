//
//  File.swift
//  
//
//  Created by kiakim on 2023/07/27.
//
// applyDevleoperList.swift

class ApplyDeveloperList{
    
    
    func firstView() {
        print("1. 지원목록")
        
    }
    
    func seconView (usePerson: [Person]){
        print(
                """

                [지원자 목록]

                """
            )
        for (index,person) in usePerson.enumerated() {
          
            
            print("""
                \(index+1).  \(person.name) |    \(person.sentence)
                """)
            
        }
        
        //분리하고싶은......
        if let input = readLine(),
           let selectedPersonIndex = Int(input),
           selectedPersonIndex > 0 , selectedPersonIndex <= usePerson.count{
            let selectedPerson = usePerson[selectedPersonIndex - 1]
            
            detailView(usePerson: [])
        
        }
        else{
            print("유효하지 않은 번호입니다.")
        }
        
    }
    
    func detailView(usePerson:[Person]){
        
     
        print(
                """
                
                
                """
        )
    }
    
    //input | 사용자가 선택한 값을 받아들임
    func InputNumber(){
        print("""
              - InputNuber -
        번호를 입력해주세요
        """)

  
    }
    
    
    
}
