import '../models/user_model.dart';

class UserController {
  User user = User(
    name: "Nadeem Khan",
    email: "nadeem.khan@outlook.com",
    phone: "345757675",
    gender: "Men",
    address: "G11/3, Islamabad",
    password: "*********",
  );

  // Update user profile
  void updateUser(User updatedUser) {
    user = updatedUser;
  }

  // Retrieve user data
  User getUserDetails() {
    return user;
  }
}
