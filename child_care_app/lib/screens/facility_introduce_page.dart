import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FacilityIntroducePage extends StatefulWidget {
  final String type;

  const FacilityIntroducePage({required this.type, Key? key}) : super(key: key);

  @override
  _FacilityIntroducePage createState() => _FacilityIntroducePage();
}

class _FacilityIntroducePage extends State<FacilityIntroducePage> {
  String _content = '';
  bool _isLoading = true;

  @override
  void didUpdateWidget(covariant FacilityIntroducePage oldWidget) {
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
        _content = json.decode(response.body)['content'];
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

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        _content,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
