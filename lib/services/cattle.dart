import 'package:client/core/errors/session_manager.dart';
import 'package:client/helper/toast.dart';
import 'package:client/model/cattle.dart';
import 'package:client/services/farm.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CattleService {
  static final supabase = Supabase.instance.client;

  static Future newCattle(CattleModel cattle) async {
    try {
      final cattleJson =
          await supabase
              .from('cattle')
              .insert(cattle.toJson())
              .select()
              .single();

      ToastUtils.showSuccess(
        title: 'Saved',
        subtitle: 'The record has been saved',
      );

      return CattleModel.fromJson(cattleJson);
    } catch (err) {
      rethrow;
    }
  }

  static Future fetchCattle() async {
    final userId = (await SessionManager.getUser())?.id;

    if (userId != null) {
      var farm = await FarmService.getFarm(userId);

      if (farm != null) {
        final cattleList = await supabase
            .from('cattle')
            .select()
            .eq('user_id', userId)
            .eq('farm_id', farm.id!);

        // final callback = List<CattleModel>.from(
        //   cattleList.map((cow) => CattleModel.fromJson(cow)),
        // );

        // final parsedCattle = await compute(callback, cattleList);

        // return parsedCattle;

        return List<CattleModel>.from(
          cattleList.map((cow) => CattleModel.fromJson(cow)),
        );
      }
    }
  }

  static Future<void> getCattleWIthId(String id) async {}
}
