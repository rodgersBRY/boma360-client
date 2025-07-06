import 'package:client/helper/toast.dart';
import 'package:client/model/farm.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FarmService {
  static final supabase = Supabase.instance.client;

  static Future newFarm(FarmModel farm) async {
    try {
      final response =
          await supabase
              .from('farms')
              .insert(farm.toJson())
              .select('name')
              .single();

      ToastUtils.showSuccess(
        title: 'New Farm: ${response['name']}',
        subtitle: 'Your farm has been saved',
      );

      return response;
    } catch (err) {
      rethrow;
    }
  }

  static Future getFarm() async {
    // final userId = SessionManager.getUser();

    try {
      final response = await supabase.from('farms').select().single();

      return response;
    } catch (err) {
      rethrow;
    }
  }

  static Future<void> fetchCattle(String userId, String farmId) async {}

  static Future<void> getCattleWIthId(String id) async {}
}
