//
//  IndicatorTableViewCell.swift
//  NTI
//
//  Created by Mohamed Elsdody on 02/10/2021.
//

import UIKit

class IndicatorTableViewCell: UITableViewCell {
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var destinationNameLabel: UILabel!
    @IBOutlet weak var amountOfMintsLabel: UILabel!
    var viewModel: IndicatorCellViewModel? {
        didSet {
            bindViewmodel()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bindViewmodel() {
        orderLabel.text = viewModel?.order
        destinationNameLabel.text = viewModel?.destinationName
        amountOfMintsLabel.text =  viewModel?.amountOfMints
    }

}
