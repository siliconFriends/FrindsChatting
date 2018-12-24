//
//  BasePresenter.swift
//  Friends
//
//  Created by Ahmed Nasser on 12/24/18.
//  Copyright © 2018 Ahmed Nasser. All rights reserved.
//

import Foundation
protocol mainView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func error(error:String)
    func success(message:String)

}
class BasePresenter  {
  
}
