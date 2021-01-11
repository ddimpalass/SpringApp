//
//  ViewController.swift
//  SpringApp
//
//  Created by Apple on 29.12.2020.
//

import Spring

class ViewController: UIViewController {
    
    @IBOutlet weak var myView: SpringView!
    @IBOutlet weak var labelView: SpringLabel!
    
    var nextAnimation1 = "fall"
    var nextAnimation2 = "fall"
    var animationNextBool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func button(_ sender: SpringButton) {

        if animationNextBool == true {
            animationNextBool = false
            nextAnimation1 = AnimationPreset.allCases.randomElement()?.rawValue ?? "fall"
            sender.setTitle("next: \(nextAnimation1)", for: .normal)
            myView.animation = nextAnimation2
        } else {
            animationNextBool = true
            nextAnimation2 = AnimationPreset.allCases.randomElement()?.rawValue ?? "fall"
            sender.setTitle("next: \(nextAnimation2)", for: .normal)
            myView.animation = nextAnimation1
        }
        
        
        
        myView.curve = AnimationCurve.allCases.randomElement()!.rawValue
        myView.force = CGFloat.random(in: 0.1...5)
        myView.duration = CGFloat.random(in: 0.1...2)
        myView.delay = CGFloat.random(in: 0.1...1)
        
        labelView.text = """
                    animation: \(myView.animation)
                    curve: \(myView.curve)
                    force: \(String(format: "%.2f", myView.force))
                    duration: \(String(format: "%.2f", myView.duration))
                    delay: \(String(format: "%.2f", myView.delay))
            """

        myView.animate()
    }
    
}

extension ViewController{
    public enum AnimationPreset: String, CaseIterable {
        case slideLeft
        case slideRight
        case slideDown
        case slideUp
        case squeezeLeft
        case squeezeRight
        case squeezeDown
        case squeezeUp
        case fadeIn
        case fadeOut
        case fadeOutIn
        case fadeInLeft
        case fadeInRight
        case fadeInDown
        case fadeInUp
        case zoomIn
        case zoomOut
        case fall
        case shake
        case pop
        case flipX
        case flipY
        case morph
        case squeeze
        case flash
        case wobble
        case swing
    }
    
    public enum AnimationCurve: String, CaseIterable {
        case easeIn
        case easeOut
        case easeInOut
        case linear
        case spring
        case easeInSine
        case easeOutSine
        case easeInOutSine
        case easeInQuad
        case easeOutQuad
        case easeInOutQuad
        case easeInCubic
        case easeOutCubic
        case easeInOutCubic
        case easeInQuart
        case easeOutQuart
        case easeInOutQuart
        case easeInQuint
        case easeOutQuint
        case easeInOutQuint
        case easeInExpo
        case easeOutExpo
        case easeInOutExpo
        case easeInCirc
        case easeOutCirc
        case easeInOutCirc
        case easeInBack
        case easeOutBack
        case easeInOutBack
    }
}


