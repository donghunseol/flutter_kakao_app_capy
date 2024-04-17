import 'package:flutter/material.dart';
import 'package:kakao_app_v1/components/profile_card.dart';
import 'package:kakao_app_v1/data/user.dart';

class FriendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("친구")),
      body: Column(
        children: [
          const SizedBox(height: 10),
          ProfileCard(user: me),
          const Divider(), // 구분선 추가
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                const Text("친구"),
                const SizedBox(width: 6),
                Text("${friends.length}"),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: List.generate( // friends 리스트의 길이만큼 ProfileCard 위젯 생성
                friends.length,
                (index) => ProfileCard(user: friends[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
