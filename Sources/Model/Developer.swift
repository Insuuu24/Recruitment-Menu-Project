

import Foundation

class Developer {
    let name: String
    let mbti: String
    let techStack: String
    var salary: Int
    let email: String
    var isInterviewed = false
    var isPassed = false
    
    init(name: String, mbti: String, techStack: String, salary: Int, email: String, isInterviewed: Bool = false, isPassed: Bool = false) {
        self.name = name
        self.mbti = mbti
        self.techStack = techStack
        self.salary = salary
        self.email = email
        self.isInterviewed = isInterviewed
        self.isPassed = isPassed
    }
}
