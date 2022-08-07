import UIKit

let myJson = """
{
    "quiz": {
        "sport": {
            "q1": {
                "question": "Which one is correct team name in NBA?",
                "options": [
                    "New York Bulls",
                    "Los Angeles Kings",
                    "Golden State Warriros",
                    "Huston Rocket"
                ],
                "answer": "Huston Rocket"
            }
        },
        "maths": {
            "q1": {
                "question": "5 + 7 = ?",
                "options": [
                    "10",
                    "11",
                    "12",
                    "13"
                ],
                "answer": "12"
            },
            "q2": {
                "question": "12 - 8 = ?",
                "options": [
                    "1",
                    "2",
                    "3",
                    "4"
                ],
                "answer": "4"
            }
        }
    }
}
"""


struct Quiz: Codable {
    var quiz: Course
}

struct Course: Codable{
    var maths: Maths
    var sport: Sport
}

struct Sport: Codable {
    
    var q1: Questions
}

struct Maths: Codable {
    var q1: Questions
    var q2: Questions
}

struct Questions: Codable {
    var question: String
    var options: [String]
    var answer: String
    
    enum CodingKeys: String, CodingKey {
        case question
        case options
        case answer
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.question = try values.decode(String.self, forKey: .question)
        self.options = try values.decode([String].self, forKey: .options)
        self.answer = try values.decode(String.self, forKey: .answer)
        
    }
    
}




let decoder = JSONDecoder()

if let jsonData = myJson.data(using: .utf8){
    do{
        let question = try decoder.decode(Quiz.self, from: jsonData)
        print(question.quiz.sport.q1)
        print(question.quiz.maths.q1)
        print(question.quiz.maths.q2)
    }
    catch{
        print(error)
    }
}
