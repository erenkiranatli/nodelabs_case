import 'package:flutter/material.dart';
import 'package:nodelabs_case/core/utils/limited_offer_modal.dart';

class ProfileViewModel extends ChangeNotifier {
  void showPremiumModal(BuildContext context) {
    LimitedOfferModal().showPremiumModal(context);
  }
}
