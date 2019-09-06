//
//  ItemsTableViewController.swift
//  IMGUR
//
//  Created by Fernando De La Rosa Salas on 8/27/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

class ItemsTableViewController: UITableViewController {
    
    var viewModel: ResultViewModelProtocol?

    var image = UIImage(named: "search")
    var blurEffect: UIBlurEffect? = UIBlurEffect(style: .regular)
    var blurEffectView: UIVisualEffectView?
    let spinner = UIActivityIndicatorView(style: .gray)
    //MARK: - Outlets
    @IBOutlet weak var magnifyingGlassButton: UIButton!
    @IBOutlet weak var headerView: UIView!
    

    //MARKS: - Life Cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        viewModel = ResultViewModel()
        viewModel?.delegate = self
        
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
}

// MARK: - TableView Protocols
extension ItemsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.hits?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as? ItemCell else {
            return UITableViewCell()
        }
        
        cell.viewModel = viewModel?.hits?[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let destination = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            return
        }
        destination.title = "DetailViewController"
        destination.setViewModel()
        destination.setImage(from: viewModel?.hits?[indexPath.row].largeImageURL)
        navigationController?.pushViewController(destination, animated: true)
    }
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        spinner.startAnimating()
    }
}

extension ItemsTableViewController: ResultViewDelegate {
    func reloadDataInView() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}
