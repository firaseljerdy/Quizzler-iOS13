
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    
    //var revertTimer: Timer?

    
    let quiz = [Question(q: "A slug's blood is green.", a: "True"),
                Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
                Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
                Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
                Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
                Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
                Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
                Question(q: "Google was originally called 'Backrub'.", a: "True"),
                Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
                Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
                Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
                Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")]
    
    var currentQuestion = 0
    var totalQuestions: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalQuestions = quiz.count - 1
        print("total ques \(totalQuestions)")
        progressBar.progress = 0.0
        updateUI()
    }
    
    func updateUI() {
        questionText.text = quiz[currentQuestion].text
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[currentQuestion].answer
        
        let _ = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(revertToClearColor), userInfo: nil, repeats: false)

        if userAnswer == actualAnswer {
            sender.backgroundColor = UIColor.green
            //print("green")
            
        } else {
            sender.backgroundColor = UIColor.red
            //print("red")

        }
        if currentQuestion < quiz.count - 1 {
            currentQuestion += 1
            print("current \(currentQuestion)")
            let ratio: Float = Float(currentQuestion) / Float(totalQuestions)
            print(ratio)
            progressBar.progress = ratio

        } else {
            currentQuestion = 0
            progressBar.progress = 0.0
            print("End of quiz!")
        }
        
        updateUI()
    }
    
    @objc func revertToClearColor() {
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
}

