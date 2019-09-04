//
//  ItemsTableViewController.swift
//  IMGUR
//
//  Created by Fernando De La Rosa Salas on 8/27/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

class ItemsTableViewController: UITableViewController {
    
    private var presenter: ItemsPresenterProtocol?
    var items: Pixabay? {
        didSet {
            DispatchQueue.main.async { [unowned self] in
                self.tableView.reloadData()
            }
        }
    }

    var image = UIImage(named: "search")
    var blurEffect: UIBlurEffect? = UIBlurEffect(style: .regular)
    var blurEffectView: UIVisualEffectView?
    let spinner = UIActivityIndicatorView(style: .gray)
    
    //MARKS: - Life Cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        presenter = ItemsPresenter(viewController: self)
        setup(presenter: presenter)
        
        title = "Pixabay"
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
        navigationItem.rightBarButtonItem?.accessibilityIdentifier = "search_button_id"
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
        presenter?.presentSearchPopUpView()
    }
    
    //MARK: - Setup Actors
    func setup(presenter: ItemsPresenterProtocol?) {
        self.presenter = presenter
        self.presenter?.fillTable()
    }
}

//MARK: - ItemsTableViewControllerProtocol
extension ItemsTableViewController: ItemsViewControllerProtocol {
    func fillTable(with itemsFetched: Pixabay) {
        items = itemsFetched
    }
}

// MARK: - TableView Protocols
extension ItemsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.hits.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as? ItemCell else {
            return UITableViewCell()
        }
        
        cell.itemTitle?.text = items?.hits[indexPath.row].tags
        cell.userName?.text = items?.hits[indexPath.row].user
        guard let url = URL(string: items?.hits[indexPath.row].largeImageURL ?? "") else {
            return cell
        }
        cell.itemImage?.load(from: url)
        cell.itemImage?.contentMode = .scaleAspectFit
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.presentDetailView(image: items?.hits[indexPath.row].largeImageURL)
    }
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        spinner.startAnimating()
    }
}
