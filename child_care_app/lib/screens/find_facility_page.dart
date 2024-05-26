import 'package:child_care_app/screens/kakao_map_view.dart';
import 'package:child_care_app/widgets/home_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class FindFacilityPage extends StatelessWidget {
  const FindFacilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            const Expanded(
              flex: 2,
              child: KakaoMapView(), // 아래에서 이 위젯을 구현하세요
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: 3, // 예시 항목 수
                itemBuilder: (context, index) {
                  return const ListTile(
                    title: Text('상록보육원'),
                    subtitle: Text('주소 주소 주소 주소 주소 주소 주소'),
                    trailing: Icon(Icons.arrow_forward),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: const HomeBottomNavigationBar());
  }
}
