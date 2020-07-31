import 'package:flutter/material.dart';
import 'package:food_recipe/presentation/blocs/food_recipe_bloc.dart';
import 'package:food_recipe/presentation/widgets/main_pages/account.dart';
import 'package:food_recipe/presentation/widgets/main_pages/categories.dart';
import 'package:food_recipe/presentation/widgets/main_pages/home.dart';
import 'package:food_recipe/presentation/widgets/main_pages/setting.dart';
import 'package:provider/provider.dart';
import '../../di/di.dart';

class MainPage extends StatefulWidget {
  static const ROUTE_NAME = "MainPage";
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<BottomNavigationBarItem> _bottomBar = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
    BottomNavigationBarItem(
        icon: Icon(Icons.category), title: Text("Category")),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_box), title: Text("Account")),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
        ),
        title: Text("Setting"))
  ];

  List<Widget> _pages = [Home(), Categories(), Account(), Settings()];
  PageController _controller = PageController();
  int _index;

  _changePage(int index) {
    setState(() {
      this._index = index;
    });
    _controller.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  void initState() {
    _index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = getIt<FoodRecipeBloc>();
    return Provider(
      create: (context) => bloc,
      dispose: (context, value) => bloc.dispose(),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Food recipe"),
        ),
        body: PageView.builder(
          controller: _controller,
          itemCount: _pages.length,
          itemBuilder: (context, index) => _pages[index],
          onPageChanged: (value) {
            setState(() {
              _index = value;
            });
          },
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Colors.grey.withOpacity(0.5)),
          child: BottomNavigationBar(
            items: _bottomBar,
            currentIndex: this._index,
            onTap: (index) => _changePage(index),
            unselectedItemColor: Colors.lightBlue,
            selectedItemColor: Colors.green,
            showUnselectedLabels: true,
          ),
        ),
      ),
    );
  }
}
