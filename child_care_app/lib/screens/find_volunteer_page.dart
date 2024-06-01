import 'package:flutter/material.dart';

class FindVolunteerPage extends StatelessWidget {
  const FindVolunteerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('봉사공고 찾기'),
      ),
      body: const Center(
        child: Text('봉사공고 찾기 페이지'),
      ),
    );
  }
}
