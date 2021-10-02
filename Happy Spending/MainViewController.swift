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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        buttonAlpha()
        
        newProjectButton.imageView?.center.x -= 5
        
        newProjectButton.imageView?.contentMode = .scaleAspectFit
        addLongPress()
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //        navigationController?.navigationBar.isHidden = true
        
    }
    
    @objc func longPress1(_ sender: UIGestureRecognizer) -> Void {
        if sender.state == .began {
            let feedback = UIImpactFeedbackGenerator(style: .heavy)
            feedback.impactOccurred()
        let alert = UIAlertController(title: "Delete", message: "Remove saved project?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { UIAlertAction in
            self.activate1 = false
            self.recentProject1.setBackgroundImage(.none, for: .normal)
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
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
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
            self.recentProject2.setBackgroundImage(.none, for: .normal)
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
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
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
            self.recentProject3.setBackgroundImage(.none, for: .normal)
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
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
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
            self.recentProject4.setBackgroundImage(.none, for: .normal)
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
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
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
            self.recentProject5.setBackgroundImage(.none, for: .normal)
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
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
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
            self.recentProject6.setBackgroundImage(.none, for: .normal)
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
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true, completion: nil)
        }
    
    }
    
    @IBAction func hexPressed(_ sender: UIButton) {
        
        sender.backgroundColor = .black
        
        
        switch sender.currentTitle {
        case "New":
            sender.setImage(.none, for: .normal)
            let vc = UIViewController()
            vc.preferredContentSize = CGSize(width: screenWidth, height: screenHeight)
            let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
            pickerView.dataSource = self
            pickerView.delegate = self
            pickerView.selectRow(selectedRow, inComponent: 0, animated: false)
            vc.view.addSubview(pickerView)
            pickerView.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
            pickerView.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
            
            let alert = UIAlertController(title: "", message: "What is your budget?", preferredStyle: .actionSheet)
            
            alert.popoverPresentationController?.sourceView = sender
            alert.popoverPresentationController?.sourceRect = sender.bounds
            
            alert.setValue(vc, forKey: "contentViewController")
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
                (UIAlertAction) in
                self.newProjectButton.setImage(UIImage.init(imageLiteralResourceName: "New"), for: .normal)
                self.newProjectButton.imageView?.center.x -= 5
            }))
            alert.addAction(UIAlertAction(title: "Select", style: .default, handler: {
                (UIAlertAction) in
                self.newProjectButton.setImage(UIImage.init(imageLiteralResourceName: "New"), for: .normal)
                self.newProjectButton.imageView?.center.x -= 5
                self.selectedRow = pickerView.selectedRow(inComponent: 0)
                let selected = self.projectValue[self.selectedRow]
                self.selectedValue = selected
                
                if self.activate1 == false {
                    self.recentProject1.setBackgroundImage(UIImage(named: "Bluer"), for: .normal)
                    self.newBackground = UIImage.init(imageLiteralResourceName: "Bluer")
                    self.selectedTile = "1"
                    self.activate1 = true
                    UserDefaults.standard.setValue(self.activate1, forKey: "activate1")
                    self.buttonAlpha()
                    self.performSegue(withIdentifier: "showProjects", sender: self)
                    let r1Project = Project(context: self.context)
                    r1Project.name = self.selectedTile
                    r1Project.projectValue = Int64(self.projectValue[self.selectedRow])
                    r1Project.homeURLTitle = "Search"
                    r1Project.firstURLTitle = "Search"
                    r1Project.secondURLTitle = "Search"
                    r1Project.thirdURLTitle = "Search"
                    r1Project.homeBasePic = "r1HomePic"
                    r1Project.homeBaseValue = 0
                    r1Project.firstBasePic = "r1FirstPic"
                    r1Project.firstBaseValue = 0
                    r1Project.secondBasePic = "r1SecondPic"
                    r1Project.secondBaseValue = 0
                    r1Project.thirdBasePic = "r1ThirdPic"
                    r1Project.thirdBaseValue = 0
                    r1Project.peoplePic = "r1PeoplePic"
                    r1Project.homeURL = "https://www.google.com"
                    r1Project.firstURL = "https://www.google.com"
                    r1Project.secondURL = "https://www.google.com"
                    r1Project.thirdURL = "https://www.google.com"
                    r1Project.isActive = true
                             do {
                                 try self.context.save()
                                } catch {
                    }
                   
                        
                    
                }
                else if self.activate2 == false {
                    self.recentProject2.setBackgroundImage(UIImage(named: "Indigo"), for: .normal)
                    self.newBackground = UIImage.init(imageLiteralResourceName: "Indigo")
                    self.selectedTile = "2"
                    let r2Project = Project(context: self.context)
                    self.activate2 = true
                    r2Project.name = self.selectedTile
                    r2Project.projectValue = Int64(self.projectValue[self.selectedRow])
                    r2Project.homeURLTitle = "Search"
                    r2Project.firstURLTitle = "Search"
                    r2Project.secondURLTitle = "Search"
                    r2Project.thirdURLTitle = "Search"
                    r2Project.homeBasePic = "r2HomePic"
                    r2Project.homeBaseValue = 0
                    r2Project.firstBasePic = "r2FirstPic"
                    r2Project.firstBaseValue = 0
                    r2Project.secondBasePic = "r2SecondPic"
                    r2Project.secondBaseValue = 0
                    r2Project.thirdBasePic = "r2ThirdPic"
                    r2Project.thirdBaseValue = 0
                    r2Project.peoplePic = "r2PeoplePic"
                    r2Project.homeURL = "https://www.google.com"
                    r2Project.firstURL = "https://www.google.com"
                    r2Project.secondURL = "https://www.google.com"
                    r2Project.thirdURL = "https://www.google.com"
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
                    self.recentProject3.setBackgroundImage(UIImage(named: "Purp"), for: .normal)
                    self.newBackground = UIImage.init(imageLiteralResourceName: "Purp")
                    self.selectedTile = "3"
                    let r3Project = Project(context: self.context)
                    self.activate3 = true
                    r3Project.name = self.selectedTile
                    r3Project.projectValue = Int64(self.projectValue[self.selectedRow])
                    r3Project.homeURLTitle = "Search"
                    r3Project.firstURLTitle = "Search"
                    r3Project.secondURLTitle = "Search"
                    r3Project.thirdURLTitle = "Search"
                    r3Project.homeBasePic = "r3HomePic"
                    r3Project.homeBaseValue = 0
                    r3Project.firstBasePic = "r3FirstPic"
                    r3Project.firstBaseValue = 0
                    r3Project.secondBasePic = "r3SecondPic"
                    r3Project.secondBaseValue = 0
                    r3Project.thirdBasePic = "r3ThirdPic"
                    r3Project.thirdBaseValue = 0
                    r3Project.peoplePic = "r3PeoplePic"
                    r3Project.homeURL = "https://www.google.com"
                    r3Project.firstURL = "https://www.google.com"
                    r3Project.secondURL = "https://www.google.com"
                    r3Project.thirdURL = "https://www.google.com"
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
                    self.recentProject4.setBackgroundImage(UIImage(named: "Teal"), for: .normal)
                    self.newBackground = UIImage.init(imageLiteralResourceName: "Teal")
                    self.selectedTile = "4"
                    let r4Project = Project(context: self.context)
                    self.activate4 = true
                    r4Project.name = self.selectedTile
                    r4Project.projectValue = Int64(self.projectValue[self.selectedRow])
                    r4Project.homeURLTitle = "Search"
                    r4Project.firstURLTitle = "Search"
                    r4Project.secondURLTitle = "Search"
                    r4Project.thirdURLTitle = "Search"
                    r4Project.homeBasePic = "r4HomePic"
                    r4Project.homeBaseValue = 0
                    r4Project.firstBasePic = "r4FirstPic"
                    r4Project.firstBaseValue = 0
                    r4Project.secondBasePic = "r4SecondPic"
                    r4Project.secondBaseValue = 0
                    r4Project.thirdBasePic = "r4ThirdPic"
                    r4Project.thirdBaseValue = 0
                    r4Project.peoplePic = "r4PeoplePic"
                    r4Project.homeURL = "https://www.google.com"
                    r4Project.firstURL = "https://www.google.com"
                    r4Project.secondURL = "https://www.google.com"
                    r4Project.thirdURL = "https://www.google.com"
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
                    self.recentProject5.setBackgroundImage(UIImage(named: "Bluish"), for: .normal)
                    self.newBackground = UIImage.init(imageLiteralResourceName: "Bluish")
                    self.selectedTile = "5"
                    let r5Project = Project(context: self.context)
                    self.activate5 = true
                    r5Project.name = self.selectedTile
                    r5Project.projectValue = Int64(self.projectValue[self.selectedRow])
                    r5Project.homeURLTitle = "Search"
                    r5Project.firstURLTitle = "Search"
                    r5Project.secondURLTitle = "Search"
                    r5Project.thirdURLTitle = "Search"
                    r5Project.homeBasePic = "r5HomePic"
                    r5Project.homeBaseValue = 0
                    r5Project.firstBasePic = "r5FirstPic"
                    r5Project.firstBaseValue = 0
                    r5Project.secondBasePic = "r5SecondPic"
                    r5Project.secondBaseValue = 0
                    r5Project.thirdBasePic = "r5ThirdPic"
                    r5Project.thirdBaseValue = 0
                    r5Project.peoplePic = "r5PeoplePic"
                    r5Project.homeURL = "https://www.google.com"
                    r5Project.firstURL = "https://www.google.com"
                    r5Project.secondURL = "https://www.google.com"
                    r5Project.thirdURL = "https://www.google.com"
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
                    self.recentProject6.setBackgroundImage(UIImage(named: "Gray"), for: .normal)
                    self.newBackground = UIImage.init(imageLiteralResourceName: "Gray")
                    self.selectedTile = "6"
                    let r6Project = Project(context: self.context)
                    self.activate6 = true
                    UserDefaults.standard.setValue(self.activate6, forKey: "activate6")
                    r6Project.name = self.selectedTile
                    r6Project.projectValue = Int64(self.projectValue[self.selectedRow])
                    r6Project.homeURLTitle = "Search"
                    r6Project.firstURLTitle = "Search"
                    r6Project.secondURLTitle = "Search"
                    r6Project.thirdURLTitle = "Search"
                    r6Project.homeBasePic = "r6HomePic"
                    r6Project.homeBaseValue = 0
                    r6Project.firstBasePic = "r6FirstPic"
                    r6Project.firstBaseValue = 0
                    r6Project.secondBasePic = "r6SecondPic"
                    r6Project.secondBaseValue = 0
                    r6Project.thirdBasePic = "r6ThirdPic"
                    r6Project.thirdBaseValue = 0
                    r6Project.peoplePic = "r6PeoplePic"
                    r6Project.homeURL = "https://www.google.com"
                    r6Project.firstURL = "https://www.google.com"
                    r6Project.secondURL = "https://www.google.com"
                    r6Project.thirdURL = "https://www.google.com"
                    r6Project.isActive = true
                    
                             do {
                                 try self.context.save()
                                } catch {
                             }
                    
                    
                    self.buttonAlpha()
                        self.performSegue(withIdentifier: "showProjects", sender: self)
                } else {
                    
                    newAlert()
                }
                
                
            }))
            present(alert, animated: true, completion: nil)
            newProjectButton.imageView?.center.x -= 5
            
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
            let newAlert = UIAlertController(title: "Project Limit Reached", message: "Hold down tile to reset.", preferredStyle: .alert)
            newAlert.addAction((UIAlertAction(title: "Okay", style: .cancel)))
            present(newAlert, animated: true, completion: nil)
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
        
        if activate1 == true {
            recentProject1.setBackgroundImage(UIImage(named: "Bluer"), for: .normal)
        }
        if activate2 == true {
            recentProject2.setBackgroundImage(UIImage(named: "Indigo"), for: .normal)
        }
        if activate3 == true {
            recentProject3.setBackgroundImage(UIImage(named: "Purp"), for: .normal)
        }
        if activate4 == true {
            recentProject4.setBackgroundImage(UIImage(named: "Teal"), for: .normal)
        }
        if activate5 == true {
            recentProject5.setBackgroundImage(UIImage(named: "Bluish"), for: .normal)
        }
        if activate6 == true {
            recentProject6.setBackgroundImage(UIImage(named: "Gray"), for: .normal)
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
    
    /// Set the view layer as an hexagon
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
            let theta: CGFloat = CGFloat(2.0 * .pi) / CGFloat(sides) // How much to turn at every corner
            let width = min(rect.size.width, rect.size.height)        // Width of the square
            
            let center = CGPoint(x: rect.origin.x + width / 2.0, y: rect.origin.y + width / 2.0)
            
            // Radius of the circle that encircles the polygon
            // Notice that the radius is adjusted for the corners, that way the largest outer
            // dimension of the resulting shape is always exactly the width - linewidth
            let radius = (width - lineWidth + cornerRadius - (cos(theta) * cornerRadius)) / 2.0
            
            // Start drawing at a point, which by default is at the right hand edge
            // but can be offset
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
            
            // Move the path to the correct origins
            let bounds = path.bounds
            let transform = CGAffineTransform(translationX: -bounds.origin.x + rect.origin.x + lineWidth / 2.0, y: -bounds.origin.y + rect.origin.y + lineWidth / 2.0)
            path.apply(transform)
            
            return path
        }
    }


