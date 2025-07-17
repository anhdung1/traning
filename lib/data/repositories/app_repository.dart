import 'package:training/data/repositories/login_repository.dart';

abstract class AppRepository {}

class AppRepositoryImpl extends AppRepository with LoginRepository {}
