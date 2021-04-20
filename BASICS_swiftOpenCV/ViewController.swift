//
//  ViewController.swift
//  BASICS_swiftOpenCV
//
//  Created by 樋口大樹 on 2021/04/18.
//

import UIKit
import opencv2

class ViewController: UIViewController {

    @IBOutlet weak var srcImageView: UIImageView!
    @IBOutlet weak var dstImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "robot2.png")!
        self.srcImageView.image = image
        self.dstImageView.image = self.detectEdge(source: image)
    }

    func detectEdge(source srcImage: UIImage) -> UIImage {
        let srcMat = Mat(uiImage: srcImage)
        let dstMat = Mat()
        Imgproc.Canny(image: srcMat, edges: dstMat, threshold1: 50, threshold2: 80)
        return dstMat.toUIImage()
    }
}

