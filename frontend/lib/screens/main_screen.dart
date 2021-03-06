import 'package:flutter/material.dart';
import 'package:frontend/data_models/user.dart';
import 'package:frontend/screens/summary_screen.dart';
import 'package:frontend/screens/holdings_screen.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'main_screen';
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: Text('Uinvest'),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              text: 'Summary',
              //  icon: Icon(Icons.cloud_outlined),
            ),
            Tab(text: 'Holdings'
                // icon: Icon(Icons.beach_access_sharp),
                ),
            Tab(text: 'Suggestions'
                //  icon: Icon(Icons.brightness_5_sharp),
                ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          // TODO: Change this to screen widgets
          Center(
            child: SummaryScreen(currUser: args),
          ),
          Center(
            child: HoldingsScreen(currUser: args),
          ),
          Center(
            child: Text('It\'s sunny here'),
          ),
        ],
      ),
    );
  }
}

/// Flutter code sample for TabBar

// [TabBar] can also be implmented by using a [TabController] which provides more options
// to control the behavior of the [TabBar] and [TabBarView]. This can be used instead of
// a [DefaultTabController], demonstrated below.

// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// /// This is the main application widget.
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: _title,
//       home: MyStatefulWidget(),
//     );
//   }
// }

// /// This is the stateful widget that the main application instantiates.
// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// /// This is the private State class that goes with MyStatefulWidget.
// /// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
// class _MyStatefulWidgetState extends State<MyStatefulWidget>
//     with TickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('TabBar Widget'),
//         bottom: TabBar(
//           controller: _tabController,
//           tabs: const <Widget>[
//             Tab(
//               icon: Icon(Icons.cloud_outlined),
//             ),
//             Tab(
//               icon: Icon(Icons.beach_access_sharp),
//             ),
//             Tab(
//               icon: Icon(Icons.brightness_5_sharp),
//             ),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: const <Widget>[
//           Center(
//             child: Text('It\'s cloudy here'),
//           ),
//           Center(
//             child: Text('It\'s rainy here'),
//           ),
//           Center(
//             child: Text('It\'s sunny here'),
//           ),
//         ],
//       ),
//     );
//   }
// }
