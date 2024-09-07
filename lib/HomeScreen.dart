import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, Map<dynamic, dynamic>>> imageList = [
    {
      'assets/1.jpeg': {
        'title': 'Home',
        'price': 51,
        'size': 'L',
        'color': 'Black',
        'counter': 0,
      }
    },
    {
      'assets/2.jpeg': {
        'title': 'Away',
        'price': 30,
        'size': 'L',
        'color': 'Gray',
        'counter': 0,
      }
    },
    {
      'assets/3.jpeg': {
        'title': 'ThirdKit',
        'price': 43,
        'size': 'M',
        'color': 'Black',
        'counter': 0,
      }
    },
  ];
  int totalAmount = 0;
  MySnackBar(context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Congratulations"))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Bag',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: ListView.separated(
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                Map<String, Map<dynamic, dynamic>> currentItem =
                    imageList[index];

                String imagePath = currentItem.keys.first;

                String title = currentItem[imagePath]!['title']!;
                int price = currentItem[imagePath]!['price']!;
                String size = currentItem[imagePath]!['size']!;
                String color = currentItem[imagePath]!['color']!;
                int count = currentItem[imagePath]!['counter'] ?? 0;

                return ListTile(
                  leading: Image.asset(imagePath),
                  title: Text(
                    title,
                    textAlign: TextAlign.start,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Color: Black Size L'),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {decreamentItems(index);},
                              icon: Icon(Icons.remove_circle)),
                          SizedBox(
                            width: 10,
                          ),
                          Text(count.toString()),
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              onPressed: () {addItems(index);},
                              icon: Icon(Icons.add_circle)),
                        ],
                      ),
                    ],
                  ),
                  trailing: Column(
                    children: [
                      Icon(Icons.more_vert),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        ("${price.toString()}\$"),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            )),
            //SizedBox(height: 300,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Amount:',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      ("$totalAmount\$"),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {MySnackBar(context);},
                      child: Text('Check Out')),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void addItems(index) {
    //counter++;
    imageList[index].values.first['counter'] =
        (imageList[index].values.first['counter'] ?? 0) + 1;
    int val = imageList[index].values.first['price'];
    totalAmount += val ;
    setState(() {});
  }
  void decreamentItems(index){
    int count = imageList[index].values.first['counter'] ?? 0;
    if(count > 0){
      imageList[index].values.first['counter'] = count - 1;
      int val = imageList[index].values.first['price'];
      totalAmount -= val ;
    }

    setState(() {});
  }

}
