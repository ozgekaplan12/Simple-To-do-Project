// SimpleToDo.mo

// Yapılacak işlerin tanımlandığı yapı
type Todo = {
    description : Text;
    completed : Bool;
};

// Yapılacak işleri içeren yapı
type TodoList = {
    todos : [Todo];
};

// Yeni bir yapılacak iş ekler
public func addTodo(todoList : TodoList, description : Text) : TodoList {
    let newTodo = { description = description; completed = false };
    TodoList { todos = Array.append<Todo>(todoList.todos, [newTodo]) }
};

// Bir yapılacak işin tamamlandığını işaretler
public func completeTodo(todoList : TodoList, index : Nat) : TodoList {
    let updatedTodos = Array.update<Todo>(todoList.todos, index - 1, { _ with completed = true });
    TodoList { todos = updatedTodos }
};

// Tüm yapılacak işleri görüntüler
public func showTodos(todoList : TodoList) : Text {
    let header = "___TO-DOs___\n";
    let todos = Array.foldi<Todo, Text>(todoList.todos, "", func(i, acc, todo) {
        let status = if todo.completed then "✔" else "";
        acc # "(" # Nat.toText(i + 1) # ") " # todo.description # " " # status # "\n"
    });
    header # todos
};

}
