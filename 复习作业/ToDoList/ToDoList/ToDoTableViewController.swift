import UIKit

class ToDoTableViewController: UITableViewController, ToDoCellDelegate {
    
    var toDos = [ToDo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        if let savedToDos = ToDo.loadToDos() {
            toDos = savedToDos
        } else {
            toDos = ToDo.loadSampleToDos()
        }
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell") as? ToDoCell else {
            fatalError("Could not dequeue a cell")
        }
        cell.delegate = self
        
        let todo = toDos[indexPath.row]
        cell.titleLabel?.text = todo.title
        cell.isCompleteButton.isSelected = todo.isComplete

        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            toDos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            ToDo.saveToDos(todos: toDos)
        }
    }
    
    //Editing Detail
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let newToDoTableViewController = segue.destination as! NewToDoTableViewController
            //传递索引路径
            let indexPath = tableView.indexPathForSelectedRow!
//            传递数据
            let selectedToDo = toDos[indexPath.row]
            newToDoTableViewController.todo = selectedToDo
        }
    }

    @IBAction func unwindToDoList(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else {return}
        let sourceViewController = segue.source as! NewToDoTableViewController
//        1存在数据
        if let todo = sourceViewController.todo {
//            2存在索引路径 说明是编辑的任务。替换原来的任务，视图重载原来的单元格
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                toDos[selectedIndexPath.row] = todo
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
//                新增加的任务，添加在数组后面，视图新增加一行显示
                let newIndexPath = IndexPath(row: toDos.count, section: 0)
                toDos.append(todo)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
        ToDo.saveToDos(todos: toDos)
    }
    
    func checkmarkTapped(sender: ToDoCell) {
        if let indexPath = tableView.indexPath(for: sender) {
//            1 取出数据
            var todo = toDos[indexPath.row]
//            2 更改数据
            todo.isComplete = !todo.isComplete
//            3 替换数据
            toDos[indexPath.row] = todo
//            4 重载对应行视图
            tableView.reloadRows(at: [indexPath], with: .automatic)
            ToDo.saveToDos(todos: toDos)
        }
    }
}
