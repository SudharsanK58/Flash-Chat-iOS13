import UIKit
import CLTypingLabel
import CocoaMQTT

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: CLTypingLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "🍮ZusanChat🍮"
    }
    
}

