import 'package:expenser_app/screens/home/frags/frag_stats/frag_stats.dart';
import 'package:expenser_app/screens/home/frags/frag_transaction/frag_tranaction.dart';
import 'package:expenser_app/ui/custom_widgets/ui_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;

  var arrFrags = [
    FragTransaction(),
    FragStats()
  ];

  @override
  Widget build(BuildContext context) {
    var isLight = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: arrFrags[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        currentIndex: selectedIndex,
        selectedIconTheme: IconThemeData(
          size: 35
        ),
        unselectedIconTheme: IconThemeData(
          size: 22
        ),
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        backgroundColor:
            isLight ? MyColors.secondryWColor : MyColors.secoundryBColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.inbox_outlined,
                color: isLight
                    ? MyColors.secoundryBColor
                    : MyColors.secondryWColor,
              ),
              label: '',
              activeIcon: Icon(
                Icons.inbox_rounded,
                color: isLight ? MyColors.bgBColor : MyColors.bgWColor,
              ),
              tooltip: 'Transaction'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.auto_graph_outlined,
                color: isLight
                    ? MyColors.secoundryBColor
                    : MyColors.secondryWColor,
              ),
              label: '',
              activeIcon: Icon(
                Icons.auto_graph_rounded,
                color: isLight ? MyColors.bgBColor : MyColors.bgWColor,
              ),
              tooltip: 'Graph')
        ],
      ),
    );
  }
}
