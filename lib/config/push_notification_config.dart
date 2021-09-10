import 'package:cuidapet_api/cuidapet_api.dart';
import 'package:yaml/yaml.dart';

class PushNotificationConfig {
  static String token;

  static void load(String file) {
    final String contents = File(file).readAsStringSync();
    final config = loadYaml(contents) as Map<dynamic, dynamic>;

    final String pushNotificationToken =
        config['push_notification_token'] as String;
    token = pushNotificationToken;
  }
}
