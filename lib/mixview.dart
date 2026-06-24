import 'package:flutter/material.dart';

class MyMixViewPage extends StatefulWidget {
  const MyMixViewPage({super.key});

  @override
  State<MyMixViewPage> createState() => _MyMixViewPageState();
}

class _MyMixViewPageState extends State<MyMixViewPage> {
  final List<String> _list = List.generate(20, (index) => 'Item $index');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyMixViewPage')),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // ผลักข้อความหนึ่งไปซ้ายสุด อีกข้อความไปขวาสุด
                children: [
                  const Text(
                    'GridView',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FullGridView(),
                        ),
                      );
                    },
                    child: const Text(
                      'ดูทั้งหมด',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(color: Colors.amber, child: Text(_list[index]));
            }, childCount: 2), // กำหนดแสดงผล 2 items ในส่วนของ Grid
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // ผลักข้อความหนึ่งไปซ้ายสุด อีกข้อความไปขวาสุด
                children: [
                  const Text(
                    'ListView',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FullListView(),
                        ),
                      );
                    },
                    child: const Text(
                      'ดูทั้งหมด',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildBuilderDelegate((context, index) {
              return ListTile(title: Text(_list[index]));
            }, childCount: 2), // กำหนดแสดงผล 2 items ในส่วนของ List
          ),
        ],
      ),
    );
  }
}

class FullGridView extends StatelessWidget {
  const FullGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Full GridView')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Container(color: Colors.amber, child: Text('test'));
        },
        itemCount: 20,
      ),
    );
  }
}

class FullListView extends StatelessWidget {
  const FullListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Full ListView')),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(child: ListTile(title: Text('test')));
        },
      ),
    );
  }
}
