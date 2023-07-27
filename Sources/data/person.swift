//
//  File.swift
//  
//
//  Created by kiakim on 2023/07/27.
//
// person.swift
//data 관련 자료 모음



struct Person{
    var name : String
    var mbti : String
    var techStack : String
    var salary : Int
    var interview : Bool?
    var isPassed : Bool?
    var email: String
    var sentence : String

}

let person1 = Person(name: "김귀아", mbti: "ISFJ", techStack: "없는걸로 하겠습니다.", salary: 60000000, email: "kiakim.dev@gmail.com", sentence: "한줄 자기소개")
let person2 = Person(name: "박인수", mbti: "INTP", techStack: "swift, swiftUI, Uikit", salary: 100000000, email: "developer@gmail.com",sentence: "한줄 자기소개")
let person3 = Person(name: "최홍식", mbti: "ENFP", techStack: "swift, swiftUI, Uikit", salary: 100000000, email: "developer@gmail.com",sentence: "한줄 자기소개")
let person4 = Person(name: "박서영", mbti: "ENTP", techStack: "swift, swiftUI, Uikit", salary: 100000000, email: "developer@gmail.com",sentence: "한줄 자기소개")


let arryPerson = [person1,person2,person3,person4]

