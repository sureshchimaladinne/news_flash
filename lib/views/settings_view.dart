import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../models/localization_viewmodel.dart';
import '../models/theme_viewmodel.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text('settings'.tr,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<ThemeViewModel>(
              builder: (context, themeViewModel, child) {
                return SwitchListTile(
                  title: Text('darkmode'.tr),
                  value: themeViewModel.isDarkMode,
                  onChanged: (value) {
                    themeViewModel.toggleTheme();
                  },
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Consumer<LocalizationViewModel>(
                builder: (context, localizationViewModel, child) {
                  return DropdownButton<String>(

                    value: localizationViewModel.locale.languageCode,
                    items: [
                      DropdownMenuItem(
                        value: 'en',
                        child: Text('English'),
                      ),
                      DropdownMenuItem(
                        value: 'es',
                        child: Text('Spanish'),
                      ),
                    ],
                    onChanged: (value) {
                      localizationViewModel.changeLocale(value!);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
