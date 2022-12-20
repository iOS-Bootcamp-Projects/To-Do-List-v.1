//
//  ViewController.swift
//  To Do List v.1
//
//  Created by Aamer Essa on 20/12/2022.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var taskTable: NSTableView!
    @IBOutlet weak var finish: NSButton!
    @IBOutlet weak var taskTextField: NSTextField!
    var tasksList = ["go to gym","go to Qatar"]
    var selectedValue = Int()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        taskTable.dataSource = self
        taskTable.delegate = self
        
      
    }

    override var representedObject: Any? {
        didSet {
        
        }
    }


    @IBAction func addNewTask(_ sender: NSTextField) {
        tasksList.append(sender.stringValue)
        taskTable.reloadData()
        taskTextField.stringValue = ""
    }
    @IBAction func finish(_ sender: Any) {
        tasksList.remove(at: selectedValue)
        taskTable.reloadData()
    }
}

extension ViewController: NSTableViewDelegate,NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        tasksList.count
    }
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = taskTable.makeView(withIdentifier: .cell, owner: self) as! TasksTableViewCell
        cell.taskTitel.stringValue = tasksList[row]
        
        return cell
    }
    func tableViewSelectionIsChanging(_ notification: Notification) {

        selectedValue = taskTable.selectedRow
    }
    
}

extension NSUserInterfaceItemIdentifier {
   static let cell = NSUserInterfaceItemIdentifier("Cell")
}
