import 'package:client/config/constants.dart';
import 'package:client/core/errors/session_manager.dart';
import 'package:client/helper/toast.dart';
import 'package:client/model/yield.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class YieldRecordService {
  static final supabase = Supabase.instance.client;

  static Future<YieldModel> newYieldRecord(YieldModel yieldRecord) async {
    try {
      final yieldRecordJson =
          await supabase
              .from(kYieldsTable)
              .insert(yieldRecord.toJson())
              .select()
              .single();

      ToastUtils.showSuccess(
        title: 'Saved',
        subtitle: 'The record has been saved',
      );

      return YieldModel.fromJson(yieldRecordJson);
    } catch (err) {
      rethrow;
    }
  }

  static Future<List<YieldModel>> fetchCattleYieldRecords(
    String cattleId,
  ) async {
    final userId = (await SessionManager.getUser())?.id;

    final yieldRecords = await supabase
        .from(kYieldsTable)
        .select()
        .eq(kFarmerIdColumn, userId!)
        .eq(kCattleIdColumn, cattleId);

    return List<YieldModel>.from(
      yieldRecords.map((record) => YieldModel.fromJson(record)),
    );
  }

  static Future fetchAggregateCattleYieldRecords(String cattleId) async {
    final response = await supabase.rpc(
      'get_total_cow_yield',
      params: {'cow_id': cattleId},
    );

    return response;
  }
  
  static Future fetchAggregateMilkYield() async {
    final userId = (await SessionManager.getUser())?.id;

    final response = await supabase.rpc(
      'get_total_milk_yield',
      params: {'farmer_id': userId},
    );

    return response;
  }

  static Future<YieldModel?> getYieldWIthId(String id) async {
    final yieldRecordJson =
        await supabase.from(kYieldsTable).select().eq('id', id).maybeSingle();

    if (yieldRecordJson != null) {
      return YieldModel.fromJson(yieldRecordJson);
    }

    return null;
  }
}
