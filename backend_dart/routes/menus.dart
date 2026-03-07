import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context){
  final List<Map<String, dynamic>> menuItem = [
    {
      'itemId': 'M001',
      'name': 'เนื้อวากิวสไลด์',
      'price': 199.0,
      'isAvailable': true,
    },
    {
      'itemId': 'M002',
      'name': 'ชุดผักรวมมิตร',
      'price': 89.0,
      'isAvailable': true,
    },
    {
      'itemId': 'M003',
      'name': 'ลูกชิ้นกุ้งปั้นสด',
      'price': 120.0,
      'isAvailable': false,
    }
  ];
  return Response.json(body: menuItem);
}