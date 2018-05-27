//
//  ViewController.swift
//  PlayingCard
//
//  Created by Everton Cardoso on 25/05/2018.
//  Copyright © 2018 Everton Cardoso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deck = PlayingCardDeck()
    
    @IBOutlet weak var playingCardView: PlayingCardView!
    {
        didSet
        {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left, .right]
            playingCardView.addGestureRecognizer(swipe)
            let pinchSelector = #selector(playingCardView.adjustFaceCardScale(byHandlingGestureRecognizerBy:))
            let pinch = UIPinchGestureRecognizer(target: playingCardView, action: pinchSelector)
            playingCardView.addGestureRecognizer(pinch)
        }
    }
    
    @IBAction func flipcard(_ sender: UITapGestureRecognizer)
    {
        switch sender.state
        {
        case .ended: playingCardView.isFaceUp = !playingCardView.isFaceUp
        default: break
        }
    }
    
    @objc func nextCard()
    {
        if let card  = deck.draw() {
            playingCardView.rank = card.rank.order
            playingCardView.suit = card.suit.rawValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

