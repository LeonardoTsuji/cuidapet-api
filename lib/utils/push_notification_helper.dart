import 'package:cuidapet_api/config/push_notification_config.dart';
import 'package:dio/dio.dart';

class PushNotificationHelper {
  static Future<void> sendMessage(List<String> devices, String title,
      String body, Map<String, dynamic> payload) async {
    final header = BaseOptions(
        headers: {'Authorization': 'key=${PushNotificationConfig.token}'});
    final request = {
      "notification": {"body": body, "title": title},
      "priority": "high",
      "data": {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "id": "1",
        "status": "done",
        'payload': payload,
      },
    };

    for (var device in devices) {
      if (device != null) {
        request['to'] = device;
        var res = await Dio(header)
            .post('https://fcm.googleapis.com/fcm/send', data: request);
        print(res.data);
      }
    }
  }
}
