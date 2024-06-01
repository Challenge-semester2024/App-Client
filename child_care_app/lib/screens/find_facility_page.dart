import 'package:child_care_app/screens/kakao_map_view.dart';
import 'package:child_care_app/widgets/home_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'facility_page.dart';

class FindFacilityPage extends StatefulWidget {
  const FindFacilityPage({super.key});

  @override
  _FindFacilityPageState createState() => _FindFacilityPageState();
}

class _FindFacilityPageState extends State<FindFacilityPage> {
  final TextEditingController _searchController = TextEditingController();

  void _searchFacilities() async {
    final query = _searchController.text;
    final url = Uri.parse('https://your-server.com/search?query=$query');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      // 서버 응답을 처리하는 로직
      print('검색 결과: ${response.body}');
    } else {
      // 에러 처리 로직
      print('검색 실패: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                const KakaoMapView(),
                Positioned(
                  top: 90, // 여기에서 위치를 조정합니다.
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            decoration: const InputDecoration(
                              hintText: '기관명 또는 주소로 검색',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: _searchFacilities,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: 3, // 예시 항목 수
              itemBuilder: (context, index) {
                return ListTile(
                  title: const Text('상록보육원'),
                  subtitle: const Text('주소 주소 주소 주소 주소 주소 주소'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FacilityPage(
                          name: '상록보육원',
                          address: '주소 주소 주소 주소 주소 주소 주소',
                          phone: '',
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const HomeBottomNavigationBar(),
    );
  }
}
