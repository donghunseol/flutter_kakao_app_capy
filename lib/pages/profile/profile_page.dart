import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kakao_app_v1/components/bottom_icon_button.dart';
import 'package:kakao_app_v1/components/round_icon_button.dart';
import 'package:kakao_app_v1/data/user.dart';

class ProfilePage extends StatelessWidget {
  final User user;

  const ProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration( // 박스를 그리는 다양한 방법 제공
        // BoxDecoration을 사용하여 컨테이너에 배경 이미지 설정
        image: DecorationImage(
          image: NetworkImage(user.backgroundImage),
          fit: BoxFit.fitHeight, // 이미지가 컨테이너의 높이에 맞게 조절되도록 설정
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            const Spacer(),
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle, // 둥근 프로필 이미지 만들기
                image: DecorationImage(
                  image: NetworkImage(user.backgroundImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              user.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              user.intro,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 20),
            const Divider(color: Colors.white),
            if (user.name == me.name) _buildMyIcons() else _buildFriendIcons(),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              FontAwesomeIcons.times,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context); // 현재 화면을 닫고 이전 화면으로 돌아가는 기능을 수행
            },
          ),
          actions: [
            const RoundIconButton(icon: FontAwesomeIcons.gift),
            const SizedBox(width: 15),
            const RoundIconButton(icon: FontAwesomeIcons.cog),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildMyIcons() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BottomIconButton(
            icon: FontAwesomeIcons.comment,
            text: "나와의 채팅",
          ),
          SizedBox(
            width: 50,
          ),
          BottomIconButton(
            icon: FontAwesomeIcons.pen,
            text: "프로필 편집",
          ),
        ],
      ),
    );
  }

  Widget _buildFriendIcons() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BottomIconButton(
            icon: FontAwesomeIcons.comment,
            text: "1:1채팅",
          ),
          SizedBox(
            width: 50,
          ),
          BottomIconButton(
            icon: FontAwesomeIcons.phone,
            text: "통화하기",
          ),
        ],
      ),
    );
  }
}
