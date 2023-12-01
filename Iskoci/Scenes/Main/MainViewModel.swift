//
//  MainViewModel.swift
//  Iskoci
//
//  Created by kzmvranje on 20.11.23..
//

import Foundation
import Alamofire
import SwiftUI

struct MainViewModel{
    
    init (){
       UserDefaultHelper.shared.isRegister = true
        setUserId()
       
        
        
        
    }
//    var userId = "18012001"
    
    private var key =  "isRegister"
//    var key = UserDefaultHelper.shared.isRegister
  let  userId =  UserDefaultHelper.shared.userId

    
    var defaults = UserDefaults.standard
    
    var headers: HTTPHeaders{
        ["DeviceId": "18001" ]
    }
   
       
    func setUserId() {
        UserDefaultHelper.shared.isRegister = false
        if (!UserDefaultHelper.shared.isRegister)
        {
            UsersService.userRequest(mehthod: .post, header: headers){result in
                print(self.userId)
                
                guard case.success = result else {return}
                UserDefaultHelper.shared.userId = "18001"
                UserDefaultHelper.shared.isRegister = true
            }
            
            }
        }
    }
   
    
    





