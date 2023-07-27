// The Swift Programming Language
// https://docs.swift.org/swift-book

enum SettingClass{
    case ApplyDeveloperList
    case InterviewList
    case PasserList
    case SubMenu
}




func firstScreen (){
    let developer = ApplyDeveloperList()
    let interview = InterviewList()
    let passer = PasserList()
    let subMenu = SubMenu()
    
    
    print(
    """
    -------------------------------------------
    iOS 개발자 채용시장에 오신것을 환영합니다 !
    -------------------------------------------
    """
        )
    developer.firstView()
    interview.firstView()
    passer.firstView()
    subMenu.firstView()
    

}


firstScreen()

