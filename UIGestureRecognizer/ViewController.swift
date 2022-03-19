//
//  ViewController.swift
//  UIGestureRecognizer
//
//  Created by Tony on 19.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeObservers()
        tapObserver()
    }
    
    func swipeObservers() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUP = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeUP.direction = .up
        self.view.addGestureRecognizer(swipeUP)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    func tapObserver() {
        let trippleTap = UITapGestureRecognizer(target: self, action: #selector(trippleTapAction))
        trippleTap.numberOfTapsRequired = 3
        self.view.addGestureRecognizer(trippleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTappAction))
        doubleTap.require(toFail: trippleTap)
        doubleTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTap)
    }
    
    @objc func handleSwipes(gester: UISwipeGestureRecognizer) {
        
        switch gester.direction {
        case .right:
            labelText.text = "Right Swipe"
        case .left:
            labelText.text = "Left Swipe"
        case .up:
            labelText.text = "Up Swipe"
        case .down:
            labelText.text = "Down Swipe"
        default:
            break
        }
    }
    
    @objc func trippleTapAction() {
        labelText.text = "Tripple Tap"
    }
    
    @objc func doubleTappAction() {
        labelText.text = "Double Tap"
    }
}

