//
//  ItemsTableViewController.swift
//  IMGUR
//
//  Created by Fernando De La Rosa Salas on 8/27/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

protocol ItemDisplayLogic: class {
    func displayItems(itemsFetched: ItemsLogicModel.Response.Pixabay)
}

final class ItemsTableViewController: UITableViewController, ItemDisplayLogic {
    
    //MARK: - Properties
    var image = UIImage(named: "search")
    let spinner = UIActivityIndicatorView(style: .gray)
    var router: (ItemsRoutingLogic & ItemDataPassing)?
    var interactor: ItemBusinesslogic?
    var items: ItemsLogicModel.Response.Pixabay?
    
    //MARKS: - Life Cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupScene()
        showItems()
        
        items = ItemsLogicModel.Response.Pixabay(totalHits: 0, hits: [])
        spinner.color = UIColor.darkGray
        spinner.hidesWhenStopped = true
        tableView.tableFooterView = spinner
        
        //Xib Cell configuration
        let itemCell = UINib(nibName: "ItemCell", bundle: nil)
        tableView.register(itemCell, forCellReuseIdentifier: "ItemCell")
        
        //Navigation bar configutarion
        navigationController?.isNavigationBarHidden = false
        image = image?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image:image, style: .plain, target: self, action: #selector( magnifyinGlassAction))
        
        navigationItem.rightBarButtonItem?.accessibilityIdentifier = "search_button_id"
    }
    
    func setupViewController(interactor: ItemBusinesslogic, router: (ItemsRoutingLogic & ItemDataPassing)) {
        self.interactor = interactor
        self.router = router
    }
    
    private func setupScene() {
        let viewController = self
        let presenter = ItemsPresenter(viewController: viewController)
        let interactor = ItemsInteractor(presenter: presenter)
        let router = ItemRouter(dataStore: interactor, viewController: viewController)
        setupViewController(interactor: interactor, router: router)
    }
    
    //MARK: - Methods
    @objc private func refreshPhotos(_ sender: Any) {
        // Fetch Photos method here
        let timeToRefresh = DispatchTime.now() + .milliseconds(100)
        DispatchQueue.main.asyncAfter(deadline: timeToRefresh) { [weak self] in
            self?.showItems()
        }
    }
    
    @objc func magnifyinGlassAction(_ sender: Any) {
        //View Controller Pop Up
        router?.routeToSearchPopUp()
        
    }
    
    @IBAction func dismissSearchPopUp(segue: UIStoryboardSegue) {
    }
    
    func displayItems(itemsFetched: ItemsLogicModel.Response.Pixabay) {
        items = itemsFetched
        DispatchQueue.main.async() { [weak self] in
            self?.tableView.reloadData()
        }
        spinner.stopAnimating()
        refreshControl?.endRefreshing()
    }
    
    func showItems() {
        let request = ItemsLogicModel.Request()
        interactor?.showItems(request: request)
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
        guard let url = URL(string: items?.hits[indexPath.row].largeImageURL ?? "" ) else {
            return cell
        }
        cell.itemImage?.load(from: url)
        cell.itemImage?.contentMode = .scaleAspectFit
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.routeToDetail(image: items?.hits[indexPath.row].largeImageURL ?? "")
    }
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        spinner.startAnimating()
    }    
}

//FIXME: Delete this extension

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
