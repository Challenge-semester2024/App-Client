import 'package:child_care_app/widgets/home_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class FavoriteFacilitiesPage extends StatelessWidget {
  const FavoriteFacilitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // body의 배경색을 회색으로 변경
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // 뒤로가기 버튼 숨기기
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/logo.png', // 로고 이미지 경로
              height: 80, // 로고 높이
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '관심 기관',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: 6, // 예시 데이터 개수
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    tileColor: Colors.white,
                    leading: const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/profile.png'), // 프로필 이미지 경로
                    ),
                    title: const Text(
                      '어린이 천국 메이커스',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      '경상북도 도레미 파솔라 36',
                      style: TextStyle(fontSize: 14),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      onPressed: () {
                        // 관심기관 해제 로직
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 1,
                    color: Colors.grey,
                    indent: 16,
                    endIndent: 16,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const HomeBottomNavigationBar(),
    );
  }
}
