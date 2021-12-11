//
//  MainViewController.swift
//  Happy Spending
//
//  Created by Bruce Bolin on 10/1/21.
//

import UIKit
import CoreData

class MainViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var newProjectButton: UIButton!
    @IBOutlet weak var recentProject1: UIButton!
    @IBOutlet weak var recentProject2: UIButton!
    @IBOutlet weak var recentProject3: UIButton!
    @IBOutlet weak var recentProject4: UIButton!
    @IBOutlet weak var recentProject5: UIButton!
    @IBOutlet weak var recentProject6: UIButton!
    var hexPicObserver: NSObjectProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        hexPicObserver = NotificationCenter.default.addObserver(forName: Notification.Name("updatedPic"), object: nil, queue: .main, using: { (Notification) in
            self.buttonAlpha()
        })
        newProjectButton.addTarget(self, action: #selector(pressed(_:)), for: .touchDown);
        let project = fetchProject()
        project.forEach { new in
            new.isActive = false
            do {
                try context.save()
            } catch {
            }
        }
        activate1 = UserDefaults.standard.bool(forKey: "activate1")
        activate2 = UserDefaults.standard.bool(forKey: "activate2")
        activate3 = UserDefaults.standard.bool(forKey: "activate3")
        activate4 = UserDefaults.standard.bool(forKey: "activate4")
        activate5 = UserDefaults.standard.bool(forKey: "activate5")
        activate6 = UserDefaults.standard.bool(forKey: "activate6")
        newProjectButton.setupHexagonView()
        recentProject1.setupHexagonView()
        recentProject2.setupHexagonView()
        recentProject3.setupHexagonView()
        recentProject4.setupHexagonView()
        recentProject5.setupHexagonView()
        recentProject6.setupHexagonView()
        newProjectButton.backgroundColor = .black
        recentProject1.setBackgroundImage(UIImage(named: "Bluer"), for: .normal)
        recentProject2.setBackgroundImage(UIImage(named: "Indigo"), for: .normal)
        recentProject3.setBackgroundImage(UIImage(named: "Purp"), for: .normal)
        recentProject4.setBackgroundImage(UIImage(named: "Teal"), for: .normal)
        recentProject5.setBackgroundImage(UIImage(named: "Bluish"), for: .normal)
        recentProject6.setBackgroundImage(UIImage(named: "Gray"), for: .normal)
        buttonAlpha()
        newProjectButton.imageView?.contentMode = .scaleAspectFit
        newProjectButton.imageView?.center.x -= 5
        addLongPress()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
            if newProjectButton.imageView?.center.x == 56.5 {
                newProjectButton.imageView?.center.x -= 5
                recentProject1.imageView?.center.x -= 5
                recentProject2.imageView?.center.x -= 5
                recentProject3.imageView?.center.x -= 5
                recentProject4.imageView?.center.x -= 5
                recentProject5.imageView?.center.x -= 5
                recentProject6.imageView?.center.x -= 5
        }
    }
    @objc func pressed(_ sender: Any) {
        newProjectButton.setImage(.none, for: .normal)
    }
    let screenWidth = UIScreen.main.bounds.width - 10
    let screenHeight = UIScreen.main.bounds.height / 4
    var selectedRow = 0
    var projectValue =
    [
        1000,
        5000,
        10000,
        50000,
        100000
    ]
    var selectedValue = 0
    var newBackground = UIImage.init(imageLiteralResourceName: "Bluer")
    var selectedTile = "1"
    var activate1 = false
    var activate2 = false
    var activate3 = false
    var activate4 = false
    var activate5 = false
    var activate6 = false
    let centerView: CGFloat = 0.0
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ProjectsViewController {
            let vc = segue.destination as? ProjectsViewController
            vc?.newValue = Int64(projectValue[selectedRow])
            vc?.setBackground = newBackground
            vc?.currentTile = selectedTile
        }
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 30))
        label.text = "$\(projectValue[row])"
        label.sizeToFit()
        return label
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        projectValue.count
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    @objc func longPress1(_ sender: UIGestureRecognizer) -> Void {
        if sender.state == .began {
            let feedback = UIImpactFeedbackGenerator(style: .heavy)
            feedback.impactOccurred()
        let alert = UIAlertController(title: "Delete", message: "Remove saved project?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { UIAlertAction in
            self.activate1 = false
            self.recentProject1.alpha = 0
            self.recentProject1.setBackgroundImage(UIImage(named: "Bluer"), for: .normal)
            self.recentProject1.setImage(.none, for: .normal)
            UserDefaults.standard.setValue(self.activate1, forKey: "activate1")
            let request = Project.fetchRequest() as NSFetchRequest<Project>
            let pred = NSPredicate(format: "name CONTAINS 1")
            request.predicate = pred
            do {
                let project = try self.context.fetch(request)
                for project in project {
                   if let base = project.homeBasePic {
                       self.deleteImage(imageName: base)
                    }
                    if let first = project.firstBasePic {
                        self.deleteImage(imageName: first)
                    }
                    if let second = project.secondBasePic {
                        self.deleteImage(imageName: second)
                    }
                    if let third = project.thirdBasePic {
                        self.deleteImage(imageName: third)
                    }
                    if let fourth = project.fourthBasePic {
                        self.deleteImage(imageName: fourth)
                    }
                    if let fifth = project.fifthBasePic {
                        self.deleteImage(imageName: fifth)
                    }
                    if let sixth = project.sixthBasePic {
                        self.deleteImage(imageName: sixth)
                    }
                    if let seventh = project.seventhBasePic {
                        self.deleteImage(imageName: seventh)
                    }
                    if let eighth = project.eighthBasePic {
                        self.deleteImage(imageName: eighth)
                    }
                    if let ninth = project.ninthBasePic {
                        self.deleteImage(imageName: ninth)
                    }
                    if let people = project.peoplePic {
                        self.deleteImage(imageName: people)
                    }
                    self.context.delete(project)
                    do {
                        try self.context.save()
                    } catch {
                    }
                }
            } catch {
            }
        }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
                self.recentProject1.imageView?.center.x -= 5
            }))
        present(alert, animated: true, completion: nil)
        }
    }
    @objc func longPress2(_ sender: UIGestureRecognizer) -> Void {
        if sender.state == .began {
            let feedback = UIImpactFeedbackGenerator(style: .heavy)
            feedback.impactOccurred()
        let alert = UIAlertController(title: "Delete", message: "Remove saved project?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { UIAlertAction in
            self.activate2 = false
            self.recentProject2.alpha = 0
            self.recentProject2.setBackgroundImage(UIImage(named: "Indigo"), for: .normal)
            self.recentProject2.setImage(.none, for: .normal)
            UserDefaults.standard.setValue(self.activate2, forKey: "activate2")
            let request = Project.fetchRequest() as NSFetchRequest<Project>
            let pred = NSPredicate(format: "name CONTAINS 2")
            request.predicate = pred
            do {
                let project = try self.context.fetch(request)
                for project in project {
                    if let base = project.homeBasePic {
                        self.deleteImage(imageName: base)
                     }
                     if let first = project.firstBasePic {
                         self.deleteImage(imageName: first)
                     }
                     if let second = project.secondBasePic {
                         self.deleteImage(imageName: second)
                     }
                     if let third = project.thirdBasePic {
                         self.deleteImage(imageName: third)
                     }
                    if let fourth = project.fourthBasePic {
                        self.deleteImage(imageName: fourth)
                    }
                    if let fifth = project.fifthBasePic {
                        self.deleteImage(imageName: fifth)
                    }
                    if let sixth = project.sixthBasePic {
                        self.deleteImage(imageName: sixth)
                    }
                    if let seventh = project.seventhBasePic {
                        self.deleteImage(imageName: seventh)
                    }
                    if let eighth = project.eighthBasePic {
                        self.deleteImage(imageName: eighth)
                    }
                    if let ninth = project.ninthBasePic {
                        self.deleteImage(imageName: ninth)
                    }
                     if let people = project.peoplePic {
                         self.deleteImage(imageName: people)
                     }
                    self.context.delete(project)
                    do {
                        try self.context.save()
                    } catch {
                    }
                }
            } catch {
            }
        }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
                self.recentProject2.imageView?.center.x -= 5
            }))
        present(alert, animated: true, completion: nil)
        }
    }
    @objc func longPress3(_ sender: UIGestureRecognizer) -> Void {
        if sender.state == .began {
            let feedback = UIImpactFeedbackGenerator(style: .heavy)
            feedback.impactOccurred()
        let alert = UIAlertController(title: "Delete", message: "Remove saved project?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { UIAlertAction in
            self.activate3 = false
            self.recentProject3.alpha = 0
            self.recentProject3.setBackgroundImage(UIImage(named: "Purp"), for: .normal)
            self.recentProject3.setImage(.none, for: .normal)
            UserDefaults.standard.setValue(self.activate3, forKey: "activate3")
            let request = Project.fetchRequest() as NSFetchRequest<Project>
            let pred = NSPredicate(format: "name CONTAINS 3")
            request.predicate = pred
            do {
                let project = try self.context.fetch(request)
                for project in project {
                    if let base = project.homeBasePic {
                        self.deleteImage(imageName: base)
                     }
                     if let first = project.firstBasePic {
                         self.deleteImage(imageName: first)
                     }
                     if let second = project.secondBasePic {
                         self.deleteImage(imageName: second)
                     }
                     if let third = project.thirdBasePic {
                         self.deleteImage(imageName: third)
                     }
                    if let fourth = project.fourthBasePic {
                        self.deleteImage(imageName: fourth)
                    }
                    if let fifth = project.fifthBasePic {
                        self.deleteImage(imageName: fifth)
                    }
                    if let sixth = project.sixthBasePic {
                        self.deleteImage(imageName: sixth)
                    }
                    if let seventh = project.seventhBasePic {
                        self.deleteImage(imageName: seventh)
                    }
                    if let eighth = project.eighthBasePic {
                        self.deleteImage(imageName: eighth)
                    }
                    if let ninth = project.ninthBasePic {
                        self.deleteImage(imageName: ninth)
                    }
                     if let people = project.peoplePic {
                         self.deleteImage(imageName: people)
                     }
                    self.context.delete(project)
                    do {
                        try self.context.save()
                    } catch {
                    }
                }
            } catch {
            }
        }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
                self.recentProject3.imageView?.center.x -= 5
            }))
        present(alert, animated: true, completion: nil)
        }
    }
    @objc func longPress4(_ sender: UIGestureRecognizer) -> Void {
        if sender.state == .began {
            let feedback = UIImpactFeedbackGenerator(style: .heavy)
            feedback.impactOccurred()
        let alert = UIAlertController(title: "Delete", message: "Remove saved project?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { UIAlertAction in
            self.activate4 = false
            self.recentProject4.alpha = 0
            self.recentProject4.setBackgroundImage(UIImage(named: "Teal"), for: .normal)
            self.recentProject4.setImage(.none, for: .normal)
            UserDefaults.standard.setValue(self.activate4, forKey: "activate4")
            let request = Project.fetchRequest() as NSFetchRequest<Project>
            let pred = NSPredicate(format: "name CONTAINS 4")
            request.predicate = pred
            do {
                let project = try self.context.fetch(request)
                for project in project {
                    if let base = project.homeBasePic {
                        self.deleteImage(imageName: base)
                     }
                     if let first = project.firstBasePic {
                         self.deleteImage(imageName: first)
                     }
                     if let second = project.secondBasePic {
                         self.deleteImage(imageName: second)
                     }
                     if let third = project.thirdBasePic {
                         self.deleteImage(imageName: third)
                     }
                    if let fourth = project.fourthBasePic {
                        self.deleteImage(imageName: fourth)
                    }
                    if let fifth = project.fifthBasePic {
                        self.deleteImage(imageName: fifth)
                    }
                    if let sixth = project.sixthBasePic {
                        self.deleteImage(imageName: sixth)
                    }
                    if let seventh = project.seventhBasePic {
                        self.deleteImage(imageName: seventh)
                    }
                    if let eighth = project.eighthBasePic {
                        self.deleteImage(imageName: eighth)
                    }
                    if let ninth = project.ninthBasePic {
                        self.deleteImage(imageName: ninth)
                    }
                     if let people = project.peoplePic {
                         self.deleteImage(imageName: people)
                     }
                    self.context.delete(project)
                    do {
                        try self.context.save()
                    } catch {
                    }
                }
            } catch {
            }
        }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
                self.recentProject4.imageView?.center.x -= 5
            }))
        present(alert, animated: true, completion: nil)
        }
    }
    @objc func longPress5(_ sender: UIGestureRecognizer) -> Void {
        if sender.state == .began {
            let feedback = UIImpactFeedbackGenerator(style: .heavy)
            feedback.impactOccurred()
        let alert = UIAlertController(title: "Delete", message: "Remove saved project?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { UIAlertAction in
            self.activate5 = false
            self.recentProject5.alpha = 0
            self.recentProject5.setBackgroundImage(UIImage(named: "Bluish"), for: .normal)
            self.recentProject5.setImage(.none, for: .normal)
            UserDefaults.standard.setValue(self.activate5, forKey: "activate5")
            let request = Project.fetchRequest() as NSFetchRequest<Project>
            let pred = NSPredicate(format: "name CONTAINS 5")
            request.predicate = pred
            do {
                let project = try self.context.fetch(request)
                for project in project {
                    if let base = project.homeBasePic {
                        self.deleteImage(imageName: base)
                     }
                     if let first = project.firstBasePic {
                         self.deleteImage(imageName: first)
                     }
                     if let second = project.secondBasePic {
                         self.deleteImage(imageName: second)
                     }
                     if let third = project.thirdBasePic {
                         self.deleteImage(imageName: third)
                     }
                    if let fourth = project.fourthBasePic {
                        self.deleteImage(imageName: fourth)
                    }
                    if let fifth = project.fifthBasePic {
                        self.deleteImage(imageName: fifth)
                    }
                    if let sixth = project.sixthBasePic {
                        self.deleteImage(imageName: sixth)
                    }
                    if let seventh = project.seventhBasePic {
                        self.deleteImage(imageName: seventh)
                    }
                    if let eighth = project.eighthBasePic {
                        self.deleteImage(imageName: eighth)
                    }
                    if let ninth = project.ninthBasePic {
                        self.deleteImage(imageName: ninth)
                    }
                     if let people = project.peoplePic {
                         self.deleteImage(imageName: people)
                     }
                    self.context.delete(project)
                    do {
                        try self.context.save()
                    } catch {
                    }
                }
            } catch {
            }
        }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
                self.recentProject5.imageView?.center.x -= 5
            }))
        present(alert, animated: true, completion: nil)
        }
    }
    @objc func longPress6(_ sender: UIGestureRecognizer) -> Void {
        if sender.state == .began {
            let feedback = UIImpactFeedbackGenerator(style: .heavy)
            feedback.impactOccurred()
        let alert = UIAlertController(title: "Delete", message: "Remove saved project?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { UIAlertAction in
            self.activate6 = false
            self.recentProject6.alpha = 0
            self.recentProject6.setBackgroundImage(UIImage(named: "Gray"), for: .normal)
            self.recentProject6.setImage(.none, for: .normal)
            UserDefaults.standard.setValue(self.activate6, forKey: "activate6")
            let request = Project.fetchRequest() as NSFetchRequest<Project>
            let pred = NSPredicate(format: "name CONTAINS 6")
            request.predicate = pred
            do {
                let project = try self.context.fetch(request)
                for project in project {
                    if let base = project.homeBasePic {
                        self.deleteImage(imageName: base)
                     }
                     if let first = project.firstBasePic {
                         self.deleteImage(imageName: first)
                     }
                     if let second = project.secondBasePic {
                         self.deleteImage(imageName: second)
                     }
                     if let third = project.thirdBasePic {
                         self.deleteImage(imageName: third)
                     }
                    if let fourth = project.fourthBasePic {
                        self.deleteImage(imageName: fourth)
                    }
                    if let fifth = project.fifthBasePic {
                        self.deleteImage(imageName: fifth)
                    }
                    if let sixth = project.sixthBasePic {
                        self.deleteImage(imageName: sixth)
                    }
                    if let seventh = project.seventhBasePic {
                        self.deleteImage(imageName: seventh)
                    }
                    if let eighth = project.eighthBasePic {
                        self.deleteImage(imageName: eighth)
                    }
                    if let ninth = project.ninthBasePic {
                        self.deleteImage(imageName: ninth)
                    }
                     if let people = project.peoplePic {
                         self.deleteImage(imageName: people)
                     }
                    self.context.delete(project)
                    do {
                        try self.context.save()
                    } catch {
                    }
                }
            } catch {
            }
        }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
                self.recentProject6.imageView?.center.x -= 5
            }))
        present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func hexPressed(_ sender: UIButton) {
        sender.backgroundColor = .black
        switch sender.currentTitle {
        case "New":
            pressed(self)
            newProjectButton.imageView?.center.x -= 5
            let alert = UIAlertController(title: "", message: "What's your budget?", preferredStyle: .alert)
            alert.addTextField { textField in
                textField.text = ""
                textField.keyboardType = .numberPad
                textField.clearsOnBeginEditing = true
            }
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Select", style: .default, handler: {
                (UIAlertAction) in
                guard let textfield = alert.textFields else{
                    return
                }
                let safeText = textfield[0]
                guard let safeValue = safeText.text, !safeValue.isEmpty else {
                    return
                }
                if self.activate1 == false {
                    self.recentProject1.setBackgroundImage(.none, for: .normal)
                    self.recentProject1.backgroundColor = .black
                    self.newBackground = UIImage.init(imageLiteralResourceName: "Bluer")
                    self.selectedTile = "1"
                    self.activate1 = true
                    UserDefaults.standard.setValue(self.activate1, forKey: "activate1")
                    self.buttonAlpha()
                    self.performSegue(withIdentifier: "showProjects", sender: self)
                    let r1Project = Project(context: self.context)
                    r1Project.name = self.selectedTile
                    if let newValue1 = Int64(safeValue){
                    r1Project.projectValue = Int64(newValue1)
                    }
                    r1Project.homeURLTitle = "Search and Save Link"
                    r1Project.firstURLTitle = "Search and Save Link"
                    r1Project.secondURLTitle = "Search and Save Link"
                    r1Project.thirdURLTitle = "Search and Save Link"
                    r1Project.fourthURLTitle = "Search and Save Link"
                    r1Project.fifthURLTitle = "Search and Save Link"
                    r1Project.sixthURLTitle = "Search and Save Link"
                    r1Project.seventhURLTitle = "Search and Save Link"
                    r1Project.eighthURLTitle = "Search and Save Link"
                    r1Project.ninthURLTitle = "Search and Save Link"
                    r1Project.homeBasePic = "r1HomePic"
                    r1Project.homeBaseValue = 0
                    r1Project.firstBasePic = "r1FirstPic"
                    r1Project.firstBaseValue = 0
                    r1Project.secondBasePic = "r1SecondPic"
                    r1Project.secondBaseValue = 0
                    r1Project.thirdBasePic = "r1ThirdPic"
                    r1Project.thirdBaseValue = 0
                    r1Project.fourthBasePic = "r1FourthPic"
                    r1Project.fourthBaseValue = 0
                    r1Project.fifthBasePic = "r1FifthPic"
                    r1Project.fifthBaseValue = 0
                    r1Project.sixthBasePic = "r1SixthPic"
                    r1Project.sixthBaseValue = 0
                    r1Project.seventhBasePic = "r1SeventhPic"
                    r1Project.seventhBaseValue = 0
                    r1Project.eighthBasePic = "r1EighthPic"
                    r1Project.eighthBaseValue = 0
                    r1Project.ninthBasePic = "r1NinthPic"
                    r1Project.ninthBaseValue = 0
                    r1Project.peoplePic = "r1PeoplePic"
                    r1Project.homeURL = "https://www.google.com"
                    r1Project.firstURL = "https://www.google.com"
                    r1Project.secondURL = "https://www.google.com"
                    r1Project.thirdURL = "https://www.google.com"
                    r1Project.fourthURL = "https://www.google.com"
                    r1Project.fifthURL = "https://www.google.com"
                    r1Project.sixthURL = "https://www.google.com"
                    r1Project.seventhURL = "https://www.google.com"
                    r1Project.eighthURL = "https://www.google.com"
                    r1Project.ninthURL = "https://www.google.com"
                    r1Project.projectTitle = ""
                    r1Project.isActive = true
                             do {
                                 try self.context.save()
                                } catch {
                    }
                }
                else if self.activate2 == false {
                    self.recentProject2.setBackgroundImage(.none, for: .normal)
                    self.recentProject2.backgroundColor = .black
                    self.newBackground = UIImage.init(imageLiteralResourceName: "Indigo")
                    self.selectedTile = "2"
                    let r2Project = Project(context: self.context)
                    self.activate2 = true
                    r2Project.name = self.selectedTile
                    if let newValue2 = Int64(safeValue){
                    r2Project.projectValue = Int64(newValue2)
                    }
                    r2Project.homeURLTitle = "Search and Save Link"
                    r2Project.firstURLTitle = "Search and Save Link"
                    r2Project.secondURLTitle = "Search and Save Link"
                    r2Project.thirdURLTitle = "Search and Save Link"
                    r2Project.fourthURLTitle = "Search and Save Link"
                    r2Project.fifthURLTitle = "Search and Save Link"
                    r2Project.sixthURLTitle = "Search and Save Link"
                    r2Project.seventhURLTitle = "Search and Save Link"
                    r2Project.eighthURLTitle = "Search and Save Link"
                    r2Project.ninthURLTitle = "Search and Save Link"
                    r2Project.homeBasePic = "r2HomePic"
                    r2Project.homeBaseValue = 0
                    r2Project.firstBasePic = "r2FirstPic"
                    r2Project.firstBaseValue = 0
                    r2Project.secondBasePic = "r2SecondPic"
                    r2Project.secondBaseValue = 0
                    r2Project.thirdBasePic = "r2ThirdPic"
                    r2Project.thirdBaseValue = 0
                    r2Project.fourthBasePic = "r2FourthPic"
                    r2Project.fourthBaseValue = 0
                    r2Project.fifthBasePic = "r2FifthPic"
                    r2Project.fifthBaseValue = 0
                    r2Project.sixthBasePic = "r2SixthPic"
                    r2Project.sixthBaseValue = 0
                    r2Project.seventhBasePic = "r2SeventhPic"
                    r2Project.seventhBaseValue = 0
                    r2Project.eighthBasePic = "r2EighthPic"
                    r2Project.eighthBaseValue = 0
                    r2Project.ninthBasePic = "r2NinthPic"
                    r2Project.ninthBaseValue = 0
                    r2Project.peoplePic = "r2PeoplePic"
                    r2Project.homeURL = "https://www.google.com"
                    r2Project.firstURL = "https://www.google.com"
                    r2Project.secondURL = "https://www.google.com"
                    r2Project.thirdURL = "https://www.google.com"
                    r2Project.fourthURL = "https://www.google.com"
                    r2Project.fifthURL = "https://www.google.com"
                    r2Project.sixthURL = "https://www.google.com"
                    r2Project.seventhURL = "https://www.google.com"
                    r2Project.eighthURL = "https://www.google.com"
                    r2Project.ninthURL = "https://www.google.com"
                    r2Project.projectTitle = ""
                    r2Project.isActive = true
                    UserDefaults.standard.setValue(self.activate2, forKey: "activate2")
                             do {
                                 try self.context.save()
                                } catch {
                             }
                    self.buttonAlpha()
                    self.performSegue(withIdentifier: "showProjects", sender: self)
                }
                else if self.activate3 == false {
                    self.recentProject3.setBackgroundImage(.none, for: .normal)
                    self.recentProject3.backgroundColor = .black
                    self.newBackground = UIImage.init(imageLiteralResourceName: "Purp")
                    self.selectedTile = "3"
                    let r3Project = Project(context: self.context)
                    self.activate3 = true
                    r3Project.name = self.selectedTile
                    if let newValue3 = Int64(safeValue){
                    r3Project.projectValue = Int64(newValue3)
                    }
                    r3Project.homeURLTitle = "Search and Save Link"
                    r3Project.firstURLTitle = "Search and Save Link"
                    r3Project.secondURLTitle = "Search and Save Link"
                    r3Project.thirdURLTitle = "Search and Save Link"
                    r3Project.fourthURLTitle = "Search and Save Link"
                    r3Project.fifthURLTitle = "Search and Save Link"
                    r3Project.sixthURLTitle = "Search and Save Link"
                    r3Project.seventhURLTitle = "Search and Save Link"
                    r3Project.eighthURLTitle = "Search and Save Link"
                    r3Project.ninthURLTitle = "Search and Save Link"
                    r3Project.homeBasePic = "r3HomePic"
                    r3Project.homeBaseValue = 0
                    r3Project.firstBasePic = "r3FirstPic"
                    r3Project.firstBaseValue = 0
                    r3Project.secondBasePic = "r3SecondPic"
                    r3Project.secondBaseValue = 0
                    r3Project.thirdBasePic = "r3ThirdPic"
                    r3Project.thirdBaseValue = 0
                    r3Project.fourthBasePic = "r3FourthPic"
                    r3Project.fourthBaseValue = 0
                    r3Project.fifthBasePic = "r3FifthPic"
                    r3Project.fifthBaseValue = 0
                    r3Project.sixthBasePic = "r3SixthPic"
                    r3Project.sixthBaseValue = 0
                    r3Project.seventhBasePic = "r3SeventhPic"
                    r3Project.seventhBaseValue = 0
                    r3Project.eighthBasePic = "r3EighthPic"
                    r3Project.eighthBaseValue = 0
                    r3Project.ninthBasePic = "r3NinthPic"
                    r3Project.ninthBaseValue = 0
                    r3Project.peoplePic = "r3PeoplePic"
                    r3Project.homeURL = "https://www.google.com"
                    r3Project.firstURL = "https://www.google.com"
                    r3Project.secondURL = "https://www.google.com"
                    r3Project.thirdURL = "https://www.google.com"
                    r3Project.fourthURL = "https://www.google.com"
                    r3Project.fifthURL = "https://www.google.com"
                    r3Project.sixthURL = "https://www.google.com"
                    r3Project.seventhURL = "https://www.google.com"
                    r3Project.eighthURL = "https://www.google.com"
                    r3Project.ninthURL = "https://www.google.com"
                    r3Project.projectTitle = ""
                    r3Project.isActive = true
                    UserDefaults.standard.setValue(self.activate3, forKey: "activate3")
                             do {
                                 try self.context.save()
                                } catch {
                             }
                    self.buttonAlpha()
                    self.performSegue(withIdentifier: "showProjects", sender: self)
                }
                else if self.activate4 == false {
                    self.recentProject4.setBackgroundImage(.none, for: .normal)
                    self.recentProject4.backgroundColor = .black
                    self.newBackground = UIImage.init(imageLiteralResourceName: "Teal")
                    self.selectedTile = "4"
                    let r4Project = Project(context: self.context)
                    self.activate4 = true
                    r4Project.name = self.selectedTile
                    if let newValue4 = Int64(safeValue){
                    r4Project.projectValue = Int64(newValue4)
                    }
                    r4Project.homeURLTitle = "Search and Save Link"
                    r4Project.firstURLTitle = "Search and Save Link"
                    r4Project.secondURLTitle = "Search and Save Link"
                    r4Project.thirdURLTitle = "Search and Save Link"
                    r4Project.fourthURLTitle = "Search and Save Link"
                    r4Project.fifthURLTitle = "Search and Save Link"
                    r4Project.sixthURLTitle = "Search and Save Link"
                    r4Project.seventhURLTitle = "Search and Save Link"
                    r4Project.eighthURLTitle = "Search and Save Link"
                    r4Project.ninthURLTitle = "Search and Save Link"
                    r4Project.homeBasePic = "r4HomePic"
                    r4Project.homeBaseValue = 0
                    r4Project.firstBasePic = "r4FirstPic"
                    r4Project.firstBaseValue = 0
                    r4Project.secondBasePic = "r4SecondPic"
                    r4Project.secondBaseValue = 0
                    r4Project.thirdBasePic = "r4ThirdPic"
                    r4Project.thirdBaseValue = 0
                    r4Project.fourthBasePic = "r4FourthPic"
                    r4Project.fourthBaseValue = 0
                    r4Project.fifthBasePic = "r4FifthPic"
                    r4Project.fifthBaseValue = 0
                    r4Project.sixthBasePic = "r4SixthPic"
                    r4Project.sixthBaseValue = 0
                    r4Project.seventhBasePic = "r4SeventhPic"
                    r4Project.seventhBaseValue = 0
                    r4Project.eighthBasePic = "r4EighthPic"
                    r4Project.eighthBaseValue = 0
                    r4Project.ninthBasePic = "r4NinthPic"
                    r4Project.ninthBaseValue = 0
                    r4Project.peoplePic = "r4PeoplePic"
                    r4Project.homeURL = "https://www.google.com"
                    r4Project.firstURL = "https://www.google.com"
                    r4Project.secondURL = "https://www.google.com"
                    r4Project.thirdURL = "https://www.google.com"
                    r4Project.fourthURL = "https://www.google.com"
                    r4Project.fifthURL = "https://www.google.com"
                    r4Project.sixthURL = "https://www.google.com"
                    r4Project.seventhURL = "https://www.google.com"
                    r4Project.eighthURL = "https://www.google.com"
                    r4Project.ninthURL = "https://www.google.com"
                    r4Project.projectTitle = ""
                    r4Project.isActive = true
                    UserDefaults.standard.setValue(self.activate4, forKey: "activate4")
                             do {
                                 try self.context.save()
                                } catch {
                             }
                    self.buttonAlpha()
                    self.performSegue(withIdentifier: "showProjects", sender: self)
                }
                else if self.activate5 == false {
                    self.recentProject5.setBackgroundImage(.none, for: .normal)
                    self.recentProject5.backgroundColor = .black
                    self.newBackground = UIImage.init(imageLiteralResourceName: "Bluish")
                    self.selectedTile = "5"
                    let r5Project = Project(context: self.context)
                    self.activate5 = true
                    r5Project.name = self.selectedTile
                    if let newValue5 = Int64(safeValue){
                    r5Project.projectValue = Int64(newValue5)
                    }
                    r5Project.homeURLTitle = "Search and Save Link"
                    r5Project.firstURLTitle = "Search and Save Link"
                    r5Project.secondURLTitle = "Search and Save Link"
                    r5Project.thirdURLTitle = "Search and Save Link"
                    r5Project.fourthURLTitle = "Search and Save Link"
                    r5Project.fifthURLTitle = "Search and Save Link"
                    r5Project.sixthURLTitle = "Search and Save Link"
                    r5Project.seventhURLTitle = "Search and Save Link"
                    r5Project.eighthURLTitle = "Search and Save Link"
                    r5Project.ninthURLTitle = "Search and Save Link"
                    r5Project.homeBasePic = "r5HomePic"
                    r5Project.homeBaseValue = 0
                    r5Project.firstBasePic = "r5FirstPic"
                    r5Project.firstBaseValue = 0
                    r5Project.secondBasePic = "r5SecondPic"
                    r5Project.secondBaseValue = 0
                    r5Project.thirdBasePic = "r5ThirdPic"
                    r5Project.thirdBaseValue = 0
                    r5Project.fourthBasePic = "r5FourthPic"
                    r5Project.fourthBaseValue = 0
                    r5Project.fifthBasePic = "r5FifthPic"
                    r5Project.fifthBaseValue = 0
                    r5Project.sixthBasePic = "r5SixthPic"
                    r5Project.sixthBaseValue = 0
                    r5Project.seventhBasePic = "r5SeventhPic"
                    r5Project.seventhBaseValue = 0
                    r5Project.eighthBasePic = "r5EighthPic"
                    r5Project.eighthBaseValue = 0
                    r5Project.ninthBasePic = "r5NinthPic"
                    r5Project.ninthBaseValue = 0
                    r5Project.peoplePic = "r5PeoplePic"
                    r5Project.homeURL = "https://www.google.com"
                    r5Project.firstURL = "https://www.google.com"
                    r5Project.secondURL = "https://www.google.com"
                    r5Project.thirdURL = "https://www.google.com"
                    r5Project.fourthURL = "https://www.google.com"
                    r5Project.fifthURL = "https://www.google.com"
                    r5Project.sixthURL = "https://www.google.com"
                    r5Project.seventhURL = "https://www.google.com"
                    r5Project.eighthURL = "https://www.google.com"
                    r5Project.ninthURL = "https://www.google.com"
                    r5Project.projectTitle = ""
                    r5Project.isActive = true
                    UserDefaults.standard.setValue(self.activate5, forKey: "activate5")
                             do {
                                 try self.context.save()
                                } catch {
                             }
                    self.buttonAlpha()
                    self.performSegue(withIdentifier: "showProjects", sender: self)
                }
                else if self.activate6 == false {
                    self.recentProject6.setBackgroundImage(.none, for: .normal)
                    self.recentProject6.backgroundColor = .black
                    self.newBackground = UIImage.init(imageLiteralResourceName: "Gray")
                    self.selectedTile = "6"
                    let r6Project = Project(context: self.context)
                    self.activate6 = true
                    UserDefaults.standard.setValue(self.activate6, forKey: "activate6")
                    r6Project.name = self.selectedTile
                    if let newValue6 = Int64(safeValue){
                    r6Project.projectValue = Int64(newValue6)
                    }
                    r6Project.homeURLTitle = "Search and Save Link"
                    r6Project.firstURLTitle = "Search and Save Link"
                    r6Project.secondURLTitle = "Search and Save Link"
                    r6Project.thirdURLTitle = "Search and Save Link"
                    r6Project.fourthURLTitle = "Search and Save Link"
                    r6Project.fifthURLTitle = "Search and Save Link"
                    r6Project.sixthURLTitle = "Search and Save Link"
                    r6Project.seventhURLTitle = "Search and Save Link"
                    r6Project.eighthURLTitle = "Search and Save Link"
                    r6Project.ninthURLTitle = "Search and Save Link"
                    r6Project.homeBasePic = "r6HomePic"
                    r6Project.homeBaseValue = 0
                    r6Project.firstBasePic = "r6FirstPic"
                    r6Project.firstBaseValue = 0
                    r6Project.secondBasePic = "r6SecondPic"
                    r6Project.secondBaseValue = 0
                    r6Project.thirdBasePic = "r6ThirdPic"
                    r6Project.thirdBaseValue = 0
                    r6Project.fourthBasePic = "r6FourthPic"
                    r6Project.fourthBaseValue = 0
                    r6Project.fifthBasePic = "r6FifthPic"
                    r6Project.fifthBaseValue = 0
                    r6Project.sixthBasePic = "r6SixthPic"
                    r6Project.sixthBaseValue = 0
                    r6Project.seventhBasePic = "r6SeventhPic"
                    r6Project.seventhBaseValue = 0
                    r6Project.eighthBasePic = "r6EighthPic"
                    r6Project.eighthBaseValue = 0
                    r6Project.ninthBasePic = "r6NinthPic"
                    r6Project.ninthBaseValue = 0
                    r6Project.peoplePic = "r6PeoplePic"
                    r6Project.homeURL = "https://www.google.com"
                    r6Project.firstURL = "https://www.google.com"
                    r6Project.secondURL = "https://www.google.com"
                    r6Project.thirdURL = "https://www.google.com"
                    r6Project.fourthURL = "https://www.google.com"
                    r6Project.fifthURL = "https://www.google.com"
                    r6Project.sixthURL = "https://www.google.com"
                    r6Project.seventhURL = "https://www.google.com"
                    r6Project.eighthURL = "https://www.google.com"
                    r6Project.ninthURL = "https://www.google.com"
                    r6Project.projectTitle = ""
                    r6Project.isActive = true
                             do {
                                 try self.context.save()
                                } catch {
                             }
                    self.buttonAlpha()
                        self.performSegue(withIdentifier: "showProjects", sender: self)
                } else {
                }
            }))
            let activations = [activate1, activate2, activate3, activate4, activate5, activate6]
            if activations.allSatisfy({$0 == true}) {
                newAlert()
            } else {
                present(alert, animated: true) {
                    self.newProjectButton.setImage(UIImage(named: "New"), for: .normal)
                    self.newProjectButton.imageView?.center.x -= 5
                }
            }
        case "Recent1":
            addLongPress()
            selectedTile = "1"
            if activate1 == false {
            } else if activate1 == true {
                newBackground = UIImage.init(imageLiteralResourceName: "Bluer")
                performSegue(withIdentifier: "showProjects", sender: self)
            }
        case "Recent2":
            selectedTile = "2"
            if activate2 == false {
            } else {
                newBackground = UIImage.init(imageLiteralResourceName: "Indigo")
                performSegue(withIdentifier: "showProjects", sender: self)
            }
        case "Recent3":
            selectedTile = "3"
            if activate3 == false {
            } else {
                newBackground = UIImage.init(imageLiteralResourceName: "Purp")
                performSegue(withIdentifier: "showProjects", sender: self)
            }
        case "Recent4":
            selectedTile = "4"
            if activate4 == false {
            } else {
                newBackground = UIImage.init(imageLiteralResourceName: "Teal")
                performSegue(withIdentifier: "showProjects", sender: self)
            }
        case "Recent5":
            selectedTile = "5"
            if activate5 == false {
            } else {
                newBackground = UIImage.init(imageLiteralResourceName: "Bluish")
                performSegue(withIdentifier: "showProjects", sender: self)
            }
        case "Recent6":
            selectedTile = "6"
            if activate6 == false {
            } else {
                newBackground = UIImage.init(imageLiteralResourceName: "Gray")
                performSegue(withIdentifier: "showProjects", sender: self)
            }
        default:
            print("Error")
        }
        func newAlert() {
            let newAlert = UIAlertController(title: "Project Limit Reached", message: "Hold down a tile to reset.", preferredStyle: .alert)
            newAlert.addAction((UIAlertAction(title: "Okay", style: .cancel)))
            present(newAlert, animated: true) {
                self.newProjectButton.setImage(UIImage(named: "New"), for: .normal)
                self.newProjectButton.imageView?.center.x -= 5
            }
        }
    }
    func addLongPress() -> Void {
        let longGesture = [UILongPressGestureRecognizer(target: self, action: #selector(longPress1)),
                           UILongPressGestureRecognizer(target: self, action: #selector(longPress2)),
                           UILongPressGestureRecognizer(target: self, action: #selector(longPress3)),
                           UILongPressGestureRecognizer(target: self, action: #selector(longPress4)),
                           UILongPressGestureRecognizer(target: self, action: #selector(longPress5)),
                           UILongPressGestureRecognizer(target: self, action: #selector(longPress6))]
        recentProject1.addGestureRecognizer(longGesture[0])
        recentProject2.addGestureRecognizer(longGesture[1])
        recentProject3.addGestureRecognizer(longGesture[2])
        recentProject4.addGestureRecognizer(longGesture[3])
        recentProject5.addGestureRecognizer(longGesture[4])
        recentProject6.addGestureRecognizer(longGesture[5])
    }
    func buttonAlpha() {
        newProjectButton.setTitleColor(.clear, for: .normal)
        recentProject1.setTitleColor(.clear, for: .normal)
        recentProject2.setTitleColor(.clear, for: .normal)
        recentProject3.setTitleColor(.clear, for: .normal)
        recentProject4.setTitleColor(.clear, for: .normal)
        recentProject5.setTitleColor(.clear, for: .normal)
        recentProject6.setTitleColor(.clear, for: .normal)
        recentProject1.alpha = 0
        recentProject2.alpha = 0
        recentProject3.alpha = 0
        recentProject4.alpha = 0
        recentProject5.alpha = 0
        recentProject6.alpha = 0
        let activations = [activate1, activate2, activate3, activate4, activate5, activate6]
        if activations.allSatisfy({ $0 == false }) {
            hexAnimation()
        }
        if activate1 == true {
            recentProject1.alpha = 1
            recentProject1.setBackgroundImage(.none, for: .normal)
            recentProject1.backgroundColor = .black
            recentProject1.setImage(loadImageFromDisk(fileName: "r1PeoplePic"), for: .normal)
            recentProject1.imageView?.contentMode = .scaleAspectFit
            recentProject1.imageView?.center.x -= 5
        }
        if activate2 == true {
            recentProject2.alpha = 1
            recentProject2.setBackgroundImage(.none, for: .normal)
            recentProject2.backgroundColor = .black
            recentProject2.setImage(loadImageFromDisk(fileName: "r2PeoplePic"), for: .normal)
            recentProject2.imageView?.contentMode = .scaleAspectFit
            recentProject2.imageView?.center.x -= 5
        }
        if activate3 == true {
            recentProject3.alpha = 1
            recentProject3.setBackgroundImage(.none, for: .normal)
            recentProject3.backgroundColor = .black
            recentProject3.setImage(loadImageFromDisk(fileName: "r3PeoplePic"), for: .normal)
            recentProject3.imageView?.contentMode = .scaleAspectFit
            recentProject3.imageView?.center.x -= 5
        }
        if activate4 == true {
            recentProject4.alpha = 1
            recentProject4.setBackgroundImage(.none, for: .normal)
            recentProject4.backgroundColor = .black
            recentProject4.setImage(loadImageFromDisk(fileName: "r4PeoplePic"), for: .normal)
            recentProject4.imageView?.contentMode = .scaleAspectFit
            recentProject4.imageView?.center.x -= 5
        }
        if activate5 == true {
            recentProject5.alpha = 1
            recentProject5.setBackgroundImage(.none, for: .normal)
            recentProject5.backgroundColor = .black
            recentProject5.setImage(loadImageFromDisk(fileName: "r5PeoplePic"), for: .normal)
            recentProject5.imageView?.contentMode = .scaleAspectFit
            recentProject5.imageView?.center.x -= 5
        }
        if activate6 == true {
            recentProject6.alpha = 1
            recentProject6.setBackgroundImage(.none, for: .normal)
            recentProject6.backgroundColor = .black
            recentProject6.setImage(loadImageFromDisk(fileName: "r6PeoplePic"), for: .normal)
            recentProject6.imageView?.contentMode = .scaleAspectFit
            recentProject6.imageView?.center.x -= 5
        }
    }
    func hexAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            UIView.animate(withDuration: 0.5, delay: 0) {
                self.recentProject1.alpha = 1
            } completion: { done in
                if done {
                    UIView.animate(withDuration: 0.5, delay: 0) {
                        self.recentProject1.alpha = 0
                    }
                }
            }
            UIView.animate(withDuration: 0.5, delay: 0.05) {
                self.recentProject2.alpha = 1
            } completion: { done in
                if done {
                    UIView.animate(withDuration: 0.5, delay: 0.05) {
                        self.recentProject2.alpha = 0
                    }
                }
            }
            UIView.animate(withDuration: 0.5, delay: 0.1) {
                self.recentProject3.alpha = 1
            } completion: { done in
                if done {
                    UIView.animate(withDuration: 0.5, delay: 0.1) {
                        self.recentProject3.alpha = 0
                    }
                }
            }
            UIView.animate(withDuration: 0.5, delay: 0.15) {
                self.recentProject4.alpha = 1
            } completion: { done in
                if done {
                    UIView.animate(withDuration: 0.5, delay: 0.15) {
                        self.recentProject4.alpha = 0
                    }
                }
            }
            UIView.animate(withDuration: 0.5, delay: 0.2) {
                self.recentProject5.alpha = 1
            } completion: { done in
                if done {
                    UIView.animate(withDuration: 0.5, delay: 0.2) {
                        self.recentProject5.alpha = 0
                    }
                }
            }
            UIView.animate(withDuration: 0.5, delay: 0.25) {
                self.recentProject6.alpha = 1
            } completion: { done in
                if done {
                    UIView.animate(withDuration: 0.5, delay: 0.25) {
                        self.recentProject6.alpha = 0
                    }
                }
            }
        }
    }
    func fetchProject() -> [Project] {
        let request = Project.fetchRequest() as NSFetchRequest<Project>
        let pred = NSPredicate(format: "name CONTAINS \(selectedTile)")
        request.predicate = pred
        do {
            let project = try context.fetch(request)
            project.forEach { project in
                 let active = project.isActive
                guard let title = project.name
             else {
                fatalError("Error")
            }
                print(title)
                print(active)
            }
        } catch {
            fatalError("Error")
        }
        return []
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
    func deleteImage(imageName: String) {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        let fileName = imageName
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try FileManager.default.removeItem(atPath: fileURL.path) }
            catch let removeError {
                print(removeError)
            }
        }
}
}
extension UIView {
    func setupHexagonView() {
        let lineWidth: CGFloat = 5
        let path = self.roundedPolygonPath(rect: self.bounds, lineWidth: lineWidth, sides: 6, cornerRadius: 10, rotationOffset: CGFloat(.pi / 2.0))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        mask.lineWidth = lineWidth
        mask.strokeColor = UIColor.clear.cgColor
        mask.fillColor = UIColor.white.cgColor
        self.layer.mask = mask
        let border = CAShapeLayer()
        border.path = path.cgPath
        border.lineWidth = lineWidth
        border.strokeColor = UIColor.white.cgColor
        border.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(border)
    }
    public func roundedPolygonPath(rect: CGRect, lineWidth: CGFloat, sides: NSInteger, cornerRadius: CGFloat, rotationOffset: CGFloat = 0) -> UIBezierPath {
            let path = UIBezierPath()
            let theta: CGFloat = CGFloat(2.0 * .pi) / CGFloat(sides)
            let width = min(rect.size.width, rect.size.height)
            let center = CGPoint(x: rect.origin.x + width / 2.0, y: rect.origin.y + width / 2.0)
            let radius = (width - lineWidth + cornerRadius - (cos(theta) * cornerRadius)) / 2.0
            var angle = CGFloat(rotationOffset)
            let corner = CGPoint(x: center.x + (radius - cornerRadius) * cos(angle), y: center.y + (radius - cornerRadius) * sin(angle))
            path.move(to: CGPoint(x: corner.x + cornerRadius * cos(angle + theta), y: corner.y + cornerRadius * sin(angle + theta)))
            for _ in 0..<sides {
                angle += theta
                let corner = CGPoint(x: center.x + (radius - cornerRadius) * cos(angle), y: center.y + (radius - cornerRadius) * sin(angle))
                let tip = CGPoint(x: center.x + radius * cos(angle), y: center.y + radius * sin(angle))
                let start = CGPoint(x: corner.x + cornerRadius * cos(angle - theta), y: corner.y + cornerRadius * sin(angle - theta))
                let end = CGPoint(x: corner.x + cornerRadius * cos(angle + theta), y: corner.y + cornerRadius * sin(angle + theta))
                path.addLine(to: start)
                path.addQuadCurve(to: end, controlPoint: tip)
            }
            path.close()
            let bounds = path.bounds
            let transform = CGAffineTransform(translationX: -bounds.origin.x + rect.origin.x + lineWidth / 2.0, y: -bounds.origin.y + rect.origin.y + lineWidth / 2.0)
            path.apply(transform)
            return path
        }
    }
