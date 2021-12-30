import 'package:flutter/material.dart';
import 'package:todo_app/utils.dart';
import 'package:todo_app/create_todo_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedItem = 'todo';

  final List<Map<String, dynamic>> _unCompletedData = [];

  final List<Map<String, dynamic>> _completedData = [];

  final List<Map<String, dynamic>> data = [
    {
      'title': 'What is Lorem Ipsum?',
      'description':
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a ',
      'date_time': 'Yesterday',
      'status': true,
    },
    {
      'title': 'What is Lorem Ipsum?',
      'description':
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a ',
      'date_time': 'Today',
      'status': true,
    },
    {
      'title': 'What is Lorem Ipsum?',
      'description':
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a ',
      'date_time': 'Tomorrow',
      'status': false,
    },
    {
      'title': 'What is Lorem Ipsum?',
      'description':
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a ',
      'date_time': 'Today',
      'status': false,
    },
    {
      'title': 'What is Lorem Ipsum?',
      'description':
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a ',
      'date_time': 'Mon. 15 Nov',
      'status': false,
    },
  ];

  @override
  void initState() {
    for (Map<String, dynamic> element in data) {
      if (!element['status']) {
        _unCompletedData.add(element);
      } else {
        _completedData.add(element);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          title: const Text('My Tasks',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
          leading: const Center(child: FlutterLogo(size: 30)),
          actions: [
            PopupMenuButton<String>(
                icon: const Icon(Icons.menu),
                onSelected: (value) {
                  setState(() {
                    selectedItem = value;
                  });
                },
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(child: Text('Todo'), value: ('todo')),
                    const PopupMenuItem(
                        child: Text('Completed'), value: ('completed')),
                  ];
                }),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CreateTodoView();
          }));
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromRGBO(37, 43, 103, 1),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline_outlined,
                        size: 30,
                        color: customColor(
                            date: selectedItem == 'todo'
                                ? _unCompletedData[index]['date_time']
                                : _completedData[index]['date_time']),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Text(
                              selectedItem == 'todo'
                                  ? _unCompletedData[index]['title']
                                  : _completedData[index]['title'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color.fromRGBO(37, 43, 103, 1),
                              )),
                          Text(
                              selectedItem == 'todo'
                                  ? _unCompletedData[index]['description']
                                  : _completedData[index]['description'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.grey)),
                        ]),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Icon(Icons.notifications_outlined,
                              color: customColor(
                                  date: selectedItem == 'todo'
                                      ? _unCompletedData[index]['date_time']
                                      : _completedData[index]['date_time'])),
                          Text(
                              selectedItem == 'todo'
                                  ? _unCompletedData[index]['date_time']
                                  : _completedData[index]['date_time'],
                              style: TextStyle(
                                  color: customColor(
                                      date: selectedItem == 'todo'
                                          ? _unCompletedData[index]['date_time']
                                          : _completedData[index]
                                              ['date_time'])))
                        ],
                      )
                    ],
                  ),
                ));
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 5);
          },
          itemCount: selectedItem == 'todo'
              ? _unCompletedData.length
              : _completedData.length),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          child: Material(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(37, 43, 103, 1),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, size: 30, color: Colors.white),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    'Completed',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    '${_completedData.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
