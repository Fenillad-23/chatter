import 'package:chatter/auth/signup.dart';
import 'package:chatter/home.dart';
import 'package:get/get.dart';
import '../auth/signin.dart';
import '../chat/add_chat_screen.dart';
import '../intro/splash1.dart';
abstract class RouteGenerator {
  static final splash = '/splashscreen';
  static final login = '/loginscreen';
  static final register = '/registerscreen';
  static final home = '/homescreen';
  static final addchat = '/addchatscreen';
  static List <GetPage> screens  = [
    GetPage(name: RouteGenerator.splash, page:()=> SplashScreen1()),
    GetPage(name: RouteGenerator.home, page:()=> Home()),
    GetPage(name: RouteGenerator.login, page:()=> SignIn()),
    GetPage(name: RouteGenerator.register, page:()=> SignUp()),
    GetPage(name: RouteGenerator.addchat, page:()=> AddChatScreen()),
  ];
}