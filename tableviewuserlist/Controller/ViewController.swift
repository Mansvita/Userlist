
import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var lbldata: UILabel!
    
    // MARK: - Outlets
    // variable declaration
    
    var indexForCell = Int()
    var array = [String]()
    var a = [String]()
    var userdefault = UserDefaults.standard
    
    // MARK: - Outlets
    // viewdidload
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
       // set title
        self.navigationItem.title = "UserList"
        
        // Userdefaultcode array
        
        if let data = userdefault.object(forKey: "to") as? [String]{
            array = data
        }
        
        self.lbldata.isHidden = (self.array.count > 0)
    }
    
    // MARK: - Outlets
    // delete button
    @IBAction func btndelete(_ sender: Any) {
        
        if var  data = userdefault.object(forKey: "to") as? [String]{
            data = array
            userdefault.set(data, forKey: "to")
            
            array.removeAll()
            userdefault.removeObject(forKey: "to")
            userdefault.synchronize()
        }
        
        tableview.reloadData()
        self.lbldata.isHidden = false
    }

   

    // MARK: - Outlets
    
    // save button
    @IBAction func savebtn(_ sender: Any) {
        
        // alert controller
        let alertController = UIAlertController(title: "User detail", message: "input user detail", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (usertext : UITextField) -> Void in
            usertext.placeholder = "userdetail"
            
            //Mark: cancel button
            let  cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) { [self] (result : UIAlertAction) -> Void in
                print("Cancel")
                tableview.reloadData()
            }
            
            // ok button
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { [self] (result : UIAlertAction) -> Void in
                
                if(usertext.text  == ""){
                    self.lbldata.isEnabled = true
                
                }else if(usertext.text != nil){
                    
                    if var data = userdefault.object(forKey: "to") as? [String]{
                        
                        data.append(usertext.text ?? "")
                        userdefault.set(data, forKey: "to")
                        userdefault.synchronize()
                    }
                    else {
                        userdefault.set([usertext.text ?? ""], forKey: "to")
                        userdefault.synchronize()
                    }
                    
                    if let updateddata = userdefault.object(forKey: "to") as? [String]{
                        self.array = updateddata
                    }
                    
                    self.lbldata.isHidden = true
                    self.tableview.reloadData()
                    }else{
                    
                }
            }
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
   
    // MARK: - Outlets
    //delete button
    @IBAction func buttondelete(_ sender: UIButton) {
        
        let point = sender.convert(CGPoint.zero, to: tableview)
        guard let indexpath = tableview.indexPathForRow(at: point) else {return}
        array.remove(at:indexpath.row)
        userdefault.set(array, forKey: "to")
        userdefault.synchronize()
        tableview.reloadData()
       
        lbldata.isHidden = (self.array.count > 0)
    }
}

// MARK: - Outlets

// extension viewcontroller
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    // tableview code
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewcell", for: indexPath) as! tableviewcell
        cell.lbl.text = self.array[indexPath.row]
       return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        var indexForCell = indexPath.row
    }
    
}

