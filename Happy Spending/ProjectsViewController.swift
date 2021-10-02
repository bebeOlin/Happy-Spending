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
    @IBOutlet weak var homeBaseValue: UILabel!
    @IBOutlet weak var thirdBaseValue: UILabel!
    @IBOutlet weak var secondBaseValue: UILabel!
    @IBOutlet weak var firstBaseValue: UILabel!
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
    var setBackground = UIImage.init(imageLiteralResourceName: "Bluer")
    var currentTile = ""
    var basePicked = ""
    var peoplePic = ""
    var updatedValueObserver: NSObjectProtocol?
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadProject()
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false

        
        spentValue = homeBaseSum + firstBaseSum + secondBaseSum + thirdBaseSum
        remainingValue = newValue - spentValue
        projectsBackground.image = setBackground
        title = "$\(newValue)"
        
        loadImages()
        peoplePicker.newCircle()
        homeBase.newCircle()
        firstBase.newCircle()
        secondBase.newCircle()
        thirdBase.newCircle()
        moneySpent.textColor = .systemRed
        moneyRemaining.textColor = .systemGreen
        moneySpent.text = "$\(spentValue)"
        moneyRemaining.text = "$\(remainingValue)"
        homeBaseValue.text = "$\(homeBaseSum)"
        firstBaseValue.text = "$\(firstBaseSum)"
        secondBaseValue.text = "$\(secondBaseSum)"
        thirdBaseValue.text = "$\(thirdBaseSum)"
        
        updatedValueObserver = NotificationCenter.default.addObserver(forName: Notification.Name("updatedValue"), object: nil, queue: .main, using: { [self] (notification) in
            
            self.loadProject()
            
            self.spentValue = self.homeBaseSum + self.firstBaseSum + self.secondBaseSum + self.thirdBaseSum
            self.remainingValue = self.newValue - self.spentValue
            self.moneySpent.text = "$\(self.spentValue)"
            self.moneyRemaining.text = "$\(self.remainingValue)"
            self.homeBaseValue.text = "$\(self.homeBaseSum)"
            self.firstBaseValue.text = "$\(self.firstBaseSum)"
            self.secondBaseValue.text = "$\(self.secondBaseSum)"
            self.thirdBaseValue.text = "$\(self.thirdBaseSum)"
            
            
        })
        
        
        
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
                
                }
            } catch {
                fatalError("Error")
            }
        default:
            print("Error")
        }
    }
    
//    func saveProject() {
//        switch currentTile {
//        case "1":
//
//            let request = Project.fetchRequest() as NSFetchRequest<Project>
//            let pred = NSPredicate(format: "name CONTAINS 1")
//            request.predicate = pred
//            do {
//                let project = try context.fetch(request)
//                for project in project {
//
//                    project.homeValue = Int64(self.homeBaseSum)
//                    project.firstValue = Int64(self.firstBaseSum)
//                    project.secondValue = Int64(self.secondBaseSum)
//                    project.thirdValue = Int64(self.thirdBaseSum)
//
//
//                    do {
//                        try context.save()
//                    } catch {
//
//                    }
//                }
//
//            } catch {
//
//            }
//
//        case "2":
//            let request = Project.fetchRequest() as NSFetchRequest<Project>
//            let pred = NSPredicate(format: "name CONTAINS 2")
//            request.predicate = pred
//            do {
//                let project = try context.fetch(request)
//                for project in project {
//                    project.homeValue = Int64(self.homeBaseSum)
//                    project.firstValue = Int64(self.firstBaseSum)
//                    project.secondValue = Int64(self.secondBaseSum)
//                    project.thirdValue = Int64(self.thirdBaseSum)
//                    project.projectValue = Int64(self.newValue)
//
//                    do {
//                        try context.save()
//                    } catch {
//
//                    }
//                }
//
//            } catch {
//
//            }
//        case "3":
//            let request = Project.fetchRequest() as NSFetchRequest<Project>
//            let pred = NSPredicate(format: "name CONTAINS 3")
//            request.predicate = pred
//            do {
//                let project = try context.fetch(request)
//                for project in project {
//                    project.homeValue = Int64(self.homeBaseSum)
//                    project.firstValue = Int64(self.firstBaseSum)
//                    project.secondValue = Int64(self.secondBaseSum)
//                    project.thirdValue = Int64(self.thirdBaseSum)
//                    project.projectValue = Int64(self.newValue)
//
//                    do {
//                        try context.save()
//                    } catch {
//
//                    }
//                }
//
//            } catch {
//
//            }
//        case "4":
//            let request = Project.fetchRequest() as NSFetchRequest<Project>
//            let pred = NSPredicate(format: "name CONTAINS 4")
//            request.predicate = pred
//            do {
//                let project = try context.fetch(request)
//                for project in project {
//                    project.homeValue = Int64(self.homeBaseSum)
//                    project.firstValue = Int64(self.firstBaseSum)
//                    project.secondValue = Int64(self.secondBaseSum)
//                    project.thirdValue = Int64(self.thirdBaseSum)
//                    project.projectValue = Int64(self.newValue)
//
//                    do {
//                        try context.save()
//                    } catch {
//
//                    }
//                }
//
//            } catch {
//
//            }
//        case "5":
//            let request = Project.fetchRequest() as NSFetchRequest<Project>
//            let pred = NSPredicate(format: "name CONTAINS 5")
//            request.predicate = pred
//            do {
//                let project = try context.fetch(request)
//                for project in project {
//                    project.homeValue = Int64(self.homeBaseSum)
//                    project.firstValue = Int64(self.firstBaseSum)
//                    project.secondValue = Int64(self.secondBaseSum)
//                    project.thirdValue = Int64(self.thirdBaseSum)
//                    project.projectValue = Int64(self.newValue)
//
//                    do {
//                        try context.save()
//                    } catch {
//
//                    }
//                }
//
//            } catch {
//
//            }
//        case "6":
//            let request = Project.fetchRequest() as NSFetchRequest<Project>
//            let pred = NSPredicate(format: "name CONTAINS 6")
//            request.predicate = pred
//            do {
//                let project = try context.fetch(request)
//                for project in project {
//                    project.homeValue = Int64(self.homeBaseSum)
//                    project.firstValue = Int64(self.firstBaseSum)
//                    project.secondValue = Int64(self.secondBaseSum)
//                    project.thirdValue = Int64(self.thirdBaseSum)
//                    project.projectValue = Int64(self.newValue)
//
//                    do {
//                        try context.save()
//                    } catch {
//
//                    }
//                }
//
//            } catch {
//
//            }
//        default:
//            print("Error")
//        }
//
//
//    }
    
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
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        
        present(vc, animated: true)
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
        print("Project Saved")
//        saveProject()
    }
    
    
    
    func loadImages() {
        switch currentTile {
        case "1":
            peoplePicker.setImage(loadImageFromDisk(fileName: peoplePic), for: .normal)
        case "2":
            peoplePicker.setImage(loadImageFromDisk(fileName: peoplePic), for: .normal)
        case "3":
            peoplePicker.setImage(loadImageFromDisk(fileName: peoplePic), for: .normal)
        case "4":
            peoplePicker.setImage(loadImageFromDisk(fileName: peoplePic), for: .normal)
        case "5":
            peoplePicker.setImage(loadImageFromDisk(fileName: peoplePic), for: .normal)
        case "6":
            peoplePicker.setImage(loadImageFromDisk(fileName: peoplePic), for: .normal)
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
        loadImages()
        picker.dismiss(animated: true, completion: nil)
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

