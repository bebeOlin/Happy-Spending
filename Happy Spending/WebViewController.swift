//
//  WebViewController.swift
//  Happy Spending
//
//  Created by Bruce Bolin on 10/1/21.
//

import UIKit
import WebKit
import CoreData

class WebViewController: UIViewController {
    
    
    var mainTile = ""
    var base = ""
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var savedURL = ""
    var pushedValue: Int64 = 0
    var webTitle = ""
    
    
    private let webView: WKWebView = {
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = preferences
        let webView = WKWebView(frame: .zero, configuration: configuration)
        return webView
    }()
    
    
    private let url: URL
    
    init(url: URL, title: String, tile: String, baseTile: String, pushedInt: Int64) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
        self.title = title
        self.mainTile = tile
        self.base = baseTile
        self.pushedValue = pushedInt
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        webView.load(URLRequest(url: url))
            configureNavBar()
        fetchProject()
        print(pushedValue)
        saveWebData()
        

       
    }
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    func saveWebData() {
        switch mainTile {
        case "1":
            let request = Project.fetchRequest() as NSFetchRequest<Project>
            let pred = NSPredicate(format: "name CONTAINS 1")
            request.predicate = pred
            
            do {
                let project = try context.fetch(request)
                
                project.forEach { project in
                    switch base {
                    case "Home Base":
                        project.homeURL = savedURL
                        project.homeBaseValue = pushedValue
                        project.homeURLTitle = webTitle
                    case "First Base":
                        project.firstURL = savedURL
                        project.firstBaseValue = pushedValue
                        project.firstURLTitle = webTitle
                    case "Second Base":
                        project.secondURL = savedURL
                        project.secondBaseValue = pushedValue
                        project.secondURLTitle = webTitle
                    case "Third Base":
                        project.thirdURL = savedURL
                        project.thirdBaseValue = pushedValue
                        project.thirdURLTitle = webTitle
                        
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
                    switch base {
                    case "Home Base":
                        project.homeURL = savedURL
                        project.homeBaseValue = pushedValue
                        project.homeURLTitle = webTitle
                    case "First Base":
                        project.firstURL = savedURL
                        project.firstBaseValue = pushedValue
                        project.firstURLTitle = webTitle
                    case "Second Base":
                        project.secondURL = savedURL
                        project.secondBaseValue = pushedValue
                        project.secondURLTitle = webTitle
                    case "Third Base":
                        project.thirdURL = savedURL
                        project.thirdBaseValue = pushedValue
                        project.thirdURLTitle = webTitle
                        
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
                    switch base {
                    case "Home Base":
                        project.homeURL = savedURL
                        project.homeBaseValue = pushedValue
                        project.homeURLTitle = webTitle
                    case "First Base":
                        project.firstURL = savedURL
                        project.firstBaseValue = pushedValue
                        project.firstURLTitle = webTitle
                    case "Second Base":
                        project.secondURL = savedURL
                        project.secondBaseValue = pushedValue
                        project.secondURLTitle = webTitle
                    case "Third Base":
                        project.thirdURL = savedURL
                        project.thirdBaseValue = pushedValue
                        project.thirdURLTitle = webTitle
                        
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
                    switch base {
                    case "Home Base":
                        project.homeURL = savedURL
                        project.homeBaseValue = pushedValue
                        project.homeURLTitle = webTitle
                    case "First Base":
                        project.firstURL = savedURL
                        project.firstBaseValue = pushedValue
                        project.firstURLTitle = webTitle
                    case "Second Base":
                        project.secondURL = savedURL
                        project.secondBaseValue = pushedValue
                        project.secondURLTitle = webTitle
                    case "Third Base":
                        project.thirdURL = savedURL
                        project.thirdBaseValue = pushedValue
                        project.thirdURLTitle = webTitle
                        
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
                    switch base {
                    case "Home Base":
                        project.homeURL = savedURL
                        project.homeBaseValue = pushedValue
                        project.homeURLTitle = webTitle
                    case "First Base":
                        project.firstURL = savedURL
                        project.firstBaseValue = pushedValue
                        project.firstURLTitle = webTitle
                    case "Second Base":
                        project.secondURL = savedURL
                        project.secondBaseValue = pushedValue
                        project.secondURLTitle = webTitle
                    case "Third Base":
                        project.thirdURL = savedURL
                        project.thirdBaseValue = pushedValue
                        project.thirdURLTitle = webTitle
                        
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
                    switch base {
                    case "Home Base":
                        project.homeURL = savedURL
                        project.homeBaseValue = pushedValue
                        project.homeURLTitle = webTitle
                    case "First Base":
                        project.firstURL = savedURL
                        project.firstBaseValue = pushedValue
                        project.firstURLTitle = webTitle
                    case "Second Base":
                        project.secondURL = savedURL
                        project.secondBaseValue = pushedValue
                        project.secondURLTitle = webTitle
                    case "Third Base":
                        project.thirdURL = savedURL
                        project.thirdBaseValue = pushedValue
                        project.thirdURLTitle = webTitle
                        
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
        do {
            try context.save()
        } catch {
            print("Could not save")
        }
    }
    
    func fetchProject() -> [Project] {
        
        let request = Project.fetchRequest() as NSFetchRequest<Project>
        let pred = NSPredicate(format: "name CONTAINS \(mainTile)")
        request.predicate = pred
        
        do {
            let project = try context.fetch(request)
            
            project.forEach { project in
                
                guard let title = project.name
                     
             else {
                fatalError("Error")
            }
                print(title)
                
            }
        } catch {
            fatalError("Error")
        }
            return []
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }

    private func configureNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Google", style: .plain, target: self, action: #selector(didTapGoogle))
        
    }
    
    @objc private func didTapGoogle() {
        webView.load(URLRequest(url: URL(string: "https://www.google.com") ?? url))
    }
    
    @objc private func didTapDone() {
        
        if let url = webView.url {
//            UserDefaults.standard.set("\(url)", forKey: savedURL)
            savedURL = "\(url)"
            if let title = webView.title {
                webTitle = title
            }
            saveWebData()
            NotificationCenter.default.post(name: Notification.Name("urlChanged"), object: self)
        dismiss(animated: true)
            
        
            
            
            
   
        }
        
      
            
           
        }
        
        
    }

