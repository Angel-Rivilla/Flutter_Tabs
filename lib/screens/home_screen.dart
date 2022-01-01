import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentPage = 1;
  final PageController pageController = new PageController( initialPage: 1);

  @override
  Widget build(BuildContext context) {

    //* AppBar
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Material App Bar $currentPage'),
        elevation: 0,
      ),

    //? Cambiar la pantalla
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          CustomScreen(color: Colors.blue),
          CustomScreen(color: Colors.pink),
          CustomScreen(color: Colors.indigo),
        ],
      ),

      //body: currentPage == 0
      //  ? CustomScreen(color: Colors.pink)
      //  : currentPage == 1
      //    ? CustomScreen(color: Colors.indigo)
      //    : CustomScreen(color: Colors.green),

    //* Tabs
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          currentPage = index;
          pageController.animateToPage(
            currentPage, 
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut
          );
          setState(() {});
        },
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.verified_user_outlined),
            label: 'User',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.car_rental_outlined),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}

class CustomScreen extends StatelessWidget {

  final Color color;

  const CustomScreen({ required this.color });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text('Custom Screen')
      ),
    );
  }
}