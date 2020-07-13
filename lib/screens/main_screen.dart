import 'package:fast_food/screens/parentfoods/partfood.dart';
import 'package:fast_food/screens/search/search.dart';
import 'package:fast_food/screens/useraccount/user.dart';
import 'package:fast_food/utilty/axis.dart';
import 'package:fast_food/utilty/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Drawer/drawer_list.dart';
import 'discountchildfoods/discount_childfoods_View_as_vertical_list.dart';
import 'home_screen.dart';
import 'mycard/mycard_view.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List filteredCountries = [];
  bool isSearching = false;
  int _currentIndex = 2;
  final Tab = [
    Center(child: SearchWidget()),
    Center(child: ParentFoods()),
    Center(
      child: HomeScreen(),
    ),
    Center(child: DiscountChildFoodsViewAsVerticalList()),
    Center(child: User()),
  ];

  @override
  void initState() {
    super.initState();
  }

  void _filterCountries(value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    axis = Axis.horizontal; // madwe byu arkan
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          drawer: DrawerList(),
          body: Tab[_currentIndex],
          /*    floatingActionButton: _FloatingActionButton(),*/
          bottomNavigationBar: _BottomNavigationBar(),
        ),
      ),
    );
  }

  FloatingActionButton _FloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyCardView()),
        );
      },
      backgroundColor: Colors.pink.shade600,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.shopping_basket,
            color: Colors.white,
          ),
          Text('0'),
        ],
      ),
    );
  }

  BottomNavigationBar _BottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      //type: BottomNavigationBarType.fixed,
      iconSize: 25,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: Colors.amber,
          ),
          title: Text("گەڕان", style: bottomnavigationlisttiltel_style),
          //    backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.line_style,
            color: Colors.amber,
          ),
          title: Text("بەرهەمەکان ", style: bottomnavigationlisttiltel_style),
          // backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.amber,
          ),
          title: Text("سەرەکی ", style: bottomnavigationlisttiltel_style),
          //  backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.card_giftcard,
            color: Colors.amber,
          ),
          title: Text("داشکاندەکان ", style: bottomnavigationlisttiltel_style),
          // backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_pin,
            color: Colors.amber,
          ),
          title: Text("هەژمارەکەم ", style: bottomnavigationlisttiltel_style),
          //  backgroundColor: Colors.red,
        )
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  _title() {
    return TextStyle(
      fontSize: 22,
      color: Colors.amber,
    );
  }
}
