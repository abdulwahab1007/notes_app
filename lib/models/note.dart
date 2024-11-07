
import 'package:isar/isar.dart';

part 'note.g.dart';

@Collection()
class Note {
  // SO for this Note MOdel , let me just define the things I want to have for a Note , 
  Id id=Isar.autoIncrement;
  late String text;

}