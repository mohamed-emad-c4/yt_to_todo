import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class PrivacyAndSecurityPage extends StatelessWidget {
  const PrivacyAndSecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).PrivacyAndSecurity),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).effective_date,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              S.of(context).we_take_privacy_seriously,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              S.of(context).information_we_collect,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              S.of(context).personal_information1,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              S.of(context).personal_information2,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              S.of(context).how_we_use_your_information,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              S.of(context).to_provide_and_maintain,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              S.of(context).to_notify_you_about,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              S.of(context).to_allow_you_to_participate,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              S.of(context).to_provide_support_for,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              S.of(context).to_gather_analyze_data,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              S.of(context).to_monitor,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              S.of(context).to_detect,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
            S.of(context).data_security,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              S.of(context).we_take_security,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              S.of(context).third_party,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              S.of(context).our_app,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              S.of(context).change_this,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              S.of(context).we_may_update,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
           
          ],
        ),
        ),
      ),
    );
  }
}

