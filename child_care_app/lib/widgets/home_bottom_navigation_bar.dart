import 'package:flutter/material.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: const Color.fromARGB(255, 0, 60, 164),
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: const TextStyle(
        color: Colors.grey, // 선택된 아이템의 라벨 색상을 회색으로 설정
        fontSize: 14, // 선택된 아이템의 라벨 크기를 키움
      ),
      unselectedLabelStyle: const TextStyle(
        color: Colors.grey, // 선택되지 않은 아이템의 라벨 색상을 회색으로 설정
        fontSize: 14, // 선택되지 않은 아이템의 라벨 크기를 키움
      ),
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 30), // 아이콘 크기 조정
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star, size: 30), // 아이콘 크기 조정
          label: '관심 기관',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark, size: 30), // 아이콘 크기 조정
          label: '스크랩 공고',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz, size: 30), // 아이콘 크기 조정
          label: '더보기',
        ),
      ],
    );
  }
}
