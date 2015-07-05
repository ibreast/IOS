//
//  HarhardCheckBaseInfo1.swift
//  iBreast
//
//  Created by 钟其鸿 on 15/7/3.
//  Copyright (c) 2015年 钟其鸿. All rights reserved.
//

import UIKit

var data:NSDictionary?

func initHarvardCheckMenuData(){
    
    if data==nil
    {
        var pathStr = NSBundle.mainBundle().pathForResource("harvardMenuList", ofType:"plist")
        if let newPathStr = pathStr //pathStr可能为nil
        {
            data = NSDictionary(contentsOfFile: newPathStr);
            
        }
    }
    
    

}


class HarvardCheckBaseInfo1: UIViewController ,UITableViewDataSource{
    
    @IBOutlet weak var tableMenu: UITableView!
    let harvardBaseInfoCellTag:String="hfcheckBI1TableCell"
    
    let HFCHECK_MENU_SECTION=3
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        initHarvardCheckMenuData()
        tableMenu.dataSource=self
       
        

    }
    
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return (data!.allValues[HFCHECK_MENU_SECTION] as! NSArray).count
        
    }
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
//        
//        
//       return data?.allKeys[HFCHECK_MENU_SECTION] as! String
//    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        
        
        let cell=tableView.dequeueReusableCellWithIdentifier(harvardBaseInfoCellTag, forIndexPath: indexPath)
                   as? UITableViewCell
        
        
        
        //        var lable=cell!.viewWithTag(TAG_CELL_LABLE) as? UILabel
        //         lable.text=(data!.allValues[indexPath.section] as! NSArray).objectAtIndex(indexPath.row) as! String
        var label=cell?.textLabel?.text=(data!.allValues[HFCHECK_MENU_SECTION] as! NSArray).objectAtIndex(indexPath.row) as! String;
        //
        
        
        
        cell?.detailTextLabel?.text=String(indexPath.row)
        
        return cell!
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
