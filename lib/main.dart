import 'package:drico_chat/features/authentication/data/auth_remote_data_source.dart';
import 'package:drico_chat/features/chatting_list/provider/chatting_list_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './di/injectable.dart';
import './features/authentication/presentation/sign_in.dart';
import './features/authentication/presentation/sign_up.dart';
import './features/authentication/provider/auth_provider.dart';
import './features/chatting/presentation/chatting_screen.dart';
import './features/contacts/presentation/contact_screen.dart';
import './features/notification/presentation/notification_screen.dart';
import './features/story/presentation/story_screen.dart';
import './features/voice_call/presentation/voice_call_detail_screen.dart';
import './features/voice_call/presentation/voice_call_screen.dart';
import './home_page.dart';
import 'package:provider/provider.dart';

import 'features/chatting_list/data/chatting_list_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) =>
              AuthProvider(repo: getItInstance<AuthRemoteDataSource>()),
        ),
        ChangeNotifierProvider<ChattingListProvider>(
          create: (_) =>
              ChattingListProvider(repo: getItInstance<ChattingListRepo>()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            elevation: 0,
          ),

          // Define the default font family.
          fontFamily: 'DMSan',

          // Define the default `TextTheme`. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: const TextTheme(
              headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 22.0),
              bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'DMSan')),
        ),
        home: const SignUp(),
        routes: {
          HomePage.name: (context) => const HomePage(),
          ChattingScreen.name: (context) => const ChattingScreen(),
          StoryScreen.name: (context) => const StoryScreen(),
          VoiceCallScreen.name: (context) => const VoiceCallScreen(),
          VoiceCallDetail.name: (context) => const VoiceCallDetail(),
          NotificationScreen.name: (context) => const NotificationScreen(),
          ContactScreen.name: (context) => const ContactScreen(),
          SignUp.name: (context) => SignUp(),
          SignIn.name: (context) => const SignIn()
        },
      ),
    );
  }
}
