import 'package:assignment/widgets/responsiveBuilder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return responsiveBuilder(
        mobile: _mobileLayout(),
        tablet: _tabletLayout(),
        desktop: _desktopLayout()
    );
  }

  Widget _mobileLayout() {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              Text("Humming \n Bird"),
              SizedBox(width: 50,),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text("Skill Up Now \n Tap Here"),
              decoration: BoxDecoration(
                color: Colors.green, // Set the background color to green
              ),
            ),
            ListTile(title: Text("Episode"),leading: Icon(Icons.add_card_sharp),),
            ListTile(title: Text("About"),leading: Icon(Icons.message)),
          ],
        ),
      ),
      body: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: EdgeInsets.all( 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 2,
                child: Container(child: text1()),
              ),
              Expanded(
                flex: 2,
                child: text2(),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Button(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _tabletLayout() {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Text("Humming \n Bird"),
        ),
        actions: [
          Row(
            children: [
              Text("Episodes"),
              SizedBox(width: 50,),
              Text("About"),
              SizedBox(width: 50,),
            ],
          ),
        ],
      ),
      body: AspectRatio(
          aspectRatio: 16/9,
          child: Padding(
            padding: EdgeInsets.all( 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 2,
                  child: text1(),
                ),
                Expanded(
                  flex: 2,
                  child: text2(),
                ),
                Expanded(
                  child: Center(
                    child: Button(),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
  Widget _desktopLayout() {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Text("Humming \n Bird"),
        ),
        actions: [
          Row(
            children: [
              Text("Episodes"),
              SizedBox(width: 50,),
              Text("About"),
              SizedBox(width: 50,),
            ],
          ),
        ],
      ),
      body: AspectRatio(
        aspectRatio: 16/9,
        child: Padding(
          padding: EdgeInsets.all(50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 1,
                      child: text1(),
                    ),
                    Expanded(
                      flex: 2,
                      child: text2(),
                    )
                  ],
                ),
              ),
              Expanded(child: SizedBox(width: double.infinity,),flex: 1,),
              Expanded(child: Center(child: Button()),flex: 1,),
            ],
          ),
        ),
      ),
    );
  }

  // Widget Button() {
  //   return ElevatedButton(
  //     child: Text(
  //       "Join Course",
  //       style: TextStyle(color: Colors.black),
  //     ),
  //     onPressed: () {},
  //     style: ElevatedButton.styleFrom(
  //       backgroundColor: Colors.green,
  //       padding: EdgeInsets.symmetric(
  //           horizontal: 30, vertical: 15),
  //     ),
  //   );
  // }

  // Widget Button() {
  //   return ElevatedButton(
  //     child: Text(
  //       "Join Course",
  //       style: TextStyle(
  //         color: Colors.black,
  //       ),
  //     ),
  //     onPressed: () {},
  //     style: ElevatedButton.styleFrom(
  //       backgroundColor: Colors.green,
  //       padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
  //       minimumSize: Size(150, 50), // Sets the button to a rectangular size
  //     ),
  //   );
  // }
  Widget Button() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(), // Border with color and width
        ),
      ),
      child: Text(
        "Join Course",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget text1() {
    return Text(
      "FLUTTER WEB.\n THE BASICS",
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.start,
    );
  }
  Widget text2() {
    return Text("Flutter transforms the development process."
        " Build, test, and deploy beautiful mobile, web, desktop, and"
        " embedded experiences from a single codebase.");
  }



}
