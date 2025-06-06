
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pertemuan11/data/repository/auth_repository.dart';
import 'package:pertemuan11/data/repository/get_all_burung_tersedia_repository.dart';
import 'package:pertemuan11/data/repository/profile_buyer_repository.dart';
import 'package:pertemuan11/presentation/auth/bloc/login/bloc/login_bloc.dart';
import 'package:pertemuan11/presentation/auth/bloc/register/bloc/register_bloc.dart';
import 'package:pertemuan11/presentation/bloc/bloc/get_burung_tersedia_bloc.dart';
import 'package:pertemuan11/presentation/buyer/profile/bloc/bloc/profile_bloc.dart';
import 'package:pertemuan11/services/service_http_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          LoginBloc(authRepository:AuthRepository(ServiceHttpClient()))
          ),
        BlocProvider(
          create: (context) =>
          RegisterBloc(authRepository:AuthRepository(ServiceHttpClient()))
          ),
        BlocProvider(
          create: (context) =>
          ProfileBuyerBloc(profileBuyerRepository: ProfileBuyerRepository(ServiceHttpClient()))
          ),
        BlocProvider(
          create: (context) => GetBurungTersediaBloc(GetAllBurungTersediaRepository(ServiceHttpClient())))
      ], 
      child: MaterialApp(
        title: 'flutter demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
        ),
        home: const Splashscreen(),
      ));
  }
}
