//
//  IndicatorViewController.swift
//  NTI
//
//  Created by Mohamed Elsdody on 01/10/2021.
//

import UIKit
import RxSwift
import RxCocoa


class IndicatorViewController: UIViewController , Storyboarded {
    @IBOutlet weak var indicatorTableView: UITableView!
    @IBOutlet weak var currentTimeLabel: UILabel!
    weak var coordinator: MainCoordinator?
    let disposeBag = DisposeBag()
    let indicatorTableViewCell = "IndicatorTableViewCell"
    var viewModel : IndicatorViewModel?
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)

        setupTableView()
        bindViewModel()
    }
    @objc func tick() {
        currentTimeLabel.text = Formatter.getDateFormatter().string(from: Date())
        }
    func setupTableView() {
        indicatorTableView.register(UINib(nibName: indicatorTableViewCell, bundle: nil), forCellReuseIdentifier: indicatorTableViewCell)
    }
    func bindViewModel() {
        guard  let viewmodel = viewModel else {
            return
        }
        viewmodel
            .onShowError
            .subscribe(onNext: { [weak self] in
                self?.alert(title: "error", message: $0)
            }).disposed(by: disposeBag)
        viewmodel
            .onShowLoading
            .map { [weak self] in
                if $0 {
                    self?.showIndicator()
                } else {
                    self?.hideIndicator()
                } }
            .subscribe()
            .disposed(by: disposeBag)
        subscribeToResponse()
    }
    func subscribeToResponse() {
        guard  let viewmodel = viewModel else {
            return
        }
        viewmodel.CellsObservable.bind(to: self.indicatorTableView.rx.items) { tableView, index, element in
            let indexPath = IndexPath(item: index, section: 0)
            switch element {
            case .normal(let viewModel):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "IndicatorTableViewCell", for: indexPath) as? IndicatorTableViewCell else {
                    return UITableViewCell()
                }
                cell.viewModel = viewModel
                return cell
            case .error(let message):
                let cell = UITableViewCell()
                cell.isUserInteractionEnabled = false
                cell.textLabel?.text = message
                return cell
            case .empty:
                let cell = UITableViewCell()
                cell.isUserInteractionEnabled = false
                cell.textLabel?.text = "noDataAvailable"
                return cell
            }
        }.disposed(by: disposeBag)
    }
}
