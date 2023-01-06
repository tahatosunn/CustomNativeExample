//
//  ViewController.swift
//  NativeExample
//
//  Created by Taha Tosun on 6.01.2023.
//

import UIKit
import AMRSDK

class ViewController: UIViewController {
    @IBOutlet weak var VBannerContainer150x250: UIView!
    @IBOutlet weak var VBannerContainer200x200: UIView!

    var bannerCustom150x250: AMRBanner!
    var bannerCustom200x200: AMRBanner!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBanners()
    }

    //MARK: - Load Banner
    func loadBanners() {
        /*
         AMR NATIVE ONLY TEST ZONE
         c72a4a52-23c5-4c34-9eb1-7bbc4c08c7e4
         */
        //Replace zoneIds with your own zoneIds
        bannerCustom150x250 = AMRBanner(forZoneId: "c72a4a52-23c5-4c34-9eb1-7bbc4c08c7e4")
        bannerCustom150x250.delegate = self
        bannerCustom150x250.customNativeSize = CGSize(width: 150.0, height: 250.0)
        bannerCustom150x250.customeNativeXibName = "CustomNative150x250"
        bannerCustom150x250.load()
        
        bannerCustom200x200 = AMRBanner(forZoneId: "c72a4a52-23c5-4c34-9eb1-7bbc4c08c7e4")
        bannerCustom200x200.delegate = self
        bannerCustom200x200.customNativeSize = CGSize(width: 200.0, height: 200.0)
        bannerCustom200x200.customeNativeXibName = "CustomNative200x200"
        bannerCustom200x200.load()
        
        print("<AMR Demo> - [I] - Custom Native - viewDidload works")
    }

    //MARK: - Actions
    @IBAction func reloadBanners(_ sender: Any) {
        bannerCustom150x250.load()
        bannerCustom200x200.load()
    }
}

//MARK: - AMRBannerDelegate
extension ViewController: AMRBannerDelegate {
    func didReceive(_ banner: AMRBanner!) {
        if (banner == bannerCustom150x250) {
            VBannerContainer150x250.addSubview(banner.bannerView)
        } else if (banner == bannerCustom200x200) {
            VBannerContainer200x200.addSubview(banner.bannerView)
        }
    }
    
    func didFail(toReceive banner: AMRBanner!, error: AMRError!) {
        print("<AMR Demo> - [I] - Custom Native - didFail works with error: \(error.errorCode)")
    }
    
    func didClick(_ banner: AMRBanner!) {
        print("<AMR Demo> - [I] - Custom Native - Banner clicked.")
    }
}
