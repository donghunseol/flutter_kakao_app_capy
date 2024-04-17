import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kakao_app_v1/pages/chat/chat_page.dart';
import 'package:kakao_app_v1/pages/friend/friend_page.dart';
import 'package:kakao_app_v1/pages/more/more_page.dart';

class MainHolder extends StatefulWidget {
  const MainHolder({
    super.key,
  });

  @override
  State<MainHolder> createState() => _MainHolderState();
}

class _MainHolderState extends State<MainHolder> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          FriendPage(),
          ChatPage(),
          MorePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.grey[100],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        onTap: (index) {
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
        items: [
          // BottomNavigationBarItem 은 2개 이상이여야 하며 페이지 수에 맞춰야한다
          const BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.comment),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.ellipsisH),
            label: "",
          ),
        ],
      ),
    );
  }
}
