
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choiceAButton: UIButton!
    @IBOutlet weak var choiceBButton: UIButton!
    
    @IBOutlet weak var choiceCButton: UIButton!
    
    @IBOutlet weak var scoreText: UILabel!
    
    var quizBrain = QuizBrain()
        
    var totalQuestions: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalQuestions = quizBrain.getTotalQuestions()
        fetchAnswers(currentQuestion: quizBrain.getCurrentQuestionCount())

        progressBar.progress = 0.0
        updateUI()
    }
    
    func updateUI() {
        questionText.text = quizBrain.getQuestionText()
    }
    
    func fetchAnswers(currentQuestion: Int)
    {
        print(currentQuestion)
    
        let listOfAnswers = quizBrain.getAnswers(question: currentQuestion)
        
        choiceAButton.setTitle(listOfAnswers[0], for: .normal)
        choiceBButton.setTitle(listOfAnswers[1], for: .normal)
        choiceCButton.setTitle(listOfAnswers[2], for: .normal)
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        
        let userAnswer = sender.currentTitle
        let userGotItRight = quizBrain.checkAnswer(userAnswer!)
        
        let _ = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(revertToClearColor), userInfo: nil, repeats: false)

        if userGotItRight {
            sender.backgroundColor = UIColor.green

        } else {
            sender.backgroundColor = UIColor.red
        }
        

        if quizBrain.getCurrentQuestionCount() < totalQuestions {
            quizBrain.nextQuestion()
            progressBar.progress = quizBrain.getRatioProgress()
            scoreText.text = "Score: \(String(quizBrain.getUserScore()))"

        } else {
            quizBrain.firstQuestion()
            progressBar.progress = quizBrain.getRatioProgress()
        }
        
        fetchAnswers(currentQuestion: quizBrain.getCurrentQuestionCount())

        
        updateUI()
    }
    
    @objc func revertToClearColor() {
        choiceAButton.backgroundColor = UIColor.clear
        choiceBButton.backgroundColor = UIColor.clear
        choiceCButton.backgroundColor = UIColor.clear
    }
}

