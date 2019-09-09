//
//  ItemsTableViewController.swift
//  IMGUR
//
//  Created by Fernando De La Rosa Salas on 8/27/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

protocol ItemsViewInterface: class {
    func showItems(response: Pixabay)
    func dismissVC()
}

class ItemsTableViewController: UITableViewController, ItemsViewInterface {

    var image = UIImage(named: "search")
    var blurEffect: UIBlurEffect? = UIBlurEffect(style: .regular)
    var blurEffectView: UIVisualEffectView?
    var presenter: ItemsPresenterInterface?
    var pixabayModel: Pixabay?
    let spinner = UIActivityIndicatorView(style: .gray)
    
    //MARK: - Outlets
    @IBOutlet weak var magnifyingGlassButton: UIButton!
    @IBOutlet weak var headerView: UIView!
    

    //MARKS: - Life Cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setup()
        loadItems()
        
        spinner.color = UIColor.darkGray
        spinner.hidesWhenStopped = true
        tableView.tableFooterView = spinner
        
        navigationController?.isNavigationBarHidden = false
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        //Xib Cell configuration
        let itemCell = UINib(nibName: "ItemCell", bundle: nil)
        tableView.register(itemCell, forCellReuseIdentifier: "ItemCell")
        
        //Navigation bar configutarion
        image = image?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image:image, style: .plain, target: self, action: #selector( magnifyinGlassAction))
    }
    
    //MARK: - Setup
    func setupViewController(presenter: ItemsPresenterInterface) {
        self.presenter = presenter
    }

    func setup() {
        let view = self
        let presenter = ItemsPrsenter(view: view)
        setupViewController(presenter: presenter)
    }
    
    //MARK: - Methods
    @objc private func refreshPhotos(_ sender: Any) {
        // Fetch Photos method here
        let timeToRefresh = DispatchTime.now() + .milliseconds(1000)
        DispatchQueue.main.asyncAfter(deadline: timeToRefresh) { [weak self] in
            self?.refreshControl?.endRefreshing()
        }
    }
    
     @objc private func magnifyinGlassAction(_ sender: Any) {
        
        //View Controller Pop Up
        let vc = SearchPopUpViewController(nibName: "SearchPopUpViewController", bundle: nil)
        vc.modalPresentationStyle = .overCurrentContext
        self.navigationController?.present(vc, animated: true)
        
    }
    
    private func loadItems() {
        let keyword = "cat"
        presenter?.getItems(keyword: keyword)
    }
    
    func showItems(response: Pixabay) {
        pixabayModel = response
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
        dismissVC()
    }
    
    func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - TableView Protocols
extension ItemsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as? ItemCell else {
            return UITableViewCell()
        }
        
        cell.itemTitle?.text = pixabayModel?.hits[indexPath.row].tags
        cell.userName?.text = pixabayModel?.hits[indexPath.row].user
        guard let url = URL(string: pixabayModel?.hits[indexPath.row].largeImageURL ?? "") else {
            return cell
        }
        cell.itemImage?.load(from: url)
        cell.itemImage?.contentMode = .scaleAspectFit
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let destination = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            return
        }
        destination.title = "DetailViewController"
        destination.presenter?.getImages(image: pixabayModel?.hits[indexPath.row].largeImageURL ?? "")
        navigationController?.pushViewController(destination, animated: true)
        
    }
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        spinner.startAnimating()
    }
}

extension UIImageView {
    func load(from url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
