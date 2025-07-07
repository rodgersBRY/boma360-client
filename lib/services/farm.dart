import 'package:client/helper/toast.dart';
import 'package:client/model/farm.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FarmService {
  static final supabase = Supabase.instance.client;

  static Future newFarm(FarmModel farm) async {
    try {
      final response =
          await supabase.from('farms').insert(farm.toJson()).select().single();

      ToastUtils.showSuccess(
        title: 'New Farm: ${response['name']}',
        subtitle: 'Your farm has been saved',
      );

      return FarmModel.fromJson(response);
    } catch (err) {
      rethrow;
    }
  }

  static Future<FarmModel?> getFarm(String userId) async {
    try {
      final farmJson =
          await supabase
              .from('farms')
              .select()
              .eq('user_id', userId)
              .maybeSingle();

      if (farmJson == null) {
        throw Exception('No farm for this user');
      }

      return FarmModel.fromJson(farmJson);
    } catch (err) {
      rethrow;
    }
  }

  static Future<void> fetchCattle(String userId, String farmId) async {}

  static Future<void> getCattleWIthId(String id) async {}
}
