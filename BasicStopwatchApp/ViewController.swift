
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var myTimer = Timer()
    var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
            pauseButton.isEnabled = false
            resetButton.isEnabled = false
    }
    @IBAction func startButtonClicked(_ sender: Any)
    {
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerRun), userInfo: nil, repeats: true)
        startButton.isEnabled = false
        resetButton.isEnabled = true
        pauseButton.isEnabled = true
    }
    @objc func timerRun()
    {
       counter += 1
       timeLabel.text = String(counter)
    }
    @IBAction func pauseButtonClicked(_ sender: Any)
    {
            myTimer.invalidate()
            startButton.isEnabled = true
    }
    @IBAction func resetButtonClicked(_ sender: Any)
    {
        myTimer.invalidate()
        counter = 0
        timeLabel.text = String(counter)
        startButton.isEnabled = true
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
    }
    @IBAction func exitButtonClicked(_ sender: Any)
    {
        UIControl().sendAction(#selector(NSXPCConnection.suspend), to: UIApplication.shared, for: nil)
    }
    

}

