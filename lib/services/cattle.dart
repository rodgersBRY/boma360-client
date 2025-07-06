import 'package:client/helper/toast.dart';
import 'package:client/model/cattle.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CattleService {
  static final supabase = Supabase.instance.client;

  static Future<void> newCattle(CattleModel cattle) async {
    try {
      final response = await supabase.from('cattle').insert(cattle);

      if (response.error == null) {
        ToastUtils.showSuccess(
          title: 'Saved',
          subtitle: 'The record has been saved',
        );
      }
    } catch (err) {
      rethrow;
    }
  }

  static Future<void> fetchCattle(String userId, String farmId) async {}

  static Future<void> getCattleWIthId(String id) async {}
}
