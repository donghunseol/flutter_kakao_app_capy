import 'package:flutter/material.dart';
import 'package:kakao_app_v1/data/user.dart';

class ProfileCard extends StatelessWidget {
  final User user;

  const ProfileCard({
    Key? key, // key 매개변수는 위젯의 고유 식별자로, 선택적으로 제공
    required this.user, // user 매개변수는 User 타입의 객체로, ProfileCard 생성 시 필수
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
            user.backgroundImage,
          ),
        ),
        title: Text(
          user.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          user.intro,
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
