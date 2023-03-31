import 'package:flutter/material.dart';
import 'package:bankigproject/Banking/screen/BankingHome1.dart';
import 'package:bankigproject/Banking/screen/BankingMenu.dart';
import 'package:bankigproject/Banking/screen/BankingPayment.dart';
import 'package:bankigproject/Banking/screen/BankingSaving.dart';
import 'package:bankigproject/Banking/screen/BankingTransfer.dart';
import 'package:bankigproject/Banking/utils/BankingBottomNavigationBar.dart';
import 'package:bankigproject/Banking/utils/BankingColors.dart';
import 'package:bankigproject/Banking/utils/BankingImages.dart';
import 'package:bankigproject/Banking/utils/BankingStrings.dart';

class BankingDashboard extends StatefulWidget {
  static var tag = "/BankingDashboard";

  @override
  _BankingDashboardState createState() => _BankingDashboardState();
}

class _BankingDashboardState extends State<BankingDashboard> {
  var selectedIndex = 0;
  var pages = [
    BankingHome1(),
    BankingTransfer(),
    BankingPayment(),
    BankingSaving(),
    BankingMenu(),
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Banking_app_Background,
      bottomNavigationBar: BankingBottomNavigationBar(
        selectedItemColor: Banking_Primary,
        unselectedItemColor: Banking_greyColor.withOpacity(0.5),
        items: <BankingBottomNavigationBarItem>[
          BankingBottomNavigationBarItem(
              icon: Banking_ic_Home, title: Text(Banking_lbl_Home)),
          BankingBottomNavigationBarItem(
              icon: Banking_ic_Transfer, title: Text(Banking_lbl_Transfer)),
          BankingBottomNavigationBarItem(
              icon: Banking_ic_Payment, title: Text(Banking_lbl_Payment)),
          BankingBottomNavigationBarItem(
              icon: Banking_ic_Saving, title: Text(Banking_lbl_Saving)),
          BankingBottomNavigationBarItem(
              icon: Banking_ic_Menu, title: Text(Banking_lbl_Menu)),
        ],
        currentIndex: selectedIndex,
        unselectedIconTheme:
            IconThemeData(color: Banking_greyColor.withOpacity(0.5), size: 28),
        selectedIconTheme: IconThemeData(color: Banking_Primary, size: 28),
        onTap: _onItemTapped,
        type: BankingBottomNavigationBarType.fixed,
      ),
      body: SafeArea(
        child: pages[selectedIndex],
      ),
    );
  }
}
