import 'package:dio/dio.dart';

class PushNotificationHelper {
  static Future<void> sendMessage(List<String> devices, String title,
      String body, Map<String, dynamic> payload) async {
    final header = BaseOptions(headers: {
      'Authorization':
          'key=AAAA42xD_mE:APA91bGLoQIuH3Uo9Io5tPZYlbFLUzpwxQjBWrjF067PnalpRZIRljMwI9wUhymZ78e4XI9fDImZyKzxepuGVXbKkf-TB6A4TW6ndQ0ns8RbcBCxZS0_tLbS2kIjjZRITAq4U-0Unu54'
    });
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
