import 'dart:convert';

import 'package:child_care_app/widgets/home_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FacilityPage extends StatefulWidget {
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
  _FacilityPageState createState() => _FacilityPageState();
}

class _FacilityPageState extends State<FacilityPage> {
  String _selectedTab = '시설 소개';

  void _onTabSelected(String tab) {
    setState(() {
      _selectedTab = tab;
    });
  }

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
                              widget.name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${widget.address}\n${widget.phone}',
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
                        onPressed: () => _onTabSelected('시설 소개'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedTab == '시설 소개'
                              ? Colors.blue
                              : Colors.white,
                          foregroundColor: _selectedTab == '시설 소개'
                              ? Colors.white
                              : Colors.black,
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
                        onPressed: () => _onTabSelected('봉사/후원'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedTab == '봉사/후원'
                              ? Colors.blue
                              : Colors.white,
                          foregroundColor: _selectedTab == '봉사/후원'
                              ? Colors.white
                              : Colors.black,
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
                        onPressed: () => _onTabSelected('게시판'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedTab == '게시판'
                              ? Colors.blue
                              : Colors.white,
                          foregroundColor: _selectedTab == '게시판'
                              ? Colors.white
                              : Colors.black,
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
                  const SizedBox(height: 16.0),
                  // 서버에서 받아온 데이터를 출력하는 위젯
                  ServerDataWidget(type: _selectedTab),
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

class ServerDataWidget extends StatefulWidget {
  final String type;

  const ServerDataWidget({required this.type, Key? key}) : super(key: key);

  @override
  _ServerDataWidgetState createState() => _ServerDataWidgetState();
}

class _ServerDataWidgetState extends State<ServerDataWidget> {
  Map<String, dynamic> _data = {};
  bool _isLoading = true;

  @override
  void didUpdateWidget(covariant ServerDataWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.type != widget.type) {
      _fetchData();
    }
  }

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    final url = 'https://your-server.com/${widget.type}';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        _data = json.decode(response.body);
        _isLoading = false;
      });
    } else {
      // Error handling
      print('Failed to load data');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // Type에 따라 다른 위젯을 반환
    switch (widget.type) {
      case '시설 소개':
        return _buildFacilityInfo();
      case '봉사/후원':
        return _buildVolunteerInfo();
      case '게시판':
        return _buildBoardInfo();
      default:
        return Container();
    }
  }

  Widget _buildFacilityInfo() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_data.containsKey('greeting'))
            Text(
              _data['greeting']['memo'] ?? '',
              style: const TextStyle(fontSize: 16),
            ),
          const SizedBox(height: 16.0),
          if (_data.containsKey('decadeYearList'))
            ...(_data['decadeYearList'] as List).map<Widget>((decade) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${decade['decadeStartYear']}~',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  ...(decade['yearList'] as List).map<Widget>((year) {
                    return Text(
                      '${year['year']}: ${year['memo']}',
                      style: const TextStyle(fontSize: 16),
                    );
                  }).toList(),
                ],
              );
            }).toList(),
          const SizedBox(height: 16.0),
          if (_data.containsKey('routeInfo'))
            Text(
              _data['routeInfo']['memo'] ?? '',
              style: const TextStyle(fontSize: 16),
            ),
        ],
      ),
    );
  }

  Widget _buildVolunteerInfo() {
    if (_data['volunteerList'] == null) {
      return const Center(child: Text("No data available"));
    }
    return Column(
      children: (_data['volunteerList'] as List).map<Widget>((entry) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5.0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                entry['name'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                '${entry['recruitmentStartDate']} ~ ${entry['recruitmentEndDate']}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                '${entry['currentApplicants']} / ${entry['totalApplicants']}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBoardInfo() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        _data['content'] ?? '',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
