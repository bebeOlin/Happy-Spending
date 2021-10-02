//
//  UpgradesViewController.swift
//  Happy Spending
//
//  Created by Bruce Bolin on 10/1/21.
//

import UIKit
import CoreData

class UpgradesViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext


  
   

    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var valueButton: UIButton!
    @IBOutlet weak var imagineImage: UIImageView!
    var baseImage = ""
    var currentBase = ""
    var selectedLink = ""
    var rootTile = ""
    var urlObserver: NSObjectProtocol?
    var itemCurrentValue: Int64 = 0
    var loadedURL = ""
    var loadedTitle = ""
    var moneyRemaining: Int64 = 0
    var projectTotal: Int64 = 0
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadProject()
        loadImages()
        

        urlObserver = NotificationCenter.default.addObserver(forName: Notification.Name("urlChanged"), object: nil, queue: .main, using: { (notification) in
            
            self.loadProject()
            
        })
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        saveProject()
        NotificationCenter.default.post(name: Notification.Name("updatedValue"), object: nil)
        
    }
    
    func loadProject() {
        switch rootTile {
        case "1":
            let request = Project.fetchRequest() as NSFetchRequest<Project>
            let pred = NSPredicate(format: "name CONTAINS 1")
            request.predicate = pred
            
            do {
                let project = try context.fetch(request)
                
                project.forEach { project in
                    switch currentBase {
                    case "Home Base":
                        if let homePic = project.homeBasePic {
                            self.baseImage = homePic
                        }
                        
                        self.itemCurrentValue = project.homeBaseValue
                        self.valueButton.setTitle("$\(itemCurrentValue)", for: .normal)
                        self.selectedLink = project.homeURL ?? "https://www.google.com"
                        self.loadedTitle = project.homeURLTitle ?? "Search"
                        self.linkButton.setTitle(loadedTitle, for: .normal)
                        
                    case "First Base":
                        if let firstPic = project.firstBasePic {
                            self.baseImage = firstPic
                        }
                        
                        self.itemCurrentValue = project.firstBaseValue
                        self.valueButton.setTitle("$\(itemCurrentValue)", for: .normal)
                        self.selectedLink = project.firstURL ?? "https://www.google.com"
                        self.loadedTitle = project.firstURLTitle ?? "Search"
                        self.linkButton.setTitle(loadedTitle, for: .normal)
                        
                    case "Second Base":
                        if let secondPic = project.secondBasePic {
                            self.baseImage = secondPic
                        }
                        
                        self.itemCurrentValue = project.secondBaseValue
                        self.valueButton.setTitle("$\(itemCurrentValue)", for: .normal)
                        self.selectedLink = project.secondURL ?? "https://www.google.com"
                        self.loadedTitle = project.secondURLTitle ?? "Search"
                        self.linkButton.setTitle(loadedTitle, for: .normal)
                        
                    case "Third Base":
                        if let thirdPic = project.thirdBasePic {
                            self.baseImage = thirdPic
                        }
                        self.itemCurrentValue = project.thirdBaseValue
                        self.valueButton.setTitle("$\(itemCurrentValue)", for: .normal)
                        self.selectedLink = project.thirdURL ?? "https://www.google.com"
                        self.loadedTitle = project.thirdURLTitle ?? "Search"
                        self.linkButton.setTitle(loadedTitle, for: .normal)
                        
                    default:
                        print("Error")
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
                    switch currentBase {
                    case "Home Base":
                        self.baseImage = project.homeBasePic ?? ""
                        self.itemCurrentValue = project.homeBaseValue
                        self.valueButton.setTitle("$\(itemCurrentValue)", for: .normal)
                        self.selectedLink = project.homeURL ?? "https://www.google.com"
                        self.loadedTitle = project.homeURLTitle ?? "Search"
                        self.linkButton.setTitle(loadedTitle, for: .normal)
                    case "First Base":
                        self.baseImage = project.firstBasePic ?? ""
                        self.itemCurrentValue = project.firstBaseValue
                        self.valueButton.setTitle("$\(itemCurrentValue)", for: .normal)
                        self.selectedLink = project.firstURL ?? "https://www.google.com"
                        self.loadedTitle = project.firstURLTitle ?? "Search"
                        self.linkButton.setTitle(loadedTitle, for: .normal)
                    case "Second Base":
                        self.baseImage = project.secondBasePic ?? ""
                        self.itemCurrentValue = project.secondBaseValue
                        self.valueButton.setTitle("$\(itemCurrentValue)", for: .normal)
                        self.selectedLink = project.secondURL ?? "https://www.google.com"
                        self.loadedTitle = project.secondURLTitle ?? "Search"
                        self.linkButton.setTitle(loadedTitle, for: .normal)
                    case "Third Base":
                        self.baseImage = project.thirdBasePic ?? ""
                        self.itemCurrentValue = project.thirdBaseValue
                        self.valueButton.setTitle("$\(itemCurrentValue)", for: .normal)
                        self.selectedLink = project.thirdURL ?? "https://www.google.com"
                        self.loadedTitle = project.thirdURLTitle ?? "Search"
                        self.linkButton.setTitle(loadedTitle, for: .normal)
                    default:
                        print("Error")
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
                    switch currentBase {
                    case "Home Base":
                        self.baseImage = project.homeBasePic ?? ""
                        self.itemCurrentValue = project.homeBaseValue
                        self.valueButton.setTitle("$\(itemCurrentValue)", for: .normal)
                        self.selectedLink = project.homeURL ?? "https://www.google.com"
                        self.loadedTitle = project.homeURLTitle ?? "Search"
                        self.linkButton.setTitle(loadedTitle, for: .normal)
                    case "First Base":
                        self.baseImage = project.firstBasePic ?? ""
                        self.itemCurrentValue = project.firstBaseValue
                        self.valueButton.setTitle("$\(itemCurrentValue)", for: .normal)
                        self.selectedLink = project.firstURL ?? "https://www.google.com"
                        self.loadedTitle = project.firstURLTitle ?? "Search"
                        self.linkButton.setTitle(loadedTitle, for: .normal)
                    case "Second Base":
                        self.baseImage = project.secondBasePic ?? ""
                        self.itemCurrentValue = project.secondBaseValue
                        self.valueButton.setTitle("$\(itemCurrentValue)", for: .normal)
                        self.selectedLink = project.secondURL ?? "https://www.google.com"
                        self.loadedTitle = project.secondURLTitle ?? "Search"
                        self.linkButton.setTitle(loadedTitle, for: .normal)
                    case "Third Base":
                        self.baseImage = project.thirdBasePic ?? ""
                        self.itemCurrentValue = project.thirdBaseValue
                        self.valueButton.setTitle("$\(itemCurrentValue)", for: .normal)
                        self.selectedLink = project.thirdURL ?? "https://www.google.com"
                        self.loadedTitle = project.thirdURLTitle ?? "Search"
                        self.linkButton.setTitle(loadedTitle, for: .normal)
                    default:
                        print("Error")
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
                    switch currentBase {
                    case "Home Base":
                        self.baseImage = project.homeBasePic ?? ""
                        self.itemCurrentValue = project.homeBaseValue
                        self.valueButton.setTitle("$\(itemCurrentValue)", for: .normal)
                        self.selectedLink = project.homeURL ?? "https://www.google.com"
                        self.loadedTitle = project.homeURLTitle ?? "Search"
                        self.linkButton.setTitle(loadedTitle, for: .normal)
                    case "First Base":
                        self.baseImage = project.firstBasePic ?? ""
                        self.itemCurrentValue = project.firstBaseValue
                        self.valueButton.setTitle("$\(itemCurrentValue)", for: .normal)
                        self.selectedLink = project.firstURL ?? "https://www.google.com"
                        self.loadedTitle = project.firstURLTitle ?? "Search"
                        self.linkButton.setTitle(loadedTitle, for: .normal)
                    case "Second Base":
                        self.baseImage = project.secondBasePic ?? ""
                        self.itemCurrentValue = project.secondBaseValue
                        self.valueButton.setTitle("$\(itemCurrentValue)", for: .normal)
                        self.selectedLink = project.secondURL ?? "https://www.google.com"
                        self.loadedTitle = project.secondURLTitle ?? "Search"
                        self.linkButton.setTitle(loadedTitle, for: .normal)
                    case "Third Base":
                        self.baseImage = project.thirdBasePic ?? ""
                        self.itemCurrentValue = project.thirdBaseValue
                        self.valueButton.setTitle("$\(itemCurrentValue)", for: .normal)
                        self.selectedLink = project.thirdURL ?? "https://www.google.com"
                        self.loadedTitle = project.thirdURLTitle ?? "Search"
                        self.linkButton.setTitle(loadedTitle, for: .normal)
                    default:
                        print("Error")
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
                    switch currentBase {
                    case "Home Base":
                        self.baseImage = project.homeBasePic ?? ""
                        self.itemCurrentValue = project.homeBaseValue
                        self.valueButton.setTitle("$\(itemCurrentValue)", for: .normal)
                        self.selectedLink = project.homeURL ?? "https://www.google.com"
                        self.loadedTitle = project.homeURLTitle ?? "Search"
                        self.linkButton.setTitle(loadedTitle, for: .normal)
                    case "First Base":
                        self.baseImage = project.firstBasePic ?? ""
                        self.itemCurrentValue = project.firstBaseValue
                        self.valueButton.setTitle("$\(itemCurrentValue)", for: .normal)
                        self.selectedLink = project.firstURL ?? "https://www.google.com"
                        self.loadedTitle = project.firstURLTitle ?? "Search"
                        self.linkButton.setTitle(loadedTitle, for: .normal)
                    case "Second Base":
                        self.baseImage = project.secondBasePic ?? ""
                        self.itemCurrentValue = project.secondBaseValue
                        self.valueButton.setTitle("$\(itemCurrentValue)", for: .normal)
                        self.selectedLink = project.secondURL ?? "https://www.google.com"
                        self.loadedTitle = project.secondURLTitle ?? "Search"
                        self.linkButton.setTitle(loadedTitle, for: .normal)
                    case "Third Base":
                        self.baseImage = project.thirdBasePic ?? ""
                        self.itemCurrentValue = project.thirdBaseValue
                        self.valueButton.setTitle("$\(itemCurrentValue)", for: .normal)
                        self.selectedLink = project.thirdURL ?? "https://www.google.com"
                        self.loadedTitle = project.thirdURLTitle ?? "Search"
                        self.linkButton.setTitle(loadedTitle, for: .normal)
                    default:
                        print("Error")
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
                    switch currentBase {
                    case "Home Base":
                        self.baseImage = project.homeBasePic ?? ""
                        self.itemCurrentValue = project.homeBaseValue
                        self.valueButton.setTitle("$\(itemCurrentValue)", for: .normal)
                        self.selectedLink = project.homeURL ?? "https://www.google.com"
                        self.loadedTitle = project.homeURLTitle ?? "Search"
                        self.linkButton.setTitle(loadedTitle, for: .normal)
                    case "First Base":
                        self.baseImage = project.firstBasePic ?? ""
                        self.itemCurrentValue = project.firstBaseValue
                        self.valueButton.setTitle("$\(itemCurrentValue)", for: .normal)
                        self.selectedLink = project.firstURL ?? "https://www.google.com"
                        self.loadedTitle = project.firstURLTitle ?? "Search"
                        self.linkButton.setTitle(loadedTitle, for: .normal)
                    case "Second Base":
                        self.baseImage = project.secondBasePic ?? ""
                        self.itemCurrentValue = project.secondBaseValue
                        self.valueButton.setTitle("$\(itemCurrentValue)", for: .normal)
                        self.selectedLink = project.secondURL ?? "https://www.google.com"
                        self.loadedTitle = project.secondURLTitle ?? "Search"
                        self.linkButton.setTitle(loadedTitle, for: .normal)
                    case "Third Base":
                        self.baseImage = project.thirdBasePic ?? ""
                        self.itemCurrentValue = project.thirdBaseValue
                        self.valueButton.setTitle("$\(itemCurrentValue)", for: .normal)
                        self.selectedLink = project.thirdURL ?? "https://www.google.com"
                        self.loadedTitle = project.thirdURLTitle ?? "Search"
                        self.linkButton.setTitle(loadedTitle, for: .normal)
                    default:
                        print("Error")
                    }
                
                }
            } catch {
                fatalError("Error")
            }
        default:
            print("Error")
        }
    }
    
    func saveProject() {
        switch rootTile {
        case "1":
            let request = Project.fetchRequest() as NSFetchRequest<Project>
            let pred = NSPredicate(format: "name CONTAINS 1")
            request.predicate = pred
            
            do {
                let project = try context.fetch(request)
                
                project.forEach { project in
                    switch currentBase {
                    case "Home Base":
                        project.homeBaseValue = itemCurrentValue
                        
                        
                    case "First Base":
                        
                        project.firstBaseValue = itemCurrentValue
                    case "Second Base":
                        
                        project.secondBaseValue = itemCurrentValue
                    case "Third Base":
                        
                        project.thirdBaseValue = itemCurrentValue
                    default:
                        print("Error")
                    }
                    do {
                        try context.save()
                    } catch {
                        
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
                    switch currentBase {
                    case "Home Base":
                        
                        project.homeBaseValue = itemCurrentValue
                        
                    case "First Base":
                        
                        project.firstBaseValue = itemCurrentValue
                    case "Second Base":
                        
                        project.secondBaseValue = itemCurrentValue
                    case "Third Base":
                        
                        project.thirdBaseValue = itemCurrentValue
                    default:
                        print("Error")
                    }
                    do {
                        try context.save()
                    } catch {
                        
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
                    switch currentBase {
                    case "Home Base":
                        project.homeBaseValue = itemCurrentValue
                        
                    case "First Base":
                        
                        project.firstBaseValue = itemCurrentValue
                    case "Second Base":
                        
                        project.secondBaseValue = itemCurrentValue
                    case "Third Base":
                        
                        project.thirdBaseValue = itemCurrentValue
                    default:
                        print("Error")
                    }
                    do {
                        try context.save()
                    } catch {
                        
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
                    switch currentBase {
                    case "Home Base":
                        project.homeBaseValue = itemCurrentValue
                        
                    case "First Base":
                        
                        project.firstBaseValue = itemCurrentValue
                    case "Second Base":
                        
                        project.secondBaseValue = itemCurrentValue
                    case "Third Base":
                        
                        project.thirdBaseValue = itemCurrentValue
                    default:
                        print("Error")
                    }
                    do {
                        try context.save()
                    } catch {
                        
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
                    switch currentBase {
                    case "Home Base":
                        project.homeBaseValue = itemCurrentValue
                        
                    case "First Base":
                        
                        project.firstBaseValue = itemCurrentValue
                    case "Second Base":
                        
                        project.secondBaseValue = itemCurrentValue
                    case "Third Base":
                        
                        project.thirdBaseValue = itemCurrentValue
                    default:
                        print("Error")
                    }
                    do {
                        try context.save()
                    } catch {
                        
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
                    switch currentBase {
                    case "Home Base":
                        project.homeBaseValue = itemCurrentValue
                        
                    case "First Base":
                        
                        project.firstBaseValue = itemCurrentValue
                    case "Second Base":
                        
                        project.secondBaseValue = itemCurrentValue
                    case "Third Base":
                        
                        project.thirdBaseValue = itemCurrentValue
                    default:
                        print("Error")
                    }
                    do {
                        try context.save()
                    } catch {
                        
                    }
                   
                }
            } catch {
                fatalError("Error")
            }
        default:
            print("Error")
        }
    }
    
    @IBAction func changeValueButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Set Value", message: "What is this worth?", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.text = ""
            textField.keyboardType = .numberPad
            textField.clearsOnBeginEditing = true
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { _ in
            guard let textfield = alert.textFields else{
                return
            }
            let safeText = textfield[0]
            guard let safeValue = safeText.text, !safeValue.isEmpty else {
                return
            }
            let intText = Int64(safeValue)
            if let newInt = intText {
                print(newInt)
                if newInt > self.moneyRemaining {
                    self.itemCurrentValue = 0
                    sender.setTitle("$\(0)", for: .normal)
                    let anotherAlert = UIAlertController(title: "$\(self.projectTotal) Spending Limit Exceeded!", message: "Current item value cannot be greater than $\(self.moneyRemaining).", preferredStyle: .alert)
                    anotherAlert.addAction(UIAlertAction(title: "I understand.", style: .cancel, handler: nil))
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.error)
                    self.present(anotherAlert, animated: true) {
                        
                    }
                } else {
                    self.itemCurrentValue = newInt
                    sender.setTitle("$\(newInt)", for: .normal)
                }
                
                
            }
            
            
            
        }))
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("This is it", selectedLink)
        
    }
    
    @IBAction func changeButton(_ sender: UIButton) {
       callPicker()
        
    }
    
    @IBAction func linkPicker(_ sender: UIButton) {
        
        guard let url = URL(string: "\(selectedLink)") else {
            return
        }
        let vc = WebViewController(url: url, title: "Happy Spending", tile: rootTile, baseTile: currentBase, pushedInt: itemCurrentValue)
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
    }
    
    func fetchProject() -> [Project] {
        
        let request = Project.fetchRequest() as NSFetchRequest<Project>
        let pred = NSPredicate(format: "name CONTAINS \(rootTile)")
        request.predicate = pred
        
        do {
            let project = try context.fetch(request)
            
            project.forEach { project in
                print(project.homeURL)
                let value = project.projectValue
                let active = project.isActive
                guard let title = project.name
                        
             else {
                fatalError("Error")
            }
                print(title)
                print(value)
                print(active)
            }
        } catch {
            fatalError("Error")
        }
            return []
    }
    
    func callPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func loadImages() {
        switch currentBase {
        case "Home Base":
        imagineImage.image = loadImageFromDisk(fileName: baseImage) ?? imagineImage.image
        case "First Base":
            imagineImage.image = loadImageFromDisk(fileName: baseImage) ?? imagineImage.image
        case "Second Base":
            imagineImage.image = loadImageFromDisk(fileName: baseImage) ?? imagineImage.image
        case "Third Base":
            imagineImage.image = loadImageFromDisk(fileName: baseImage) ?? imagineImage.image
        default:
            print("Error")
    }
    }
}

extension UpgradesViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            switch currentBase {
            case "Home Base":
                saveImage(imageName: baseImage, image: image)
            case "First Base":
                saveImage(imageName: baseImage, image: image)
            case "Second Base":
                saveImage(imageName: baseImage, image: image)
            case "Third Base":
                saveImage(imageName: baseImage, image: image)
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
