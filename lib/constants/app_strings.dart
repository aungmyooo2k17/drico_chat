class AppStrings {
  _App app = _App();
  _Chatting chatting = _Chatting();
  _API apis = _API();
}

class _App {
  String appName = "DricoChat";
  String call = "Calls";
  String notification = "Notifications";
  String contact = "Contacts";
  String email = "Email ID";
  String username = "Username";
  String password = "Password";
  String signup = "Sing up";
  String login = "Login";
}

class _Chatting {
  String userStatus = "Online";
  String conversationInput = "Type Here...";
  String storyInput = "Comment Here...";
}

class _API {
  String baseURL = "http://192.168.1.4:4000/";
  String wsUrl = "ws://192.168.1.7:4000/socket/websocket";
  String register = "api/users/register";
  String login = "api/users/log_in";
  String conversationList = "api/conversation";
}
