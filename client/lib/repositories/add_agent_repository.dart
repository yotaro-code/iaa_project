import 'dart:convert';
import 'package:http/http.dart' as http;

class AddAgentRepository {
  final String baseUrl; // Cloud Run のエンドポイントを外部から注入

  AddAgentRepository(this.baseUrl);

  Future<String> createAgent(String agentName, String agentInformation) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/generate-agents'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'agentName': agentName,
          'agentInformation': agentInformation,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData['message'] as String; // メッセージを取得
      } else {
        throw Exception("エージェント作成失敗: ステータスコード ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("エージェント作成エラー: $e");
    }
  }
}
