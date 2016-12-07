//
//  ConversationListViewController.swift
//  CloudIMTest
//
//  Created by 沈韶泓 on 2016/12/4.
//  Copyright © 2016年 shenshaohong-institute. All rights reserved.
//

import UIKit

class ConversationListViewController: RCConversationListViewController {
    
    let conversationViewController = RCConversationViewController()
    
    @IBAction func showMenu(_ sender: UIBarButtonItem) {
        
        var frame = (sender.value(forKey: "view") as? UIView)?.frame
        frame?.origin.y += 30
        
        KxMenu.show(in: self.view, from: frame!, menuItems: [
            KxMenuItem(NSLocalizedString("Serve", comment: "Serve"),image: UIImage(named: "serve"), target:self, action: "ClickMenu1"),
            KxMenuItem(NSLocalizedString("Test", comment: "Test"),image: UIImage(named: "contact"), target:self,action: "ClickMenu2")
            ])
        
    }
    
    func ClickMenu1() {
        print("Click Menu1")
    }
    
    func ClickMenu2() {
        
        let conversationVC = RCConversationViewController()
        
        conversationVC.targetId = "tester002"
        conversationVC.title = "tester2"
        conversationVC.conversationType = .ConversationType_PRIVATE
        
        navigationController?.pushViewController(conversationVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        
        delegate?.connectServer {
            self.setDisplayConversationTypes([
                RCConversationType.ConversationType_APPSERVICE.rawValue,
                RCConversationType.ConversationType_CHATROOM.rawValue,
                RCConversationType.ConversationType_CUSTOMERSERVICE.rawValue,
                RCConversationType.ConversationType_DISCUSSION.rawValue,
                RCConversationType.ConversationType_GROUP.rawValue,
                RCConversationType.ConversationType_PRIVATE.rawValue,
                RCConversationType.ConversationType_PUBLICSERVICE.rawValue,
                RCConversationType.ConversationType_SYSTEM.rawValue
                
                ])
            
            self.title = NSLocalizedString("Connected", comment: "Conversation connected title")
            
            self.refreshConversationTableViewIfNeeded()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let destinationVC = segue.destination as? RCConversationViewController
        
        destinationVC?.targetId = conversationViewController.targetId
        destinationVC?.conversationType = .ConversationType_PRIVATE
        destinationVC?.title = conversationViewController.title
    }

    
    // MARK: - RC Conversation View Controller
    override func onSelectedTableRow(_ conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, at indexPath: IndexPath!) {
        
        conversationViewController.targetId = model.targetId
        conversationViewController.conversationType = .ConversationType_PRIVATE
        conversationViewController.title = model.conversationTitle
        
        performSegue(withIdentifier: "ShowConversationVC", sender: self)
    }
}
