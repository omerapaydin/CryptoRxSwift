//
//  ViewController.swift
//  CryptoRxSwift
//
//  Created by Ömer on 28.09.2025.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var cryptoList = [Crypto]()
    
    let disposeBag = DisposeBag()
    let cryptoVM = CryptoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        setupbindings()
        cryptoVM.RequestData()
        
        
    }
    
    
    private func setupbindings(){
        
        cryptoVM
            .error
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onNext : {errorString in
                print(errorString)
            })
            .disposed(by: disposeBag)
        
        
        cryptoVM
            .cryptos
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onNext: { cryptos in
                self.cryptoList = cryptos
                self.tableView.reloadData()
            })
            .disposed(by:disposeBag)
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! Cell
        cell.imageView1?.image = UIImage(named: "coin")
        cell.textLabel1?.text = cryptoList[indexPath.row].currency
        cell.textLabel2.text = cryptoList[indexPath.row].price

        return cell
    }


}

