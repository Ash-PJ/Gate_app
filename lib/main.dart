import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Dio _dio = Dio();
  String _responseUrl = "";
  String _storedUrl = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Center(
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      try {
                        _dio.options.baseUrl = "https://httpbin.org";
                        var response = await _dio.get("/get");
                        setState(() {
                          _responseUrl = _storedUrl;
                        });
                      } catch (e) {
                        setState(() {
                          _responseUrl = e.toString();
                        });
                      }
                    },
                    child: Text('Get status'),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () async {
                      try {
                        _dio.options.baseUrl = "https://httpbin.org";
                        var response = await _dio.put("/put", data: {"url": "Status updated : 0"});
                        setState(() {
                          _storedUrl = response.data["url"];
                        });
                      } catch (e) {
                        setState(() {
                          _responseUrl = e.toString();
                        });
                      }
                    },
                    child: Text('Open'),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () async {
                      try {
                        _dio.options.baseUrl = "https://httpbin.org";
                        var response = await _dio.put("/put", data: {"url": "Status updated : 1"});
                        setState(() {
                          _storedUrl = response.data["url"];
                        });
                      } catch (e) {
                        setState(() {
                          _responseUrl = e.toString();
                        });
                      }
                    },
                    child: Text('Stop'),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () async {
                      try {
                        _dio.options.baseUrl = "https://httpbin.org";
                        var response = await _dio.put("/put", data: {"url": "Status updated : 2"});
                        setState(() {
                          _storedUrl = response.data["url"];
                        });
                      } catch (e) {
                        setState(() {
                          _responseUrl = e.toString();
                        });
                      }
                    },
                    child: Text('Close'),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: Container(
          color: Colors.white,
          width: double.infinity,
          height: 50,
          alignment: Alignment.center,
          child: Text(_responseUrl ?? ""),
        ),
      ),
    );
  }
}
