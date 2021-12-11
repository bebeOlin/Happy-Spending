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
    @IBOutlet weak var changeImageButton: UIButton!
    @IBOutlet weak var upgradesBackground: UIImageView!
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
    let currencyFormat = NumberFormatter()
    var linkWidthConstraint = NSLayoutConstraint()
    var valueWidthConstraint = NSLayoutConstraint()
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyFormat.usesGroupingSeparator = true
        currencyFormat.numberStyle = .currency
        currencyFormat.locale = Locale.current
        currencyFormat.maximumFractionDigits = 0
        loadProject()
        loadImages()
        urlObserver = NotificationCenter.default.addObserver(forName: Notification.Name("urlChanged"), object: nil, queue: .main, using: { (notification) in
            self.loadProject()
            self.linkWidthConstraint.constant = self.linkButton.intrinsicContentSize.width
            self.linkButton.frame.size.width = self.linkButton.intrinsicContentSize.width
        })
        linkButton.translatesAutoresizingMaskIntoConstraints = false
        linkWidthConstraint = NSLayoutConstraint(item: linkButton!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: linkButton.intrinsicContentSize.width)
        linkWidthConstraint.isActive = true
        linkWidthConstraint.constant = linkButton.intrinsicContentSize.width
        linkButton.frame.size.width = linkButton.intrinsicContentSize.width
        linkButton.layer.cornerRadius = 20
        valueButton.translatesAutoresizingMaskIntoConstraints = false
        valueWidthConstraint = NSLayoutConstraint(item: valueButton!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: valueButton.intrinsicContentSize.width)
        valueWidthConstraint.isActive = true
        valueWidthConstraint.constant = valueButton.intrinsicContentSize.width
        valueButton.frame.size.width = valueButton.intrinsicContentSize.width
        valueButton.layer.cornerRadius = 20
        changeImageButton.layer.cornerRadius = 17
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if linkButton.intrinsicContentSize.width < view.frame.width {
        linkButton.frame.size.width = linkButton.intrinsicContentSize.width
        } else {
            linkButton.frame.size.width = view.frame.width - 15
            linkButton.titleLabel?.textAlignment = .center
            linkButton.center.x = view.center.x
            linkButton.titleLabel?.numberOfLines = 2
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        saveProject()
        NotificationCenter.default.post(name: Notification.Name("updatedValue"), object: nil)
    }
    func loadProject() {
        let request = Project.fetchRequest() as NSFetchRequest<Project>
        let pred = NSPredicate(format: "name CONTAINS \(rootTile)")
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
                    if project.homeBaseValue == 0 {
                        self.valueButton.setTitle("Set Value", for: .normal)
                    } else {
                        let newItemValue = currencyFormat.string(from: NSNumber(value: itemCurrentValue))
                        self.valueButton.setTitle("\(newItemValue!)", for: .normal)
                    }
                    self.selectedLink = project.homeURL ?? "https://www.google.com"
                    self.loadedTitle = project.homeURLTitle ?? "Search"
                    self.linkButton.setTitle(loadedTitle, for: .normal)
                case "First Base":
                    if let firstPic = project.firstBasePic {
                        self.baseImage = firstPic
                    }
                    self.itemCurrentValue = project.firstBaseValue
                    if project.firstBaseValue == 0 {
                        self.valueButton.setTitle("Set Value", for: .normal)
                    } else {
                        let newItemValue = currencyFormat.string(from: NSNumber(value: itemCurrentValue))
                        self.valueButton.setTitle("\(newItemValue!)", for: .normal)
                    }
                    self.selectedLink = project.firstURL ?? "https://www.google.com"
                    self.loadedTitle = project.firstURLTitle ?? "Search"
                    self.linkButton.setTitle(loadedTitle, for: .normal)
                case "Second Base":
                    if let secondPic = project.secondBasePic {
                        self.baseImage = secondPic
                    }
                    self.itemCurrentValue = project.secondBaseValue
                    if project.secondBaseValue == 0 {
                        self.valueButton.setTitle("Set Value", for: .normal)
                    } else {
                        let newItemValue = currencyFormat.string(from: NSNumber(value: itemCurrentValue))
                        self.valueButton.setTitle("\(newItemValue!)", for: .normal)
                    }
                    self.selectedLink = project.secondURL ?? "https://www.google.com"
                    self.loadedTitle = project.secondURLTitle ?? "Search"
                    self.linkButton.setTitle(loadedTitle, for: .normal)
                case "Third Base":
                    if let thirdPic = project.thirdBasePic {
                        self.baseImage = thirdPic
                    }
                    self.itemCurrentValue = project.thirdBaseValue
                    if project.thirdBaseValue == 0 {
                        self.valueButton.setTitle("Set Value", for: .normal)
                    } else {
                        let newItemValue = currencyFormat.string(from: NSNumber(value: itemCurrentValue))
                        self.valueButton.setTitle("\(newItemValue!)", for: .normal)
                    }
                    self.selectedLink = project.thirdURL ?? "https://www.google.com"
                    self.loadedTitle = project.thirdURLTitle ?? "Search"
                    self.linkButton.setTitle(loadedTitle, for: .normal)
                case "Fourth Base":
                    if let fourthPic = project.fourthBasePic {
                        self.baseImage = fourthPic
                    }
                    self.itemCurrentValue = project.fourthBaseValue
                    if project.fourthBaseValue == 0 {
                        self.valueButton.setTitle("Set Value", for: .normal)
                    } else {
                        let newItemValue = currencyFormat.string(from: NSNumber(value: itemCurrentValue))
                        self.valueButton.setTitle("\(newItemValue!)", for: .normal)
                    }
                    self.selectedLink = project.fourthURL ?? "https://www.google.com"
                    self.loadedTitle = project.fourthURLTitle ?? "Search"
                    self.linkButton.setTitle(loadedTitle, for: .normal)
                case "Fifth Base":
                    if let fifthPic = project.fifthBasePic {
                        self.baseImage = fifthPic
                    }
                    self.itemCurrentValue = project.fifthBaseValue
                    if project.fifthBaseValue == 0 {
                        self.valueButton.setTitle("Set Value", for: .normal)
                    } else {
                        let newItemValue = currencyFormat.string(from: NSNumber(value: itemCurrentValue))
                        self.valueButton.setTitle("\(newItemValue!)", for: .normal)
                    }
                    self.selectedLink = project.fifthURL ?? "https://www.google.com"
                    self.loadedTitle = project.fifthURLTitle ?? "Search"
                    self.linkButton.setTitle(loadedTitle, for: .normal)
                case "Sixth Base":
                    if let sixthPic = project.sixthBasePic {
                        self.baseImage = sixthPic
                    }
                    self.itemCurrentValue = project.sixthBaseValue
                    if project.sixthBaseValue == 0 {
                        self.valueButton.setTitle("Set Value", for: .normal)
                    } else {
                        let newItemValue = currencyFormat.string(from: NSNumber(value: itemCurrentValue))
                        self.valueButton.setTitle("\(newItemValue!)", for: .normal)
                    }
                    self.selectedLink = project.sixthURL ?? "https://www.google.com"
                    self.loadedTitle = project.sixthURLTitle ?? "Search"
                    self.linkButton.setTitle(loadedTitle, for: .normal)
                case "Seventh Base":
                    if let seventhPic = project.seventhBasePic {
                        self.baseImage = seventhPic
                    }
                    self.itemCurrentValue = project.seventhBaseValue
                    if project.seventhBaseValue == 0 {
                        self.valueButton.setTitle("Set Value", for: .normal)
                    } else {
                        let newItemValue = currencyFormat.string(from: NSNumber(value: itemCurrentValue))
                        self.valueButton.setTitle("\(newItemValue!)", for: .normal)
                    }
                    self.selectedLink = project.seventhURL ?? "https://www.google.com"
                    self.loadedTitle = project.seventhURLTitle ?? "Search"
                    self.linkButton.setTitle(loadedTitle, for: .normal)
                case "Eighth Base":
                    if let eighthPic = project.eighthBasePic {
                        self.baseImage = eighthPic
                    }
                    self.itemCurrentValue = project.eighthBaseValue
                    if project.eighthBaseValue == 0 {
                        self.valueButton.setTitle("Set Value", for: .normal)
                    } else {
                        let newItemValue = currencyFormat.string(from: NSNumber(value: itemCurrentValue))
                        self.valueButton.setTitle("\(newItemValue!)", for: .normal)
                    }
                    self.selectedLink = project.eighthURL ?? "https://www.google.com"
                    self.loadedTitle = project.eighthURLTitle ?? "Search"
                    self.linkButton.setTitle(loadedTitle, for: .normal)
                case "Ninth Base":
                    if let ninthPic = project.ninthBasePic {
                        self.baseImage = ninthPic
                    }
                    self.itemCurrentValue = project.ninthBaseValue
                    if project.ninthBaseValue == 0 {
                        self.valueButton.setTitle("Set Value", for: .normal)
                    } else {
                        let newItemValue = currencyFormat.string(from: NSNumber(value: itemCurrentValue))
                        self.valueButton.setTitle("\(newItemValue!)", for: .normal)
                    }
                    self.selectedLink = project.ninthURL ?? "https://www.google.com"
                    self.loadedTitle = project.ninthURLTitle ?? "Search"
                    self.linkButton.setTitle(loadedTitle, for: .normal)
                default:
                    print("Error")
                }
            }
        } catch {
            fatalError("Error")
        }
        switch rootTile {
        case "1":
            upgradesBackground.image = UIImage(imageLiteralResourceName: "Bluer")
        case "2":
            upgradesBackground.image = UIImage(imageLiteralResourceName: "Indigo")
        case "3":
            upgradesBackground.image = UIImage(imageLiteralResourceName: "Purp")
        case "4":
            upgradesBackground.image = UIImage(imageLiteralResourceName: "Teal")
        case "5":
            upgradesBackground.image = UIImage(imageLiteralResourceName: "Bluish")
        case "6":
            upgradesBackground.image = UIImage(imageLiteralResourceName: "Gray")
        default:
            print("Error")
        }
    }
    func saveProject() {
        let request = Project.fetchRequest() as NSFetchRequest<Project>
        let pred = NSPredicate(format: "name CONTAINS \(rootTile)")
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
                case "Fourth Base":
                    project.fourthBaseValue = itemCurrentValue
                case "Fifth Base":
                    project.fifthBaseValue = itemCurrentValue
                case "Sixth Base":
                    project.sixthBaseValue = itemCurrentValue
                case "Seventh Base":
                    project.seventhBaseValue = itemCurrentValue
                case "Eighth Base":
                    project.eighthBaseValue = itemCurrentValue
                case "Ninth Base":
                    project.ninthBaseValue = itemCurrentValue
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
                let userInt = self.currencyFormat.string(from: NSNumber(value: newInt))
                let projectInt = self.currencyFormat.string(from: NSNumber(value: self.projectTotal))
                let remainingInt = self.currencyFormat.string(from: NSNumber(value: self.moneyRemaining))
                if newInt > self.moneyRemaining + self.itemCurrentValue && self.moneyRemaining >= 0 {
                    let anotherAlert = UIAlertController(title: "\(projectInt!) Spending Limit Exceeding!", message: "You have \(remainingInt!) remaining from your original budget!", preferredStyle: .alert)
                    anotherAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    anotherAlert.addAction(UIAlertAction(title: "Good", style: .default, handler: { good in
                        self.itemCurrentValue = newInt
                        sender.setTitle("\(userInt!)", for: .normal)
                    }))
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.error)
                    self.present(anotherAlert, animated: true) {
                    }
                } else {
                    self.itemCurrentValue = newInt
                    sender.setTitle("\(userInt!)", for: .normal)
                }
            }
        }))
        present(alert, animated: true, completion: nil)
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
        navVC.isModalInPresentation = true
        navVC.modalTransitionStyle = .coverVertical
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: nil)
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
        case "Fourth Base":
            imagineImage.image = loadImageFromDisk(fileName: baseImage) ?? imagineImage.image
        case "Fifth Base":
        imagineImage.image = loadImageFromDisk(fileName: baseImage) ?? imagineImage.image
        case "Sixth Base":
            imagineImage.image = loadImageFromDisk(fileName: baseImage) ?? imagineImage.image
        case "Seventh Base":
            imagineImage.image = loadImageFromDisk(fileName: baseImage) ?? imagineImage.image
        case "Eighth Base":
            imagineImage.image = loadImageFromDisk(fileName: baseImage) ?? imagineImage.image
        case "Ninth Base":
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
            case "Fourth Base":
                saveImage(imageName: baseImage, image: image)
            case "Fifth Base":
                saveImage(imageName: baseImage, image: image)
            case "Sixth Base":
                saveImage(imageName: baseImage, image: image)
            case "Seventh Base":
                saveImage(imageName: baseImage, image: image)
            case "Eighth Base":
                saveImage(imageName: baseImage, image: image)
            case "Ninth Base":
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
