import 'package:flutter/material.dart';



class Home extends StatefulWidget
{
   const Home ({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
  
}

class _HomeState extends State<Home> {
  String userTodo ='';
  List todoList = [];

@override
void initState(){
  super.initState();
  todoList.addAll(['wash ass', 'eat chips']);
 
}

@override
Widget build(BuildContext context)
  {
    return Scaffold(

      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text('Список дел'),
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder:(BuildContext context, int index){
          return Dismissible(
            
            key: Key(todoList[index]),
            child: Card(
              color: Colors.grey[600],
              child: ListTile(
                title: Text(todoList[index]),
                
                ),
            ),
            onDismissed: (direction){
              if(direction == DismissDirection.startToEnd)
              {
                todoList.removeAt(index);
              }
            },
            );
        }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[600],
        onPressed: (){
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              title: Text('Add'),
              content: TextField(
              onChanged: (String value){
                userTodo = value;
                },
              ),
              actions: [
                ElevatedButton(onPressed:(){
                  setState(() {
                  todoList.add(userTodo);
                });
                Navigator.of(context).pop();
                },
                child: Text('add'))
              ],
            );
          });

        },
        child: Icon(
          Icons.add_box,  

        )
      ),
    );
  }
}