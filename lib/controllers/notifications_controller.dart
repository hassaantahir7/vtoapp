// controllers/notifications_controller.dart
import '../models/notification_model.dart';

class NotificationsController {
  // Simulate fetching data from an API or a database
  List<NotificationModel> getNotifications() {
    return [
      NotificationModel(
        imagePath: 'assets/orderTaken.png',
        message: 'Your order has been taken by the driver',
        timestamp: 'Recently',
      ),
      NotificationModel(
        imagePath: 'assets/orderCancelled.png',
        message: 'Your order has been canceled',
        timestamp: '22 June 2021',
      ),
    ];
  }
}
