import 'dart:io';

import 'package:cari_tukang/bloc/blocs.dart';
import 'package:cari_tukang/models/models.dart';
import 'package:cari_tukang/services/services.dart';
import 'package:cari_tukang/shared/shared.dart';
import 'package:cari_tukang/ui/widgets/available_card.dart';
import 'package:cari_tukang/ui/widgets/category_card.dart';
import 'package:cari_tukang/ui/widgets/promo_card.dart';
import 'package:cari_tukang/ui/widgets/tukang_card.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flushbar/flushbar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

part 'sign_in_page.dart';
part 'wrapper.dart';
part 'main_page.dart';
part 'splash_page.dart';
part 'builder_page.dart';
part 'sign_up_page.dart';
part 'account_confirmation_page.dart';
part 'interior_detail.dart';
part 'ticket_page.dart';
part 'profile_pages.dart';
part 'kitchenset_detail.dart';
part 'edit_profile_page.dart';
part 'error_page.dart';
