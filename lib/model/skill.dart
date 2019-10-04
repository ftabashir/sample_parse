import 'package:parse_server_sdk/parse_server_sdk.dart';

class Skill extends ParseObject implements ParseCloneable {
  static const String _keyTableName = 'Skill';
  static const String keyTitle = 'title';

  Skill() : super(_keyTableName);

  Skill.clone() : this();

  /// Looks strangely hacky but due to Flutter not using reflection, we have to
  /// mimic a clone
  @override
  clone(Map map) => Skill.clone()..fromJson(map);

  String get title => get<String>(keyTitle);

  set title(String title) => set<String>(keyTitle, title);
}
