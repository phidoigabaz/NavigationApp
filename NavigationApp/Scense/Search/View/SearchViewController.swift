//
//  SearchViewController.swift
//  NavigationApp
//
//  Created by GEM on 4/16/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit
import PagingKit

protocol SearchTextFieldDelegate: NSObjectProtocol {
    func textFieldShouldReturn(_ textField: UITextField)
}

class SearchViewController: BaseViewController {

    var menuViewController: PagingMenuViewController?
    var contentViewController: PagingContentViewController?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var pagingView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var clearButton: UIButton!
    
    var selectedTab = 0
    weak var delegate: SearchTextFieldDelegate?
    
    let dataSource: [(item: String, content: UIViewController)] = ["History", "Categories"].map {
        
        let title = $0
        let vc = SearchPagingViewController()
        vc.view.frame = CGRect(x: 0, y: 0, width: Constants.iWidth, height: vc.view.frame.size.height)
        return (item: $0, content: vc)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuViewController?.reloadData()
        contentViewController?.reloadData()
        searchTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for:.editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadMenuView()
    }
    
    //MARK: METHODS
    override func setupView() {
        menuViewController = PagingMenuViewController()
        menuViewController?.view.frame = CGRect(x: 0, y: 16, width: 180, height: menuView.frame.size.height - 16)
        menuViewController?.dataSource = self
        menuViewController?.delegate = self
        menuViewController?.cellAlignment = .left
        contentViewController = PagingContentViewController()
        contentViewController?.view.frame = CGRect(x: 0, y: 0, width: pagingView.frame.size.width, height: pagingView.frame.size.height)
        contentViewController?.delegate = self
        contentViewController?.dataSource = self
        menuViewController?.register(nib: UINib(nibName: ItemMenuView.classString(), bundle: nil), forCellWithReuseIdentifier: ItemMenuView.classString())
        let underlineView = UnderlineFocusView()
        underlineView.underlineHeight = 2
        underlineView.underlineColor = .black
        menuViewController?.registerFocusView(view: underlineView)
        menuViewController?.cellSpacing = 0
        menuViewController?.menuView.backgroundColor = .clear
        menuViewController?.view.backgroundColor = .clear
        menuView.addSubview((menuViewController?.view)!)
        pagingView.addSubview((contentViewController?.view)!)
        reloadMenuView()
    }
    
    func reloadMenuView() {
        self.menuViewController?.reloadData()
        if let currentCell = self.menuViewController?.cellForItem(at: self.selectedTab) as? ItemMenuView {
            currentCell.titleLabel.textColor = .black
            currentCell.titleLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        DispatchQueue.main.async {
            if textField == self.searchTextField,!(self.searchTextField.text?.trim().isEmpty)! {
                self.clearButton.isHidden = false
                self.tableView.isHidden = false
                self.menuView.isHidden = true
                self.pagingView.isHidden = true
            } else {
                self.clearButton.isHidden = true
                self.tableView.isHidden = true
                self.menuView.isHidden = false
                self.pagingView.isHidden = false
            }
        }
    }
    //MARK: ACTIONS
    @IBAction func onClearTextAction(_ sender: Any) {
        searchTextField.text = nil
        self.clearButton.isHidden = true
        self.tableView.isHidden = true
        self.menuView.isHidden = false
        self.pagingView.isHidden = false
    }
    
    @IBAction func onDismissAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

//MARK: Paging DataSource & Delegate
extension SearchViewController: PagingMenuViewControllerDataSource {
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
        let cell = viewController.dequeueReusableCell(withReuseIdentifier: ItemMenuView.classString(), for: index)  as! ItemMenuView
        cell.titleLabel.text = dataSource[index].item
        return cell
    }
    
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        return 90
    }
    
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        return dataSource.count
    }
}

extension SearchViewController: PagingContentViewControllerDataSource {
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return dataSource.count
    }
    
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        let vc = dataSource[index].content as! SearchPagingViewController
        return vc
    }
}

extension SearchViewController: PagingMenuViewControllerDelegate {
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        contentViewController?.scroll(to: page, animated: true)
        let currentCell = viewController.cellForItem(at: page) as! ItemMenuView
        let previousCell = viewController.cellForItem(at: previousPage) as! ItemMenuView
        currentCell.titleLabel.textColor = .black
        currentCell.titleLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        previousCell.titleLabel.textColor = .lightGray
        previousCell.titleLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        selectedTab = page
    }
}

extension SearchViewController: PagingContentViewControllerDelegate {
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        menuViewController?.scroll(index: index, percent: percent, animated: false)
    }
    
    func contentViewController(viewController: PagingContentViewController, didEndManualScrollOn index: Int) {
        let previousCell = menuViewController?.cellForItem(at: selectedTab) as! ItemMenuView
        let currentCell = menuViewController?.cellForItem(at: index) as! ItemMenuView
        currentCell.titleLabel.textColor = .black
        currentCell.titleLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        previousCell.titleLabel.textColor = .lightGray
        previousCell.titleLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        selectedTab = index
    }
}

