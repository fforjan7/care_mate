import 'package:care_mate/data/models/room.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'floor.freezed.dart';
part 'floor.g.dart';

@freezed
class Floor with _$Floor {
  factory Floor({
    @Default("") String name,
    @Default([]) List<Room> rooms,
  }) = _Floor;

  factory Floor.fromJson(Map<String, dynamic> json) => _$FloorFromJson(json);
}
