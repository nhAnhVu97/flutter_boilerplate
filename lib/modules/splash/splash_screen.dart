import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_boilerplate/core/shared/cubits/theme/theme_cubit.dart';
import 'package:flutter_project_boilerplate/core/shared/themes/app_text_style.dart';
import 'package:flutter_project_boilerplate/core/shared/widgets/gap.dart';
import 'package:flutter_project_boilerplate/injector_setup.dart';
import 'package:flutter_project_boilerplate/modules/splash/cubit/splash_cubit.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _cubit = SplashCubit();
  final _themeCubit = injector.get<ThemeCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('title'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                child: const Text('Dark Theme'),
                onPressed: () {
                  _themeCubit.setTheme(AppTheme.dark);
                },
              ),
              const Gap(24),
              ElevatedButton(
                child: Text(
                  'Light Theme',
                  style: AppTextStyles.body2.success,
                ),
                onPressed: () {
                  _themeCubit.setTheme(AppTheme.light);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
