//
//  ViewController.swift
//  TestJLPT
//
//  Created by cmStudent on 15/12/2022.
//

import UIKit
import ProgressHUD
import Firebase
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var questionCounter: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var myanmarTitle: UILabel!
    
    //Outlet for Buttons
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var toggleButton: UIButton!
    
    let allQuestions = QuestionBank()
    
    @Published var newItems: [Question] = []
    @Published var filtered: [Question] = []
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    
    var collectionName = "Questions"
    var player: AVAudioPlayer?
    
    override func viewWillAppear(_ animated: Bool) {
        //fetchNewData()
        
        updateUI()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNewData()
        
        answerLabel.isHidden = true
    }
   
    
    @IBAction func backButtonAction(_ sender: Any) {
        //_ = navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func answerAction(_ sender: Any) {
        
        toggleButton.isSelected = !toggleButton.isSelected

            if toggleButton.isSelected {
                print("I am selected.")
                answerLabel.isHidden = false
                

            } else {
                print("I am not selected.")
                answerLabel.isHidden = true
            }
    }
    
    
    override func viewDidLayoutSubviews() {
        
        //updateQuestion()
    }
    
    
    func fetchNewData() {
        let db = Firestore.firestore()
        db.collection(collectionName).getDocuments { snap, err in
            guard let itemData = snap else {return}
            self.newItems = itemData.documents.compactMap({ (doc) -> Question? in
                
                let questionTxt = doc.get("questionText") as! String
                let choiceA = doc.get("choiceA") as! String
                let choiceB = doc.get("choiceB") as! String
                let choiceC = doc.get("choiceC") as! String
                let choiceD = doc.get("choiceD") as! String
                let myanmar = doc.get("myanmarMean") as! String
                let answer = doc.get("answer") as! Int

                return Question(questionText: questionTxt, choiceA: choiceA, choiceB: choiceB, choiceC: choiceC, choiceD: choiceD, answer: answer,myanmarMean: myanmar)

            })
            self.newItems.reverse()
            self.filtered = self.newItems
            
            self.updateQuestion()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == selectedAnswer {
            ProgressHUD.showSuccess("Correct")
            print("tag\(sender.tag)")
            score += 1
            checkMusic(name: "win")
            answerLabel.text = "0"
            
        }else{
            ProgressHUD.showError("Incorrect")
            print("Incorrect")
            checkMusic(name: "lose")
        }
        
        questionNumber += 1
        updateQuestion()
        
    }
    
    func checkMusic(name: String) {
        let s = name

        let urlString = Bundle.main.path(forResource: s, ofType: "mp3")

        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

            guard let urlString = urlString else {
                print("urlstring is nil")
                return
            }

            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)

            guard let player = player else {
                print("player is nil")
                return
            }
            player.volume = 0.5

            player.play()
        }
        catch {
            print("error occurred")
        }
    }
    
    func updateQuestion(){
        
        if questionNumber <= filtered.count - 1{

            print(questionNumber)
            print(filtered[questionNumber].question)
            questionLabel.text = filtered[questionNumber].question
            myanmarTitle.text = filtered[questionNumber].myanmarMean
            optionA.setTitle(filtered[questionNumber].optionA, for: UIControl.State.normal)
            optionB.setTitle(filtered[questionNumber].optionB, for: UIControl.State.normal)
            optionC.setTitle(filtered[questionNumber].optionC, for: UIControl.State.normal)
            optionD.setTitle(filtered[questionNumber].optionD, for: UIControl.State.normal)
            selectedAnswer = filtered[questionNumber].correctAnswer
            answerLabel.text = "\(filtered[questionNumber].correctAnswer)"
            updateUI()
        }
        else {
            let alert = UIAlertController(title: "Awesome", message: "End of Quiz. Do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "OK", style: .default, handler: {_ in
                //action in self.restartQuiz()
                self.dismiss(animated: true, completion: nil)
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
        }
        
        
    }
    
    func updateUI(){
        scoreLabel.text = "Score: \(score)"
        print("Score: \(score)")
        questionCounter.text = "\(questionNumber + 1)/\(filtered.count)"
        progressView.frame.size.width = (view.frame.size.width / CGFloat(filtered.count)) * CGFloat(questionNumber + 1)
    }
    
    func restartQuiz(){
        score = 0
        questionNumber = 0
        updateQuestion()
        
    }
}

