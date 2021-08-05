
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
        
    var totalQuestions: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalQuestions = quizBrain.getTotalQuestions()
        
        progressBar.progress = 0.0
        updateUI()
    }
    
    func updateUI() {
        questionText.text = quizBrain.getQuestionText()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let userGotItRight = quizBrain.checkAnswer(userAnswer!)
        let currentQuestion = quizBrain.getCurrentQuestionCount()
        
        let _ = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(revertToClearColor), userInfo: nil, repeats: false)

        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red

        }
        if currentQuestion < totalQuestions {
            quizBrain.nextQuestion()
            progressBar.progress = quizBrain.getRatioProgress()

        } else {
            quizBrain.firstQuestion()
            progressBar.progress = quizBrain.getRatioProgress()
            print("End of quiz!")
        }
        
        updateUI()
    }
    
    @objc func revertToClearColor() {
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
}

