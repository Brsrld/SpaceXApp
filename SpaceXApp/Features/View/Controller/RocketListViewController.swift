//
//  ViewController.swift
//  SpaceXApp
//
//  Created by Baris Saraldi on 15.06.2021.
//

import UIKit

class RocketListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let rocketListViewModel: RocketListViewModel = RocketListViewModel()
    private let rocketListCollecionView: RocketListCollecionView = RocketListCollecionView()
    override func viewDidLoad() {
        super.viewDidLoad()
        service()
        initDelegate()
        title = Constants.rocketListViewControllerTitle
        setupUI()
    }
    
    //MARK: Functions
    
    func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort", style: .done, target: self, action: #selector(sort))
    }
    
    @objc func sort() {
      
    }
    
    private func initDelegate() {
        collectionView.delegate = rocketListCollecionView
        collectionView.dataSource = rocketListCollecionView
        rocketListCollecionView.delegate = self
    }
    
    private func service() {
        rocketListViewModel.service { models in
            self.rocketListCollecionView.update(items: models)
            self.collectionView.reloadData()
        } onFail: { error in
            print(error ?? Constants.nilValue)
        }
    }
}

extension RocketListViewController:RocketListCollecionViewOutput {
    func getNavCont() -> UINavigationController? {
        return navigationController
    }
    
    func getStoryBoard() -> UIStoryboard? {
        return storyboard
    }
}
