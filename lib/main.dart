import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            home: child,
          );
        },
        child: const SplashScreen());
    
//       designSize: const Size(360, 690),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       // Use builder only if you need to use library outside ScreenUtilInit context
//       builder: (_, child) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'First Method',
//           home: child,
//         );
//       },

//       //child: const HomeScreen(),

//       child: LogInScreen(),

//     );
  }
}
