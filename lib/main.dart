import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_dart/common/config/Themes.dart';

void main() => runApp(MyApp());

//var _context = myContext1;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo 转得快',
      theme: defaultTargetPlatform == TargetPlatform.iOS
          ? Themes.kIOSTheme
          : Themes.kDefaultTheme, // 根据平台获取主题
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
    var myContext = context;
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

//此小部件是应用程序的主页。 这是有状态的，意思
//它有一个State对象（在下面定义），其中包含影响的字段
// 它看起来如何
//此类是状态的配置。 它保留了价值（在此
//案例标题）由父母提供（在本例中为App小部件）和
//始终标记为“最终”。

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List<StatefulWidget> _pages = [
//  HomeScreen(),
//  CategoryScreen(),
//  BlankScreen(),// 空白
//  MessageScreen(),
//  MineScreen()
];

final _bottomNavigationTextColor = Colors.black; // 导航字体颜色
final _bottomNavigationIconColor = Colors.black; // 导航默认图标颜色
final _bottomNavigationActiveIconColor = Colors.deepOrange; // 导航选中图标颜色

int _currentIndex = 0; // 当前 页面 下标
var _controller = PageController(
  initialPage: 0, // 底部 初始化页面 和状态
);

_onAdd() {
//  setState(() {});
 new Builder(builder: (BuildContext context) {
    return new Center(
      child: new GestureDetector(
        onTap: () {
          final snackBar =
          new SnackBar(content: new Text('这是一个SnackBar'));
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: new Text('显示SnackBar'),
      ),
    );
  });
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: _pages,
        physics: NeverScrollableScrollPhysics(), // 进制滑动切换
      ),
/*圆形发布按钮*/
      floatingActionButton: new Builder(builder: (BuildContext context) {
        return new FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          onPressed: _onAdd(),
          child: const Icon(Icons.add_box, color: Colors.white),
          tooltip: "发布", // 常按显示提示
//          heroTag: null, // 去除系统默认动画效果
        );
      }),
/* 添加圆形发布按钮位置*/
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
/*底部导航点击事件*/
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          var _index = index;
          if (_index == 2) {
            // tab添加被点击
            _onAdd();
            return;
          }
//          _controller.animateToPage(_index,
//              duration: Duration(milliseconds: 1000),
//              curve: Curves.fastOutSlowIn); // 动画效果 切换
          _controller.jumpToPage(_index); // 无动画效果切换
          setState(() {
            _currentIndex = _index;
          });
        },
        type: BottomNavigationBarType.fixed,
        //fixedColor: Colors.white,
        items: [
          new BottomNavigationBarItem(
            activeIcon:
                new Icon(Icons.home, color: _bottomNavigationActiveIconColor),
            backgroundColor: Colors.white,
            icon: new Icon(Icons.home, color: _bottomNavigationIconColor),
            title: new Text("首页",
                style: TextStyle(color: _bottomNavigationTextColor)),
          ),
          new BottomNavigationBarItem(
            activeIcon: new Icon(Icons.category,
                color: _bottomNavigationActiveIconColor),
            icon: new Icon(
              Icons.category,
              color: _bottomNavigationIconColor,
            ),
            title: new Text("分类",
                style: TextStyle(color: _bottomNavigationTextColor)),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(
              Icons.add,
              color: Colors.black12,
            ),
            title: new Text("发布",
                style: TextStyle(color: _bottomNavigationTextColor)),
          ),
          new BottomNavigationBarItem(
            activeIcon: new Icon(Icons.message,
                color: _bottomNavigationActiveIconColor),
            icon: new Icon(Icons.message, color: _bottomNavigationIconColor),
            title: new Text("消息",
                style: TextStyle(color: _bottomNavigationTextColor)),
          ),
          new BottomNavigationBarItem(
            activeIcon: new Icon(Icons.category,
                color: _bottomNavigationActiveIconColor),
            icon: new Icon(Icons.person_add, color: _bottomNavigationIconColor),
            title: new Text("我的",
                style: TextStyle(color: _bottomNavigationTextColor)),
          ),
        ],
      ),
    );
  }
}
