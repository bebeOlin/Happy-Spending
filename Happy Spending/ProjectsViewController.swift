//
//  ProjectsViewController.swift
//  Happy Spending
//
//  Created by Bruce Bolin on 10/1/21.
//

import UIKit
import CoreData

class ProjectsViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var peoplePicker: UIButton!
    @IBOutlet weak var homeBase: UIButton!
    @IBOutlet weak var firstBase: UIButton!
    @IBOutlet weak var secondBase: UIButton!
    @IBOutlet weak var thirdBase: UIButton!
    @IBOutlet weak var fourthBase: UIButton!
    @IBOutlet weak var fifthBase: UIButton!
    @IBOutlet weak var sixthBase: UIButton!
    @IBOutlet weak var seventhBase: UIButton!
    @IBOutlet weak var eighthBase: UIButton!
    @IBOutlet weak var ninthBase: UIButton!
    @IBOutlet weak var homeBaseValue: UILabel!
    @IBOutlet weak var thirdBaseValue: UILabel!
    @IBOutlet weak var secondBaseValue: UILabel!
    @IBOutlet weak var firstBaseValue: UILabel!
    @IBOutlet weak var fourthBaseValue: UILabel!
    @IBOutlet weak var fifthBaseValue: UILabel!
    @IBOutlet weak var sixthBaseValue: UILabel!
    @IBOutlet weak var seventhBaseValue: UILabel!
    @IBOutlet weak var eighthBaseValue: UILabel!
    @IBOutlet weak var ninthBaseValue: UILabel!
    @IBOutlet weak var moneySpent: UILabel!
    @IBOutlet weak var moneyRemaining: UILabel!
    @IBOutlet weak var projectsBackground: UIImageView!
    var newValue: Int64 = 0
    var spentValue: Int64 = 0
    var remainingValue: Int64 = 0
    var homeBaseSum: Int64 = 0
    var firstBaseSum: Int64 = 0
    var secondBaseSum: Int64 = 0
    var thirdBaseSum: Int64 = 0
    var fourthBaseSum: Int64 = 0
    var fifthBaseSum: Int64 = 0
    var sixthBaseSum: Int64 = 0
    var seventhBaseSum: Int64 = 0
    var eighthBaseSum: Int64 = 0
    var ninthBaseSum: Int64 = 0
    var newProjectTitle = ""
    var setBackground = UIImage.init(imageLiteralResourceName: "Bluer")
    var currentTile = ""
    var basePicked = ""
    var peoplePic = ""
    var updatedValueObserver: NSObjectProtocol?
    var newHomeBaseImage = ""
    var newFirstBaseImage = ""
    var newSecondBaseImage = ""
    var newThirdBaseImage = ""
    var newFourthBaseImage = ""
    var newFifthBaseImage = ""
    var newSixthBaseImage = ""
    var newSeventhBaseImage = ""
    var newEighthBaseImage = ""
    var newNinthBaseImage = ""
    let currencyFormat = NumberFormatter()
    var homeBaseAnimate = false
    var firstBaseAnimate = false
    var secondBaseAnimate = false
    var thirdBaseAnimate = false
    var fourthBaseAnimate = false
    var fifthBaseAnimate = false
    var sixthBaseAnimate = false
    var seventhBaseAnimate = false
    var eighthBaseAnimate = false
    var ninthBaseAnimate = false
    var peopleTConstraint = NSLayoutConstraint()
    var peopleVConstraint = NSLayoutConstraint()
    var peopleHConstraint = NSLayoutConstraint()
    var peopleHeight = NSLayoutConstraint()
    var peopleWidth = NSLayoutConstraint()
    var homeVConstraint = NSLayoutConstraint()
    var homeHConstraint = NSLayoutConstraint()
    var homeHeight = NSLayoutConstraint()
    var homeWidth = NSLayoutConstraint()
    var firstVConstraint = NSLayoutConstraint()
    var firstHConstraint = NSLayoutConstraint()
    var firstHeight = NSLayoutConstraint()
    var firstWidth = NSLayoutConstraint()
    var secondVConstraint = NSLayoutConstraint()
    var secondHConstraint = NSLayoutConstraint()
    var secondHeight = NSLayoutConstraint()
    var secondWidth = NSLayoutConstraint()
    var thirdVConstraint = NSLayoutConstraint()
    var thirdHConstraint = NSLayoutConstraint()
    var thirdHeight = NSLayoutConstraint()
    var thirdWidth = NSLayoutConstraint()
    var fourthVConstraint = NSLayoutConstraint()
    var fourthHConstraint = NSLayoutConstraint()
    var fourthHeight = NSLayoutConstraint()
    var fourthWidth = NSLayoutConstraint()
    var fifthVConstraint = NSLayoutConstraint()
    var fifthHConstraint = NSLayoutConstraint()
    var fifthHeight = NSLayoutConstraint()
    var fifthWidth = NSLayoutConstraint()
    var sixthVConstraint = NSLayoutConstraint()
    var sixthHConstraint = NSLayoutConstraint()
    var sixthHeight = NSLayoutConstraint()
    var sixthWidth = NSLayoutConstraint()
    var seventhVConstraint = NSLayoutConstraint()
    var seventhHConstraint = NSLayoutConstraint()
    var seventhHeight = NSLayoutConstraint()
    var seventhWidth = NSLayoutConstraint()
    var eighthVConstraint = NSLayoutConstraint()
    var eighthHConstraint = NSLayoutConstraint()
    var eighthHeight = NSLayoutConstraint()
    var eighthWidth = NSLayoutConstraint()
    var ninthVConstraint = NSLayoutConstraint()
    var ninthHConstraint = NSLayoutConstraint()
    var ninthHeight = NSLayoutConstraint()
    var ninthWidth = NSLayoutConstraint()
    var homeBaseValueY = NSLayoutConstraint()
    var homeBaseValueX = NSLayoutConstraint()
    var homeBaseValueH = NSLayoutConstraint()
    var firstBaseValueY = NSLayoutConstraint()
    var firstBaseValueX = NSLayoutConstraint()
    var firstBaseValueH = NSLayoutConstraint()
    var secondBaseValueY = NSLayoutConstraint()
    var secondBaseValueX = NSLayoutConstraint()
    var secondBaseValueH = NSLayoutConstraint()
    var thirdBaseValueY = NSLayoutConstraint()
    var thirdBaseValueX = NSLayoutConstraint()
    var thirdBaseValueH = NSLayoutConstraint()
    var fourthBaseValueY = NSLayoutConstraint()
    var fourthBaseValueX = NSLayoutConstraint()
    var fourthBaseValueH = NSLayoutConstraint()
    var fifthBaseValueY = NSLayoutConstraint()
    var fifthBaseValueX = NSLayoutConstraint()
    var fifthBaseValueH = NSLayoutConstraint()
    var sixthBaseValueY = NSLayoutConstraint()
    var sixthBaseValueX = NSLayoutConstraint()
    var sixthBaseValueH = NSLayoutConstraint()
    var seventhBaseValueY = NSLayoutConstraint()
    var seventhBaseValueX = NSLayoutConstraint()
    var seventhBaseValueH = NSLayoutConstraint()
    var eighthBaseValueY = NSLayoutConstraint()
    var eighthBaseValueX = NSLayoutConstraint()
    var eighthBaseValueH = NSLayoutConstraint()
    var ninthBaseValueY = NSLayoutConstraint()
    var ninthBaseValueX = NSLayoutConstraint()
    var ninthBaseValueH = NSLayoutConstraint()
    let screenSize: CGRect = UIScreen.main.bounds
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyFormat.usesGroupingSeparator = true
        currencyFormat.numberStyle = .currency
        currencyFormat.locale = Locale.current
        currencyFormat.maximumFractionDigits = 0
        loadProject()
        homeBaseAnimate = UserDefaults.standard.bool(forKey: newHomeBaseImage)
        firstBaseAnimate = UserDefaults.standard.bool(forKey: newFirstBaseImage)
        secondBaseAnimate = UserDefaults.standard.bool(forKey: newSecondBaseImage)
        thirdBaseAnimate = UserDefaults.standard.bool(forKey: newThirdBaseImage)
        fourthBaseAnimate = UserDefaults.standard.bool(forKey: newFourthBaseImage)
        fifthBaseAnimate = UserDefaults.standard.bool(forKey: newFifthBaseImage)
        sixthBaseAnimate = UserDefaults.standard.bool(forKey: newSixthBaseImage)
        seventhBaseAnimate = UserDefaults.standard.bool(forKey: newSeventhBaseImage)
        eighthBaseAnimate = UserDefaults.standard.bool(forKey: newEighthBaseImage)
        ninthBaseAnimate = UserDefaults.standard.bool(forKey: newNinthBaseImage)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        spentValue = homeBaseSum + firstBaseSum + secondBaseSum + thirdBaseSum + fourthBaseSum + fifthBaseSum + sixthBaseSum + seventhBaseSum + eighthBaseSum + ninthBaseSum
        remainingValue = newValue - spentValue
        let spentCurrency = currencyFormat.string(from: NSNumber(value: spentValue))
        let remainingCurrency = currencyFormat.string(from: NSNumber(value: remainingValue))
        let homeSumCurrency = currencyFormat.string(from: NSNumber(value: homeBaseSum))
        let firstSumCurrency = currencyFormat.string(from: NSNumber(value: firstBaseSum))
        let secondSumCurrency = currencyFormat.string(from: NSNumber(value: secondBaseSum))
        let thirdSumCurrency = currencyFormat.string(from: NSNumber(value: thirdBaseSum))
        let fourthSumCurrency = currencyFormat.string(from: NSNumber(value: fourthBaseSum))
        let fifthSumCurrency = currencyFormat.string(from: NSNumber(value: fifthBaseSum))
        let sixthSumCurrency = currencyFormat.string(from: NSNumber(value: sixthBaseSum))
        let seventhSumCurrency = currencyFormat.string(from: NSNumber(value: seventhBaseSum))
        let eighthSumCurrency = currencyFormat.string(from: NSNumber(value: eighthBaseSum))
        let ninthSumCurrency = currencyFormat.string(from: NSNumber(value: ninthBaseSum))
        let staticProjectValue = currencyFormat.string(from: NSNumber(value: newValue))
        projectsBackground.image = setBackground
        if newProjectTitle != "" {
            title = newProjectTitle
        } else {
            title = "\(staticProjectValue!)"
        }
        loadImages()
        homeBase.newCircle()
        firstBase.newCircle()
        secondBase.newCircle()
        thirdBase.newCircle()
        fourthBase.newCircle()
        fifthBase.newCircle()
        sixthBase.newCircle()
        seventhBase.newCircle()
        eighthBase.newCircle()
        ninthBase.newCircle()
        peoplePicker.imageView?.contentMode = .scaleAspectFill
        homeBase.imageView?.contentMode = .scaleAspectFill
        firstBase.imageView?.contentMode = .scaleAspectFill
        secondBase.imageView?.contentMode = .scaleAspectFill
        thirdBase.imageView?.contentMode = .scaleAspectFill
        fourthBase.imageView?.contentMode = .scaleAspectFill
        fifthBase.imageView?.contentMode = .scaleAspectFill
        sixthBase.imageView?.contentMode = .scaleAspectFill
        seventhBase.imageView?.contentMode = .scaleAspectFill
        eighthBase.imageView?.contentMode = .scaleAspectFill
        ninthBase.imageView?.contentMode = .scaleAspectFill
        moneySpent.textColor = .systemRed
        moneyRemaining.textColor = .systemGreen
        if let safeSpent = spentCurrency {
            moneySpent.text = "\(safeSpent)"
        }
        if let safeRemaining = remainingCurrency {
            moneyRemaining.text = "\(safeRemaining)"
        }
        if let homeSum = homeSumCurrency {
            homeBaseValue.text = "\(homeSum)"
        }
        if let firstSum = firstSumCurrency {
            firstBaseValue.text = "\(firstSum)"
        }
        if let secondSum = secondSumCurrency {
            secondBaseValue.text = "\(secondSum)"
        }
        if let thirdSum = thirdSumCurrency {
            thirdBaseValue.text = "\(thirdSum)"
        }
        if let fourthSum = fourthSumCurrency {
            fourthBaseValue.text = "\(fourthSum)"
        }
        if let fifthSum = fifthSumCurrency {
            fifthBaseValue.text = "\(fifthSum)"
        }
        if let sixthSum = sixthSumCurrency {
            sixthBaseValue.text = "\(sixthSum)"
        }
        if let seventhSum = seventhSumCurrency {
            seventhBaseValue.text = "\(seventhSum)"
        }
        if let eighthSum = eighthSumCurrency {
            eighthBaseValue.text = "\(eighthSum)"
        }
        if let ninthSum = ninthSumCurrency {
            ninthBaseValue.text = "\(ninthSum)"
        }
        updatedValueObserver = NotificationCenter.default.addObserver(forName: Notification.Name("updatedValue"), object: nil, queue: .main, using: { [self] (notification) in
            self.loadProject()
            self.loadImages()
            self.projectLayout()
            self.currencyFormat.usesGroupingSeparator = true
            self.currencyFormat.numberStyle = .currency
            self.currencyFormat.locale = Locale.current
            self.currencyFormat.maximumFractionDigits = 0
            self.spentValue = self.homeBaseSum + self.firstBaseSum + self.secondBaseSum + self.thirdBaseSum + self.fourthBaseSum + self.fifthBaseSum + self.sixthBaseSum + self.seventhBaseSum + self.eighthBaseSum + self.ninthBaseSum
            self.remainingValue = self.newValue - self.spentValue
            let sspentCurrency = self.currencyFormat.string(from: NSNumber(value: self.spentValue))
            let sremainingCurrency = self.currencyFormat.string(from: NSNumber(value: self.remainingValue))
            let shomeSumCurrency = self.currencyFormat.string(from: NSNumber(value: self.homeBaseSum))
            let sfirstSumCurrency = self.currencyFormat.string(from: NSNumber(value: self.firstBaseSum))
            let ssecondSumCurrency = self.currencyFormat.string(from: NSNumber(value: self.secondBaseSum))
            let sthirdSumCurrency = self.currencyFormat.string(from: NSNumber(value: self.thirdBaseSum))
            let sfourthSumCurrency = self.currencyFormat.string(from: NSNumber(value: self.fourthBaseSum))
            let sfifthSumCurrency = self.currencyFormat.string(from: NSNumber(value: self.fifthBaseSum))
            let ssixthSumCurrency = self.currencyFormat.string(from: NSNumber(value: self.sixthBaseSum))
            let sseventhSumCurrency = self.currencyFormat.string(from: NSNumber(value: self.seventhBaseSum))
            let seighthSumCurrency = self.currencyFormat.string(from: NSNumber(value: self.eighthBaseSum))
            let sninthSumCurrency = self.currencyFormat.string(from: NSNumber(value: self.ninthBaseSum))
            if let ssafeSpent = sspentCurrency {
                self.moneySpent.text = "\(ssafeSpent)"
            }
            if let ssafeRemaining = sremainingCurrency {
                self.moneyRemaining.text = "\(ssafeRemaining)"
            }
            if let shomeSum = shomeSumCurrency {
                self.homeBaseValue.text = "\(shomeSum)"
            }
            if let sfirstSum = sfirstSumCurrency {
                self.firstBaseValue.text = "\(sfirstSum)"
            }
            if let ssecondSum = ssecondSumCurrency {
                self.secondBaseValue.text = "\(ssecondSum)"
            }
            if let sthirdSum = sthirdSumCurrency {
                self.thirdBaseValue.text = "\(sthirdSum)"
            }
            if let sfourthSum = sfourthSumCurrency {
                self.fourthBaseValue.text = "\(sfourthSum)"
            }
            if let sfifthSum = sfifthSumCurrency {
                self.fifthBaseValue.text = "\(sfifthSum)"
            }
            if let ssixthSum = ssixthSumCurrency {
                self.sixthBaseValue.text = "\(ssixthSum)"
            }
            if let sseventhSum = sseventhSumCurrency {
                self.seventhBaseValue.text = "\(sseventhSum)"
            }
            if let seighthSum = seighthSumCurrency {
                self.eighthBaseValue.text = "\(seighthSum)"
            }
            if let sninthSum = sninthSumCurrency {
                self.ninthBaseValue.text = "\(sninthSum)"
            }
        })
        setLayoutConstraints()
        projectLayout()
    }
    @IBAction func helpButton(_ sender: UIBarButtonItem) {
        if peoplePicker.imageView?.image == nil {
            let helpText = UILabel()
            helpText.text = "Set a Title and Image that represent your budget."
            helpText.textColor = .white
            if setBackground == UIImage.init(imageLiteralResourceName: "Teal") {
                helpText.textColor = .black
            }
            helpText.numberOfLines = 0
            helpText.frame = CGRect(x: peoplePicker.center.x - 100, y: view.center.y + 55, width: 200, height: 200)
            helpText.textAlignment = .center
            view.addSubview(helpText)
            helpText.alpha = 1
            UIView.animate(withDuration: 7) {
                helpText.alpha = 0
            }
        }
        if peoplePicker.imageView?.image != nil && firstBase.imageView?.image == nil {
            let helpText = UILabel()
            helpText.text = "Press the plus button to add an item!"
            helpText.textColor = .white
            if setBackground == UIImage.init(imageLiteralResourceName: "Teal") {
                helpText.textColor = .black
            }
            helpText.numberOfLines = 0
            helpText.frame = CGRect(x: peoplePicker.center.x - 100, y: view.center.y + 25, width: 200, height: 200)
            helpText.textAlignment = .center
            view.addSubview(helpText)
            helpText.alpha = 1
            UIView.animate(withDuration: 7) {
                helpText.alpha = 0
            }
        }
        if ninthBase.imageView?.image != nil {
            let alert = UIAlertController(title: "The End", message: "For now there is a limit of only ten items per budget.", preferredStyle: .alert)
            let newAlert = UIAlertController(title: "Because", message: "Unfortunately I am only one man. Perhaps one day I will be Legion. But, for now, these limitions are a direct result of a combination of my time and skill as a developer. If you love this, let me know, and I will make it a priority to add more! Either way, thanks for supporting me with a download. :)", preferredStyle: .alert)
            let anotherAlert = UIAlertController(title: "Apologies", message: "I understand your frustration. Again, if you find a way to contact me and let me know how dissappointed you are, I promise to build you something better.", preferredStyle: .alert)
            anotherAlert.addAction(UIAlertAction(title: "Thanks", style: .default, handler: nil))
            newAlert.addAction(UIAlertAction(title: "Sad", style: .cancel, handler: { action in
                self.present(anotherAlert, animated: true, completion: nil)
            }))
            newAlert.addAction(UIAlertAction(title: "Understood", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Why?", style: .cancel, handler: { action in
                self.present(newAlert, animated: true, completion: nil)
            }))
            alert.addAction(UIAlertAction(title: "Alright", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    func setLayoutConstraints() {
        peoplePicker.translatesAutoresizingMaskIntoConstraints = false
        let peopleHConstraintSet = NSLayoutConstraint(item: peoplePicker!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let peopleVConstraintSet = NSLayoutConstraint(item: peoplePicker!, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 300)
        let peopleHeightSet = NSLayoutConstraint(item: peoplePicker!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 200)
       let peopleWidthSet = NSLayoutConstraint(item: peoplePicker!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 200)
        peopleHConstraint = peopleHConstraintSet
        peopleVConstraint = peopleVConstraintSet
        peopleHeight = peopleHeightSet
        peopleWidth = peopleWidthSet
        peopleTConstraint = NSLayoutConstraint(item: peoplePicker!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: 0)
        homeBase.translatesAutoresizingMaskIntoConstraints = false
        let homeWidthSet = NSLayoutConstraint(item: homeBase!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
       let homeHeightSet = NSLayoutConstraint(item: homeBase!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        let homeHConstraintSet = NSLayoutConstraint(item: homeBase!, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 30)
       let homeVConstraintSet = NSLayoutConstraint(item: homeBase!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        homeWidth = homeWidthSet
        homeHeight = homeHeightSet
        homeHConstraint = homeHConstraintSet
        homeVConstraint = homeVConstraintSet
        homeBaseValue.translatesAutoresizingMaskIntoConstraints = false
        homeBaseValueH = NSLayoutConstraint(item: homeBaseValue!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 17)
        homeBaseValueY = NSLayoutConstraint(item: homeBaseValue!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: homeBase!, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 5)
        homeBaseValueX = NSLayoutConstraint(item: homeBaseValue!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: homeBase!, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        firstBase.translatesAutoresizingMaskIntoConstraints = false
        firstHeight = NSLayoutConstraint(item: firstBase!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        firstWidth = NSLayoutConstraint(item: firstBase!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        firstVConstraint = NSLayoutConstraint(item: firstBase!, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 30)
        firstHConstraint = NSLayoutConstraint(item: firstBase!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        firstBaseValue.translatesAutoresizingMaskIntoConstraints = false
        firstBaseValueH = NSLayoutConstraint(item: firstBaseValue!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 17)
        firstBaseValueY = NSLayoutConstraint(item: firstBaseValue!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: firstBase!, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 5)
        firstBaseValueX = NSLayoutConstraint(item: firstBaseValue!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: firstBase!, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        secondBase.translatesAutoresizingMaskIntoConstraints = false
        secondHeight = NSLayoutConstraint(item: secondBase!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        secondWidth = NSLayoutConstraint(item: secondBase!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        secondVConstraint = NSLayoutConstraint(item: secondBase!, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 30)
        secondHConstraint = NSLayoutConstraint(item: secondBase!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        secondBaseValue.translatesAutoresizingMaskIntoConstraints = false
        secondBaseValueH = NSLayoutConstraint(item: secondBaseValue!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 17)
        secondBaseValueY = NSLayoutConstraint(item: secondBaseValue!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: secondBase!, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 5)
        secondBaseValueX = NSLayoutConstraint(item: secondBaseValue!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: secondBase!, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        thirdBase.translatesAutoresizingMaskIntoConstraints = false
        thirdHeight = NSLayoutConstraint(item: thirdBase!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        thirdWidth = NSLayoutConstraint(item: thirdBase!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        thirdVConstraint = NSLayoutConstraint(item: thirdBase!, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 30)
        thirdHConstraint = NSLayoutConstraint(item: thirdBase!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        thirdBaseValue.translatesAutoresizingMaskIntoConstraints = false
        thirdBaseValueH = NSLayoutConstraint(item: thirdBaseValue!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 17)
        thirdBaseValueY = NSLayoutConstraint(item: thirdBaseValue!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: thirdBase!, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 5)
        thirdBaseValueX = NSLayoutConstraint(item: thirdBaseValue!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: thirdBase!, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        fourthBase.translatesAutoresizingMaskIntoConstraints = false
        fourthHeight = NSLayoutConstraint(item: fourthBase!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        fourthWidth = NSLayoutConstraint(item: fourthBase!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        fourthVConstraint = NSLayoutConstraint(item: fourthBase!, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 30)
        fourthHConstraint = NSLayoutConstraint(item: fourthBase!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        fourthBaseValue.translatesAutoresizingMaskIntoConstraints = false
        fourthBaseValueH = NSLayoutConstraint(item: fourthBaseValue!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 17)
        fourthBaseValueY = NSLayoutConstraint(item: fourthBaseValue!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: fourthBase!, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 5)
        fourthBaseValueX = NSLayoutConstraint(item: fourthBaseValue!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: fourthBase!, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        fifthBase.translatesAutoresizingMaskIntoConstraints = false
        fifthHeight = NSLayoutConstraint(item: fifthBase!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        fifthWidth = NSLayoutConstraint(item: fifthBase!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        fifthVConstraint = NSLayoutConstraint(item: fifthBase!, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 30)
        fifthHConstraint = NSLayoutConstraint(item: fifthBase!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        fifthBaseValue.translatesAutoresizingMaskIntoConstraints = false
        fifthBaseValueH = NSLayoutConstraint(item: fifthBaseValue!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 17)
        fifthBaseValueY = NSLayoutConstraint(item: fifthBaseValue!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: fifthBase!, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 5)
        fifthBaseValueX = NSLayoutConstraint(item: fifthBaseValue!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: fifthBase!, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        sixthBase.translatesAutoresizingMaskIntoConstraints = false
        sixthHeight = NSLayoutConstraint(item: sixthBase!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        sixthWidth = NSLayoutConstraint(item: sixthBase!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        sixthVConstraint = NSLayoutConstraint(item: sixthBase!, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 30)
        sixthHConstraint = NSLayoutConstraint(item: sixthBase!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        sixthBaseValue.translatesAutoresizingMaskIntoConstraints = false
        sixthBaseValueH = NSLayoutConstraint(item: sixthBaseValue!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 17)
        sixthBaseValueY = NSLayoutConstraint(item: sixthBaseValue!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: sixthBase!, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 5)
        sixthBaseValueX = NSLayoutConstraint(item: sixthBaseValue!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: sixthBase!, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        seventhBase.translatesAutoresizingMaskIntoConstraints = false
        seventhHeight = NSLayoutConstraint(item: seventhBase!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        seventhWidth = NSLayoutConstraint(item: seventhBase!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        seventhVConstraint = NSLayoutConstraint(item: seventhBase!, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 30)
        seventhHConstraint = NSLayoutConstraint(item: seventhBase!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        seventhBaseValue.translatesAutoresizingMaskIntoConstraints = false
        seventhBaseValueH = NSLayoutConstraint(item: seventhBaseValue!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 17)
        seventhBaseValueY = NSLayoutConstraint(item: seventhBaseValue!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: seventhBase!, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 5)
        seventhBaseValueX = NSLayoutConstraint(item: seventhBaseValue!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: seventhBase!, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        eighthBase.translatesAutoresizingMaskIntoConstraints = false
        eighthHeight = NSLayoutConstraint(item: eighthBase!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        eighthWidth = NSLayoutConstraint(item: eighthBase!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        eighthVConstraint = NSLayoutConstraint(item: eighthBase!, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 30)
        eighthHConstraint = NSLayoutConstraint(item: eighthBase!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        eighthBaseValue.translatesAutoresizingMaskIntoConstraints = false
        eighthBaseValueH = NSLayoutConstraint(item: eighthBaseValue!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 17)
        eighthBaseValueY = NSLayoutConstraint(item: eighthBaseValue!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: eighthBase!, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 5)
        eighthBaseValueX = NSLayoutConstraint(item: eighthBaseValue!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: eighthBase!, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        ninthBase.translatesAutoresizingMaskIntoConstraints = false
        ninthHeight = NSLayoutConstraint(item: ninthBase!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        ninthWidth = NSLayoutConstraint(item: ninthBase!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        ninthVConstraint = NSLayoutConstraint(item: ninthBase!, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 10)
        ninthHConstraint = NSLayoutConstraint(item: ninthBase!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        ninthBaseValue.translatesAutoresizingMaskIntoConstraints = false
        ninthBaseValueH = NSLayoutConstraint(item: ninthBaseValue!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 17)
        ninthBaseValueY = NSLayoutConstraint(item: ninthBaseValue!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: ninthBase!, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 5)
        ninthBaseValueX = NSLayoutConstraint(item: ninthBaseValue!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: ninthBase!, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([peopleVConstraint, peopleHConstraint, peopleHeight,
                                                       peopleWidth,
                                                       homeVConstraint,
                                                       homeHConstraint,
                                                       homeHeight,
                                                       homeWidth,
                                                       firstVConstraint,
                                                       firstHConstraint,
                                                       firstHeight,
                                                       firstWidth,
                                                       secondVConstraint,
                                                       secondHConstraint,
                                                       secondHeight,
                                                       secondWidth,
                                                       thirdVConstraint,
                                                       thirdHConstraint,
                                                       thirdHeight,
                                                       thirdWidth,
                                                       fourthVConstraint,
                                                       fourthHConstraint,
                                                       fourthHeight,
                                                       fourthWidth,
                                                       fifthVConstraint,
                                                       fifthHConstraint,
                                                       fifthHeight,
                                                       fifthWidth,
                                                       sixthVConstraint,
                                                       sixthHConstraint,
                                                       sixthHeight,
                                                       sixthWidth,
                                                       seventhVConstraint,
                                                       seventhHConstraint,
                                                       seventhHeight,
                                                       seventhWidth,
                                                       eighthVConstraint,
                                                       eighthHConstraint,
                                                       eighthHeight,
                                                       eighthWidth,
                                                       ninthVConstraint,
                                                       ninthHConstraint,
                                                       ninthHeight,
                                                       ninthWidth,
                                                       homeBaseValueY,
                                                       homeBaseValueX,
                                                       homeBaseValueH,
                                                       firstBaseValueY,
                                                       firstBaseValueX,
                                                       firstBaseValueH,
                                                       secondBaseValueY,
                                                       secondBaseValueX,
                                                       secondBaseValueH,
                                                       thirdBaseValueY,
                                                       thirdBaseValueX,
                                                       thirdBaseValueH,
                                                   fourthBaseValueY,
                                                   fourthBaseValueX,
                                                   fourthBaseValueH,
                                                   fifthBaseValueY,
                                                   fifthBaseValueX,
                                                   fifthBaseValueH,
                                                   sixthBaseValueY,
                                                   sixthBaseValueX,
                                                   sixthBaseValueH,
                                                   seventhBaseValueY,
                                                   seventhBaseValueX,
                                                   seventhBaseValueH,
                                                   eighthBaseValueY,
                                                   eighthBaseValueX,
                                                   eighthBaseValueH,
                                                   ninthBaseValueY,
                                                   ninthBaseValueX,
                                                   ninthBaseValueH
                                                  ])
    }
    func projectLayout() {
        homeBase.alpha = 0
        firstBase.alpha = 0
        secondBase.alpha = 0
        thirdBase.alpha = 0
        fourthBase.alpha = 0
        fifthBase.alpha = 0
        sixthBase.alpha = 0
        seventhBase.alpha = 0
        eighthBase.alpha = 0
        ninthBase.alpha = 0
        homeBaseValue.alpha = 0
        firstBaseValue.alpha = 0
        secondBaseValue.alpha = 0
        thirdBaseValue.alpha = 0
        fourthBaseValue.alpha = 0
        fifthBaseValue.alpha = 0
        sixthBaseValue.alpha = 0
        seventhBaseValue.alpha = 0
        eighthBaseValue.alpha = 0
        ninthBaseValue.alpha = 0
        peopleVConstraint.constant = 300
        peopleHConstraint.constant = 0
        self.peoplePicker.frame.size.height = 200
        self.peoplePicker.frame.size.width = 200
        self.peoplePicker.newCircle()
        peoplePicker.center.x = view.center.x
        peoplePicker.center.y = projectsBackground.directionalLayoutMargins.top + 300
        if peoplePicker.imageView?.image != nil {
            homeBase.alpha = 1
            homeBase.frame.size.height = 100
            homeBase.frame.size.width = 100
            homeBase.center.y = view.center.y
            homeBase.center.x = view.center.x
            peopleVConstraint.isActive = false
            peopleTConstraint.isActive = true
            if screenSize.width < 390 {
            peopleWidth.constant = 100
            peopleHeight.constant = 100
            peoplePicker.frame.size.height = 100
            peoplePicker.frame.size.width = 100
            } else {
                peopleWidth.constant = 150
                peopleHeight.constant = 150
                peoplePicker.frame.size.height = 150
                peoplePicker.frame.size.width = 150
            }
            peopleHConstraint.constant = 0
            peoplePicker.newCircle()
            peoplePicker.center.x = view.center.x
            peoplePicker.directionalLayoutMargins.top = view.directionalLayoutMargins.top
        } else {
            peopleWidth.constant = 200
            peopleHeight.constant = 200
            peopleHConstraint.constant = 0
            peopleVConstraint.constant = 0
            homeBaseAnimate = false
            firstBaseAnimate = false
            secondBaseAnimate = false
            thirdBaseAnimate = false
            fourthBaseAnimate = false
            fifthBaseAnimate = false
            sixthBaseAnimate = false
            seventhBaseAnimate = false
            eighthBaseAnimate = false
            UserDefaults.standard.setValue(self.homeBaseAnimate, forKey: newHomeBaseImage)
            UserDefaults.standard.setValue(self.firstBaseAnimate, forKey: newFirstBaseImage)
            UserDefaults.standard.setValue(self.secondBaseAnimate, forKey: newSecondBaseImage)
            UserDefaults.standard.setValue(self.thirdBaseAnimate, forKey: newThirdBaseImage)
            UserDefaults.standard.setValue(self.fourthBaseAnimate, forKey: newFourthBaseImage)
            UserDefaults.standard.setValue(self.fifthBaseAnimate, forKey: newFifthBaseImage)
            UserDefaults.standard.setValue(self.sixthBaseAnimate, forKey: newSixthBaseImage)
            UserDefaults.standard.setValue(self.seventhBaseAnimate, forKey: newSeventhBaseImage)
            UserDefaults.standard.setValue(self.eighthBaseAnimate, forKey: newEighthBaseImage)
            UserDefaults.standard.setValue(self.ninthBaseAnimate, forKey: newNinthBaseImage)
        }
        if homeBase.imageView?.image != nil && view != nil {
            view.bringSubviewToFront(homeBase)
            firstBase.alpha = 1
            firstBase.frame.size.height = 100
            firstBase.frame.size.width = 100
            firstBase.center.y = view.center.y + 30
            firstBase.center.x = view.center.x
            if firstBase.imageView?.image == nil && homeBaseAnimate == false {
            UIView.animate(withDuration: 0.5) {
                self.homeHConstraint.constant = -80
                self.homeVConstraint.constant = -100
                self.homeBase.center.y -= 100
                self.homeBase.center.x -= 100
            } completion: { done in
                if done {
                    self.homeBaseValue.alpha = 1
                }
            }
                self.homeBaseAnimate = true
                UserDefaults.standard.setValue(self.homeBaseAnimate, forKey: newHomeBaseImage)
                print(self.homeBaseAnimate)
            } else {
                homeBaseValue.alpha = 1
                homeHConstraint.constant = -80
                homeVConstraint.constant = -100
                homeBase.center.y -= 100
                homeBase.center.x -= 100
            }
        }
        if firstBase.imageView?.image != nil && view != nil {
            view.bringSubviewToFront(firstBase)
            secondBase.alpha = 1
            secondBase.frame.size.height = 100
            secondBase.frame.size.width = 100
            secondBase.center.y = view.center.y + 30
            secondBase.center.x = view.center.x
            if secondBase.imageView?.image == nil && firstBaseAnimate == false {
            UIView.animate(withDuration: 0.5) {
                self.firstVConstraint.constant = 180
                self.firstHConstraint.constant = 100
                self.firstBase.center.y += 150
                self.firstBase.center.x += 100
            } completion: { done in
                if done {
                    self.firstBaseValue.alpha = 1
                }
            }
                self.firstBaseAnimate = true
                UserDefaults.standard.setValue(self.firstBaseAnimate, forKey: newFirstBaseImage)
        } else {
            firstBaseValue.alpha = 1
            firstVConstraint.constant = 180
            firstHConstraint.constant = 100
            firstBase.center.y += 150
            firstBase.center.x += 100
        }
        }
        if secondBase.imageView?.image != nil && view != nil {
            view.bringSubviewToFront(secondBase)
            thirdBase.alpha = 1
            thirdBase.frame.size.height = 100
            thirdBase.frame.size.width = 100
            thirdBase.center.y = view.center.y + 30
            thirdBase.center.x = view.center.x
            if thirdBase.imageView?.image == nil && secondBaseAnimate == false {
            UIView.animate(withDuration: 0.5) {
                self.secondVConstraint.constant = 180
                self.secondHConstraint.constant = -100
                self.secondBase.center.y += 150
                self.secondBase.center.x -= 100
            } completion: { done in
                if done {
                    self.secondBaseValue.alpha = 1
                }
            }
                self.secondBaseAnimate = true
                UserDefaults.standard.setValue(self.secondBaseAnimate, forKey: newSecondBaseImage)
            } else {
                secondBaseValue.alpha = 1
                secondVConstraint.constant = 180
                secondHConstraint.constant = -100
                secondBase.center.y += 150
                secondBase.center.x -= 100
            }
        }
        if thirdBase.imageView?.image != nil && view != nil {
            view.bringSubviewToFront(thirdBase)
            fourthBase.alpha = 1
            fourthBase.frame.size.height = 100
            fourthBase.frame.size.width = 100
            fourthBase.center.y = view.center.y + 30
            fourthBase.center.x = view.center.x
            if fourthBase.imageView?.image == nil && thirdBaseAnimate == false {
            UIView.animate(withDuration: 0.5) {
                self.thirdVConstraint.constant = -80
                self.thirdHConstraint.constant = 100
                self.thirdBase.center.y -= 130
                self.thirdBase.center.x += 100
            } completion: { done in
                if done {
                    self.thirdBaseValue.alpha = 1
                }
            }
                self.thirdBaseAnimate = true
                UserDefaults.standard.setValue(self.thirdBaseAnimate, forKey: newThirdBaseImage)
            } else {
                thirdBaseValue.alpha = 1
                thirdVConstraint.constant = -80
                thirdHConstraint.constant = 100
                thirdBase.center.y -= 130
                thirdBase.center.x += 100
            }
        }
        if fourthBase.imageView?.image != nil && view != nil {
            view.bringSubviewToFront(fourthBase)
            fifthBase.alpha = 1
            fifthBase.frame.size.height = 100
            fifthBase.frame.size.width = 100
            fifthBase.center.y = view.center.y + 30
            fifthBase.center.x = view.center.x
            if fifthBase.imageView?.image == nil && fourthBaseAnimate == false {
            UIView.animate(withDuration: 0.5) {
                self.fourthVConstraint.constant = -120
                self.fourthHConstraint.constant = 0
                self.fourthBase.center.y -= 150
                self.fourthBase.center.x = self.view.center.x
            } completion: { done in
                if done {
                    self.fourthBaseValue.alpha = 1
                }
            }
                self.fourthBaseAnimate = true
                UserDefaults.standard.setValue(self.fourthBaseAnimate, forKey: newFourthBaseImage)
            } else {
                fourthBaseValue.alpha = 1
                fourthVConstraint.constant = -120
                fourthHConstraint.constant = 0
                fourthBase.center.y -= 100
                fourthBase.center.x = view.center.x
            }
        }
        if fifthBase.imageView?.image != nil && view != nil {
            view.bringSubviewToFront(fifthBase)
            sixthBase.alpha = 1
            sixthBase.frame.size.height = 100
            sixthBase.frame.size.width = 100
            sixthBase.center.y = view.center.y + 30
            sixthBase.center.x = view.center.x
            if sixthBase.imageView?.image == nil && fifthBaseAnimate == false {
            UIView.animate(withDuration: 0.5) {
                self.fifthVConstraint.constant = 265
                self.fifthHConstraint.constant = 0
                self.fifthBase.center.y += 215
                self.fifthBase.center.x = self.view.center.x
            } completion: { done in
                if done {
                    self.fifthBaseValue.alpha = 1
                }
            }
                self.fifthBaseAnimate = true
                UserDefaults.standard.setValue(self.fifthBaseAnimate, forKey: newFifthBaseImage)
            } else {
                fifthBaseValue.alpha = 1
                fifthVConstraint.constant = 265
                fifthHConstraint.constant = 0
                fifthBase.center.y += 237
                fifthBase.center.x = view.center.x
            }
        }
        if sixthBase.imageView?.image != nil && view != nil {
            view.bringSubviewToFront(sixthBase)
            seventhBase.alpha = 1
            seventhBase.frame.size.height = 100
            seventhBase.frame.size.width = 100
            seventhBase.center.y = view.center.y + 30
            seventhBase.center.x = view.center.x
            if seventhBase.imageView?.image == nil && sixthBaseAnimate == false {
            UIView.animate(withDuration: 0.5) {
                self.sixthVConstraint.constant = 50
                self.sixthHConstraint.constant = -100
                self.sixthBase.center.x -= 100
            } completion: { done in
                if done {
                    self.sixthBaseValue.alpha = 1
                }
            }
                self.sixthBaseAnimate = true
                UserDefaults.standard.setValue(self.sixthBaseAnimate, forKey: newSixthBaseImage)
            } else {
                sixthBaseValue.alpha = 1
                sixthVConstraint.constant = 50
                sixthHConstraint.constant = -100
                sixthBase.center.y += 230
                sixthBase.center.x -= 100
            }
        }
        if seventhBase.imageView?.image != nil && view != nil {
            view.bringSubviewToFront(seventhBase)
            eighthBase.alpha = 1
            eighthBase.frame.size.height = 100
            eighthBase.frame.size.width = 100
            eighthBase.center.y = view.center.y + 30
            eighthBase.center.x = view.center.x
            if eighthBase.imageView?.image == nil && seventhBaseAnimate == false {
            UIView.animate(withDuration: 0.5) {
                self.seventhVConstraint.constant = 50
                self.seventhHConstraint.constant = 100
                self.seventhBase.center.x += 100
            } completion: { done in
                if done {
                    self.seventhBaseValue.alpha = 1
                }
            }
                self.seventhBaseAnimate = true
                UserDefaults.standard.setValue(self.seventhBaseAnimate, forKey: newSeventhBaseImage)
            } else {
                seventhBaseValue.alpha = 1
                self.seventhVConstraint.constant = 50
                self.seventhHConstraint.constant = 100
                seventhBase.center.y -= 100
                seventhBase.center.x += 100
            }
        }
        if eighthBase.imageView?.image != nil && view != nil {
            view.bringSubviewToFront(eighthBase)
            ninthBase.alpha = 1
            ninthBase.frame.size.height = 100
            ninthBase.frame.size.width = 100
            ninthBase.center.y = view.center.y + 30
            ninthBase.center.x = view.center.x
            if ninthBase.imageView?.image == nil && eighthBaseAnimate == false {
            UIView.animate(withDuration: 0.5) {
                self.eighthVConstraint.constant = 140
                self.eighthHConstraint.constant = 0
                self.eighthBase.center.y += 130
            } completion: { done in
                if done {
                    self.eighthBaseValue.alpha = 1
                }
            }
                self.eighthBaseAnimate = true
                UserDefaults.standard.setValue(self.eighthBaseAnimate, forKey: newEighthBaseImage)
            } else {
                eighthBaseValue.alpha = 1
                eighthVConstraint.constant = 140
                eighthHConstraint.constant = 0
                eighthBase.center.y += 150
            }
        }
        if ninthBase.imageView?.image != nil && view != nil {
            self.ninthBaseValue.alpha = 1
        }
    }
    func saveNewTitle() {
        let request = Project.fetchRequest() as NSFetchRequest<Project>
        let pred = NSPredicate(format: "name CONTAINS \(currentTile)")
        request.predicate = pred
        do {
            let project = try context.fetch(request)
            project.forEach { project in
                project.projectTitle = newProjectTitle
                do {
                    try context.save()
                } catch {
                }
            } 
        } catch {
            fatalError("Error")
        }
    }
    func loadProject() {
        switch currentTile {
        case "1":
            let request = Project.fetchRequest() as NSFetchRequest<Project>
            let pred = NSPredicate(format: "name CONTAINS 1")
            request.predicate = pred
            do {
                let project = try context.fetch(request)
                project.forEach { project in
                    self.newValue = project.projectValue
                    self.peoplePic = project.peoplePic ?? ""
                    homeBaseSum = project.homeBaseValue
                    firstBaseSum = project.firstBaseValue
                    secondBaseSum = project.secondBaseValue
                    thirdBaseSum = project.thirdBaseValue
                    fourthBaseSum = project.fourthBaseValue
                    fifthBaseSum = project.fifthBaseValue
                    sixthBaseSum = project.sixthBaseValue
                    seventhBaseSum = project.seventhBaseValue
                    eighthBaseSum = project.eighthBaseValue
                    ninthBaseSum = project.ninthBaseValue
                    if let title = project.projectTitle {
                        newProjectTitle = title
                    }
                    if let home = project.homeBasePic {
                        newHomeBaseImage = home
                    }
                    if let first = project.firstBasePic {
                        newFirstBaseImage = first
                    }
                    if let second = project.secondBasePic {
                        newSecondBaseImage = second
                    }
                    if let third = project.thirdBasePic {
                        newThirdBaseImage = third
                    }
                    if let fourth = project.fourthBasePic {
                        newFourthBaseImage = fourth
                    }
                    if let fifth = project.fifthBasePic {
                        newFifthBaseImage = fifth
                    }
                    if let sixth = project.sixthBasePic {
                        newSixthBaseImage = sixth
                    }
                    if let seventh = project.seventhBasePic {
                        newSeventhBaseImage = seventh
                    }
                    if let eighth = project.eighthBasePic {
                        newEighthBaseImage = eighth
                    }
                    if let ninth = project.ninthBasePic {
                        newNinthBaseImage = ninth
                    }
                }
            } catch {
                fatalError("Error")
            }
        case "2":
            let request = Project.fetchRequest() as NSFetchRequest<Project>
            let pred = NSPredicate(format: "name CONTAINS 2")
            request.predicate = pred
            do {
                let project = try context.fetch(request)
                project.forEach { project in
                    self.newValue = project.projectValue
                    self.peoplePic = project.peoplePic ?? ""
                    homeBaseSum = project.homeBaseValue
                    firstBaseSum = project.firstBaseValue
                    secondBaseSum = project.secondBaseValue
                    thirdBaseSum = project.thirdBaseValue
                    fourthBaseSum = project.fourthBaseValue
                    fifthBaseSum = project.fifthBaseValue
                    sixthBaseSum = project.sixthBaseValue
                    seventhBaseSum = project.seventhBaseValue
                    eighthBaseSum = project.eighthBaseValue
                    ninthBaseSum = project.ninthBaseValue
                    if let title = project.projectTitle {
                        newProjectTitle = title
                    }
                    if let home = project.homeBasePic {
                        newHomeBaseImage = home
                    }
                    if let first = project.firstBasePic {
                        newFirstBaseImage = first
                    }
                    if let second = project.secondBasePic {
                        newSecondBaseImage = second
                    }
                    if let third = project.thirdBasePic {
                        newThirdBaseImage = third
                    }
                    if let fourth = project.fourthBasePic {
                        newFourthBaseImage = fourth
                    }
                    if let fifth = project.fifthBasePic {
                        newFifthBaseImage = fifth
                    }
                    if let sixth = project.sixthBasePic {
                        newSixthBaseImage = sixth
                    }
                    if let seventh = project.seventhBasePic {
                        newSeventhBaseImage = seventh
                    }
                    if let eighth = project.eighthBasePic {
                        newEighthBaseImage = eighth
                    }
                    if let ninth = project.ninthBasePic {
                        newNinthBaseImage = ninth
                    }
                }
            } catch {
                fatalError("Error")
            }
        case "3":
            let request = Project.fetchRequest() as NSFetchRequest<Project>
            let pred = NSPredicate(format: "name CONTAINS 3")
            request.predicate = pred
            do {
                let project = try context.fetch(request)
                project.forEach { project in
                    self.newValue = project.projectValue
                    self.peoplePic = project.peoplePic ?? ""
                    homeBaseSum = project.homeBaseValue
                    firstBaseSum = project.firstBaseValue
                    secondBaseSum = project.secondBaseValue
                    thirdBaseSum = project.thirdBaseValue
                    fourthBaseSum = project.fourthBaseValue
                    fifthBaseSum = project.fifthBaseValue
                    sixthBaseSum = project.sixthBaseValue
                    seventhBaseSum = project.seventhBaseValue
                    eighthBaseSum = project.eighthBaseValue
                    ninthBaseSum = project.ninthBaseValue
                    if let title = project.projectTitle {
                        newProjectTitle = title
                    }
                    if let home = project.homeBasePic {
                        newHomeBaseImage = home
                    }
                    if let first = project.firstBasePic {
                        newFirstBaseImage = first
                    }
                    if let second = project.secondBasePic {
                        newSecondBaseImage = second
                    }
                    if let third = project.thirdBasePic {
                        newThirdBaseImage = third
                    }
                    if let fourth = project.fourthBasePic {
                        newFourthBaseImage = fourth
                    }
                    if let fifth = project.fifthBasePic {
                        newFifthBaseImage = fifth
                    }
                    if let sixth = project.sixthBasePic {
                        newSixthBaseImage = sixth
                    }
                    if let seventh = project.seventhBasePic {
                        newSeventhBaseImage = seventh
                    }
                    if let eighth = project.eighthBasePic {
                        newEighthBaseImage = eighth
                    }
                    if let ninth = project.ninthBasePic {
                        newNinthBaseImage = ninth
                    }
                }
            } catch {
                fatalError("Error")
            }
        case "4":
            let request = Project.fetchRequest() as NSFetchRequest<Project>
            let pred = NSPredicate(format: "name CONTAINS 4")
            request.predicate = pred
            do {
                let project = try context.fetch(request)
                project.forEach { project in
                    self.newValue = project.projectValue
                    self.peoplePic = project.peoplePic ?? ""
                    homeBaseSum = project.homeBaseValue
                    firstBaseSum = project.firstBaseValue
                    secondBaseSum = project.secondBaseValue
                    thirdBaseSum = project.thirdBaseValue
                    fourthBaseSum = project.fourthBaseValue
                    fifthBaseSum = project.fifthBaseValue
                    sixthBaseSum = project.sixthBaseValue
                    seventhBaseSum = project.seventhBaseValue
                    eighthBaseSum = project.eighthBaseValue
                    ninthBaseSum = project.ninthBaseValue
                    if let title = project.projectTitle {
                        newProjectTitle = title
                    }
                    if let home = project.homeBasePic {
                        newHomeBaseImage = home
                    }
                    if let first = project.firstBasePic {
                        newFirstBaseImage = first
                    }
                    if let second = project.secondBasePic {
                        newSecondBaseImage = second
                    }
                    if let third = project.thirdBasePic {
                        newThirdBaseImage = third
                    }
                    if let fourth = project.fourthBasePic {
                        newFourthBaseImage = fourth
                    }
                    if let fifth = project.fifthBasePic {
                        newFifthBaseImage = fifth
                    }
                    if let sixth = project.sixthBasePic {
                        newSixthBaseImage = sixth
                    }
                    if let seventh = project.seventhBasePic {
                        newSeventhBaseImage = seventh
                    }
                    if let eighth = project.eighthBasePic {
                        newEighthBaseImage = eighth
                    }
                    if let ninth = project.ninthBasePic {
                        newNinthBaseImage = ninth
                    }
                }
            } catch {
                fatalError("Error")
            }
        case "5":
            let request = Project.fetchRequest() as NSFetchRequest<Project>
            let pred = NSPredicate(format: "name CONTAINS 5")
            request.predicate = pred
            do {
                let project = try context.fetch(request)
                project.forEach { project in
                    self.newValue = project.projectValue
                    self.peoplePic = project.peoplePic ?? ""
                    homeBaseSum = project.homeBaseValue
                    firstBaseSum = project.firstBaseValue
                    secondBaseSum = project.secondBaseValue
                    thirdBaseSum = project.thirdBaseValue
                    fourthBaseSum = project.fourthBaseValue
                    fifthBaseSum = project.fifthBaseValue
                    sixthBaseSum = project.sixthBaseValue
                    seventhBaseSum = project.seventhBaseValue
                    eighthBaseSum = project.eighthBaseValue
                    ninthBaseSum = project.ninthBaseValue
                    if let title = project.projectTitle {
                        newProjectTitle = title
                    }
                    if let home = project.homeBasePic {
                        newHomeBaseImage = home
                    }
                    if let first = project.firstBasePic {
                        newFirstBaseImage = first
                    }
                    if let second = project.secondBasePic {
                        newSecondBaseImage = second
                    }
                    if let third = project.thirdBasePic {
                        newThirdBaseImage = third
                    }
                    if let fourth = project.fourthBasePic {
                        newFourthBaseImage = fourth
                    }
                    if let fifth = project.fifthBasePic {
                        newFifthBaseImage = fifth
                    }
                    if let sixth = project.sixthBasePic {
                        newSixthBaseImage = sixth
                    }
                    if let seventh = project.seventhBasePic {
                        newSeventhBaseImage = seventh
                    }
                    if let eighth = project.eighthBasePic {
                        newEighthBaseImage = eighth
                    }
                    if let ninth = project.ninthBasePic {
                        newNinthBaseImage = ninth
                    }
                }
            } catch {
                fatalError("Error")
            }
        case "6":
            let request = Project.fetchRequest() as NSFetchRequest<Project>
            let pred = NSPredicate(format: "name CONTAINS 6")
            request.predicate = pred
            do {
                let project = try context.fetch(request)
                project.forEach { project in
                    self.newValue = project.projectValue
                    self.peoplePic = project.peoplePic ?? ""
                    homeBaseSum = project.homeBaseValue
                    firstBaseSum = project.firstBaseValue
                    secondBaseSum = project.secondBaseValue
                    thirdBaseSum = project.thirdBaseValue
                    fourthBaseSum = project.fourthBaseValue
                    fifthBaseSum = project.fifthBaseValue
                    sixthBaseSum = project.sixthBaseValue
                    seventhBaseSum = project.seventhBaseValue
                    eighthBaseSum = project.eighthBaseValue
                    ninthBaseSum = project.ninthBaseValue
                    if let title = project.projectTitle {
                        newProjectTitle = title
                    }
                    if let home = project.homeBasePic {
                        newHomeBaseImage = home
                    }
                    if let first = project.firstBasePic {
                        newFirstBaseImage = first
                    }
                    if let second = project.secondBasePic {
                        newSecondBaseImage = second
                    }
                    if let third = project.thirdBasePic {
                        newThirdBaseImage = third
                    }
                    if let fourth = project.fourthBasePic {
                        newFourthBaseImage = fourth
                    }
                    if let fifth = project.fifthBasePic {
                        newFifthBaseImage = fifth
                    }
                    if let sixth = project.sixthBasePic {
                        newSixthBaseImage = sixth
                    }
                    if let seventh = project.seventhBasePic {
                        newSeventhBaseImage = seventh
                    }
                    if let eighth = project.eighthBasePic {
                        newEighthBaseImage = eighth
                    }
                    if let ninth = project.ninthBasePic {
                        newNinthBaseImage = ninth
                    }
                }
            } catch {
                fatalError("Error")
            }
        default:
            print("Error")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is UpgradesViewController {
            let vc = segue.destination as? UpgradesViewController
            vc?.currentBase = basePicked
            vc?.rootTile = currentTile
            vc?.moneyRemaining = remainingValue
            vc?.projectTotal = newValue
        }
    }
    @IBAction func peoplePicked(_ sender: UIButton) {
        let alert = UIAlertController(title: "Project Title", message: "", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.text = ""
            textField.keyboardType = .default
            textField.autocapitalizationType = .words
            textField.clearsOnBeginEditing = false
            if self.newProjectTitle != "" {
                textField.text = self.newProjectTitle
            }
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        if peoplePicker.imageView?.image == nil {
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { action in
            guard let textfield = alert.textFields else{
                return
            }
            let safeText = textfield[0]
            guard let safeValue = safeText.text, !safeValue.isEmpty else {
                return
            }
            self.newProjectTitle = safeValue
            if self.newProjectTitle != "" {
                self.saveNewTitle()
                self.title = safeValue
                let vc = UIImagePickerController()
                vc.sourceType = .photoLibrary
                vc.delegate = self
                vc.allowsEditing = true
                self.present(vc, animated: true)
            }
        }))
        } else {
            alert.addAction(UIAlertAction(title: "Set Title", style: .default, handler: { action in
                guard let textfield = alert.textFields else{
                    return
                }
                let safeText = textfield[0]
                guard let safeValue = safeText.text, !safeValue.isEmpty else {
                    return
                }
                self.newProjectTitle = safeValue
                if self.newProjectTitle != "" {
                    self.saveNewTitle()
                    self.title = safeValue
                }
            }))
            alert.addAction(UIAlertAction(title: "Change Image", style: .default, handler: { action in
                guard let textfield = alert.textFields else{
                    return
                }
                let safeText = textfield[0]
                guard let safeValue = safeText.text, !safeValue.isEmpty else {
                    return
                }
                self.newProjectTitle = safeValue
                if self.newProjectTitle != "" {
                    self.saveNewTitle()
                    self.title = safeValue
                    let vc = UIImagePickerController()
                    vc.sourceType = .photoLibrary
                    vc.delegate = self
                    vc.allowsEditing = true
                    self.present(vc, animated: true)
                }
            }))
        }
        present(alert, animated: true, completion: nil)
    }
    @IBAction func basePressed(_ sender: UIButton) {
        switch sender.currentTitle {
        case "Home Base":
            basePicked = "Home Base"
            performSegue(withIdentifier: "showUpgrades", sender: self)
        case "First Base":
            basePicked = "First Base"
            performSegue(withIdentifier: "showUpgrades", sender: self)
        case "Second Base":
            basePicked = "Second Base"
            performSegue(withIdentifier: "showUpgrades", sender: self)
        case "Third Base":
            basePicked = "Third Base"
            performSegue(withIdentifier: "showUpgrades", sender: self)
        case "Fourth Base":
            basePicked = "Fourth Base"
            performSegue(withIdentifier: "showUpgrades", sender: self)
        case "Fifth Base":
            basePicked = "Fifth Base"
            performSegue(withIdentifier: "showUpgrades", sender: self)
        case "Sixth Base":
            basePicked = "Sixth Base"
            performSegue(withIdentifier: "showUpgrades", sender: self)
        case "Seventh Base":
            basePicked = "Seventh Base"
            performSegue(withIdentifier: "showUpgrades", sender: self)
        case "Eighth Base":
            basePicked = "Eighth Base"
            performSegue(withIdentifier: "showUpgrades", sender: self)
        case "Ninth Base":
            basePicked = "Ninth Base"
            performSegue(withIdentifier: "showUpgrades", sender: self)
        default:
            print("Error")
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        navigationController?.navigationBar.isHidden = false
        loadProject()
    }
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.post(name: Notification.Name("updatedPic"), object: nil)
        homeBase.alpha = 0
        firstBase.alpha = 0
        secondBase.alpha = 0
        thirdBase.alpha = 0
        fourthBase.alpha = 0
        fifthBase.alpha = 0
        sixthBase.alpha = 0
        seventhBase.alpha = 0
        eighthBase.alpha = 0
        ninthBase.alpha = 0
        homeBaseValue.alpha = 0
        firstBaseValue.alpha = 0
        secondBaseValue.alpha = 0
        thirdBaseValue.alpha = 0
        fourthBaseValue.alpha = 0
        fifthBaseValue.alpha = 0
        sixthBaseValue.alpha = 0
        seventhBaseValue.alpha = 0
        eighthBaseValue.alpha = 0
        ninthBaseValue.alpha = 0
    }
    func loadImages() {
        switch currentTile {
        case "1":
            peoplePicker.setImage(loadImageFromDisk(fileName: peoplePic), for: .normal)
            homeBase.setImage(loadImageFromDisk(fileName: "r1HomePic"), for: .normal)
            firstBase.setImage(loadImageFromDisk(fileName: "r1FirstPic"), for: .normal)
            secondBase.setImage(loadImageFromDisk(fileName: "r1SecondPic"), for: .normal)
            thirdBase.setImage(loadImageFromDisk(fileName: "r1ThirdPic"), for: .normal)
            fourthBase.setImage(loadImageFromDisk(fileName: "r1FourthPic"), for: .normal)
            fifthBase.setImage(loadImageFromDisk(fileName: "r1FifthPic"), for: .normal)
            sixthBase.setImage(loadImageFromDisk(fileName: "r1SixthPic"), for: .normal)
            seventhBase.setImage(loadImageFromDisk(fileName: "r1SeventhPic"), for: .normal)
            eighthBase.setImage(loadImageFromDisk(fileName: "r1EighthPic"), for: .normal)
            ninthBase.setImage(loadImageFromDisk(fileName: "r1NinthPic"), for: .normal)
        case "2":
            peoplePicker.setImage(loadImageFromDisk(fileName: peoplePic), for: .normal)
            homeBase.setImage(loadImageFromDisk(fileName: "r2HomePic"), for: .normal)
            firstBase.setImage(loadImageFromDisk(fileName: "r2FirstPic"), for: .normal)
            secondBase.setImage(loadImageFromDisk(fileName: "r2SecondPic"), for: .normal)
            thirdBase.setImage(loadImageFromDisk(fileName: "r2ThirdPic"), for: .normal)
            fourthBase.setImage(loadImageFromDisk(fileName: "r2FourthPic"), for: .normal)
            fifthBase.setImage(loadImageFromDisk(fileName: "r2FifthPic"), for: .normal)
            sixthBase.setImage(loadImageFromDisk(fileName: "r2SixthPic"), for: .normal)
            seventhBase.setImage(loadImageFromDisk(fileName: "r2SeventhPic"), for: .normal)
            eighthBase.setImage(loadImageFromDisk(fileName: "r2EighthPic"), for: .normal)
            ninthBase.setImage(loadImageFromDisk(fileName: "r2NinthPic"), for: .normal)
        case "3":
            peoplePicker.setImage(loadImageFromDisk(fileName: peoplePic), for: .normal)
            homeBase.setImage(loadImageFromDisk(fileName: "r3HomePic"), for: .normal)
            firstBase.setImage(loadImageFromDisk(fileName: "r3FirstPic"), for: .normal)
            secondBase.setImage(loadImageFromDisk(fileName: "r3SecondPic"), for: .normal)
            thirdBase.setImage(loadImageFromDisk(fileName: "r3ThirdPic"), for: .normal)
            fourthBase.setImage(loadImageFromDisk(fileName: "r3FourthPic"), for: .normal)
            fifthBase.setImage(loadImageFromDisk(fileName: "r3FifthPic"), for: .normal)
            sixthBase.setImage(loadImageFromDisk(fileName: "r3SixthPic"), for: .normal)
            seventhBase.setImage(loadImageFromDisk(fileName: "r3SeventhPic"), for: .normal)
            eighthBase.setImage(loadImageFromDisk(fileName: "r3EighthPic"), for: .normal)
            ninthBase.setImage(loadImageFromDisk(fileName: "r3NinthPic"), for: .normal)
        case "4":
            peoplePicker.setImage(loadImageFromDisk(fileName: peoplePic), for: .normal)
            homeBase.setImage(loadImageFromDisk(fileName: "r4HomePic"), for: .normal)
            firstBase.setImage(loadImageFromDisk(fileName: "r4FirstPic"), for: .normal)
            secondBase.setImage(loadImageFromDisk(fileName: "r4SecondPic"), for: .normal)
            thirdBase.setImage(loadImageFromDisk(fileName: "r4ThirdPic"), for: .normal)
            fourthBase.setImage(loadImageFromDisk(fileName: "r4FourthPic"), for: .normal)
            fifthBase.setImage(loadImageFromDisk(fileName: "r4FifthPic"), for: .normal)
            sixthBase.setImage(loadImageFromDisk(fileName: "r4SixthPic"), for: .normal)
            seventhBase.setImage(loadImageFromDisk(fileName: "r4SeventhPic"), for: .normal)
            eighthBase.setImage(loadImageFromDisk(fileName: "r4EighthPic"), for: .normal)
            ninthBase.setImage(loadImageFromDisk(fileName: "r4NinthPic"), for: .normal)
        case "5":
            peoplePicker.setImage(loadImageFromDisk(fileName: peoplePic), for: .normal)
            homeBase.setImage(loadImageFromDisk(fileName: "r5HomePic"), for: .normal)
            firstBase.setImage(loadImageFromDisk(fileName: "r5FirstPic"), for: .normal)
            secondBase.setImage(loadImageFromDisk(fileName: "r5SecondPic"), for: .normal)
            thirdBase.setImage(loadImageFromDisk(fileName: "r5ThirdPic"), for: .normal)
            fourthBase.setImage(loadImageFromDisk(fileName: "r5FourthPic"), for: .normal)
            fifthBase.setImage(loadImageFromDisk(fileName: "r5FifthPic"), for: .normal)
            sixthBase.setImage(loadImageFromDisk(fileName: "r5SixthPic"), for: .normal)
            seventhBase.setImage(loadImageFromDisk(fileName: "r5SeventhPic"), for: .normal)
            eighthBase.setImage(loadImageFromDisk(fileName: "r5EighthPic"), for: .normal)
            ninthBase.setImage(loadImageFromDisk(fileName: "r5NinthPic"), for: .normal)
        case "6":
            peoplePicker.setImage(loadImageFromDisk(fileName: peoplePic), for: .normal)
            homeBase.setImage(loadImageFromDisk(fileName: "r6HomePic"), for: .normal)
            firstBase.setImage(loadImageFromDisk(fileName: "r6FirstPic"), for: .normal)
            secondBase.setImage(loadImageFromDisk(fileName: "r6SecondPic"), for: .normal)
            thirdBase.setImage(loadImageFromDisk(fileName: "r6ThirdPic"), for: .normal)
            fourthBase.setImage(loadImageFromDisk(fileName: "r6FourthPic"), for: .normal)
            fifthBase.setImage(loadImageFromDisk(fileName: "r6FifthPic"), for: .normal)
            sixthBase.setImage(loadImageFromDisk(fileName: "r6SixthPic"), for: .normal)
            seventhBase.setImage(loadImageFromDisk(fileName: "r6SeventhPic"), for: .normal)
            eighthBase.setImage(loadImageFromDisk(fileName: "r6EighthPic"), for: .normal)
            ninthBase.setImage(loadImageFromDisk(fileName: "r6NinthPic"), for: .normal)
        default:
            print("Error")
    }
    }
}
extension UIView {
    func newCircle() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
extension ProjectsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            switch currentTile {
            case "1":
                saveImage(imageName: peoplePic, image: image)
            case "2":
                saveImage(imageName: peoplePic, image: image)
            case "3":
                saveImage(imageName: peoplePic, image: image)
            case "4":
                saveImage(imageName: peoplePic, image: image)
            case "5":
                saveImage(imageName: peoplePic, image: image)
            case "6":
                saveImage(imageName: peoplePic, image: image)
            default:
                print("Error")
            }
        }
        picker.dismiss(animated: true, completion: nil)
        if peoplePicker.imageView?.image == nil {
            loadImages()
                self.peopleVConstraint.isActive = false
                self.peopleTConstraint.isActive = true
                self.peopleHConstraint.constant = 0
            if self.screenSize.width < 390 {
                self.peopleWidth.constant = 100
                self.peopleHeight.constant = 100
                self.peoplePicker.frame.size.height = 100
                self.peoplePicker.frame.size.width = 100
            } else {
                self.peopleWidth.constant = 150
                self.peopleHeight.constant = 150
                self.peoplePicker.frame.size.height = 150
                self.peoplePicker.frame.size.width = 150
            }
                self.peoplePicker.newCircle()
                self.peoplePicker.center.x = self.view.center.x
                self.peoplePicker.directionalLayoutMargins.top = self.view.directionalLayoutMargins.top
                self.homeBase.alpha = 1
                self.homeBase.frame.size.height = 100
                self.homeBase.frame.size.width = 100
                self.homeBase.center.y = self.view.center.y + 20
                self.homeBase.center.x = self.view.center.x
        } else {
            loadImages()
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func saveImage(imageName: String, image: UIImage) {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        let fileName = imageName
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {return}
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try FileManager.default.removeItem(atPath: fileURL.path) }
            catch let removeError {
                print(removeError)
            }
        }
        do {
            try data.write(to: fileURL)
        } catch let error {
            print(error)
        }
    }
    func loadImageFromDisk(fileName: String) -> UIImage? {
        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
        if let dirPath = paths.first {
            let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
            let image = UIImage(contentsOfFile: imageURL.path)
            return image
        }
        return nil
    }
}
