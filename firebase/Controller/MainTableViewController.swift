//
//  MainTableViewController.swift
//  firebase
//
//  Created by Josaphat Campos Pereira on 02/04/23.
//

import UIKit
import FirebaseAuth

class MainTableViewController: UITableViewController {
    
    
    let data:[String] = ["Teste 1", "Teste 2", "Teste 3", "TEste 4"]
    
    let logout:UIBarButtonItem = {
        let btn = UIBarButtonItem()
        btn.title = "sair"
        btn.action = #selector(logoutFunction)
        return btn
    }()
    @objc
    func logoutFunction(){
        do{
            try Auth.auth().signOut()
            gotologin()
        }catch let logoutError{
            dispatchAlert("Erro ao Sain", message: "Não conseguimos efetuar o logout!")
            print("Logout Erro:", logoutError.localizedDescription)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//         self.navigationItem.rightBarButtonItem = self.editButtonItem
        logout.target = self
        self.navigationItem.rightBarButtonItem = self.logout
        
        if Auth.auth().currentUser == nil {
            gotologin()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celulahome", for: indexPath)

        cell.textLabel?.text = data[indexPath.row]

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MainTableViewController{
    func gotologin(){
        let login = self.storyboard?.instantiateViewController(withIdentifier: "loginViewController") as! ViewController
        print("nao ta logado")
        self.present(login, animated: true, completion: nil)
    }
}
