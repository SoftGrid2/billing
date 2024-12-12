
import 'package:billing/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Add padding to the sides
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.05), // Responsive height
            Container(
              height: screenHeight * 0.07, // Responsive height
              width: screenWidth * 0.9, // Responsive width
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    color: Theme.of(context).primaryColor.withOpacity(.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'select language'.tr, // Use the translated string
                  style: const TextStyle(fontSize: 21),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // Responsive height
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02), // Add vertical padding
                crossAxisCount: 2,
                crossAxisSpacing: screenWidth * 0.1, // Responsive spacing
                mainAxisSpacing: screenHeight * 0.1, // Responsive spacing
                children: [
                  itemDashboard(
                    context,
                    'English',
                    Icons.sort_by_alpha,
                    Color(0xFF1CC1AB),
                        () {
                      var locale = const Locale('en', 'US');
                      Get.updateLocale(locale);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                  itemDashboard(
                    context,
                    'मराठी',
                    Icons.sort_by_alpha,
                    Color(0xFF1CC1AB),
                        () {
                      var locale = const Locale('mr', 'IN');
                      Get.updateLocale(locale);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemDashboard(
      BuildContext context,
      String title,
      IconData iconData,
      Color background,
      VoidCallback onTap,
      ) =>
      InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 3),
                color: Theme.of(context).primaryColor.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: background,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  iconData,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      );
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sgibooks/home/home_page.dart';
//
// class SelectLanguage extends StatelessWidget {
//   const SelectLanguage({Key? key}) : super(key: key);
//
//   Future<void> _setLanguage(BuildContext context, String languageCode) async {
//      SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('language', languageCode); // Save selected language
//     var locale = Locale(languageCode, languageCode == 'mr' ? 'IN' : 'US');
//     Get.updateLocale(locale); // Update the app's locale
//
//     // Navigate to HomePage
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => HomePage()),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             ElevatedButton(
//               onPressed: () => _setLanguage(context, 'en'),
//               child: const Text('English'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => _setLanguage(context, 'mr'),
//               child: const Text('मराठी'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
