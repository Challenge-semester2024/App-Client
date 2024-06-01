import 'package:child_care_app/widgets/home_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class FacilityPage extends StatelessWidget {
  final String name;
  final String address;
  final String phone;

  const FacilityPage({
    required this.name,
    required this.address,
    required this.phone,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150.0,
            pinned: false,
            leading: Container(), // 뒤로가기 버튼 숨기기
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/facility.png', // 실제 이미지 파일 경로로 변경
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                          'assets/profile.png', // 실제 프로필 이미지 경로로 변경
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '$address\n$phone',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.star_border),
                        onPressed: () {
                          // 관심기관 추가 로직
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // 시설 소개 페이지로 이동
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 24.0,
                          ),
                        ),
                        child: const Text('시설 소개'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // 봉사/후원 페이지로 이동
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 24.0,
                          ),
                        ),
                        child: const Text('봉사/후원'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // 게시판 페이지로 이동
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 24.0,
                          ),
                        ),
                        child: const Text('게시판'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    height: 1.0,
                    color: Colors.grey[300], // 연한 회색
                  ),
                  // Additional content can go here
                  Container(
                    height: 400, // 임시 높이 값
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const HomeBottomNavigationBar(),
    );
  }
}
