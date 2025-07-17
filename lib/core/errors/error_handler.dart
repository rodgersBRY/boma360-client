import 'package:client/helper/toast.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void handleAuthError(AuthException e) {
  final message = _mapAutheErrorToMessage(e.message);
  _showError("Auth Error", message);
}

void handleError(PostgrestException e) {
  final message = _mapPostgrestErrorToMessage(e);
  _showError("Alert", message);
}

void handleGenericError(Object e) {
  // _showError('Server Error', "An unexpected error occurred. Please try again");
  if (kDebugMode) print(e);
}

String _mapAutheErrorToMessage(String rawMessage) {
  final normalized = rawMessage.toLowerCase();

  if (normalized.contains("invalid login credentials")) {
    return "Invalid email or password.";
  } else if (normalized.contains('foreign key')) {
    return "This profile already exists.";
  } else if (normalized.contains("user already registered")) {
    return "An account with this email already exists.";
  } else if (normalized.contains("email not confirmed")) {
    return "Please confirm your email address before signing in.";
  } else if (normalized.contains("validate email")) {
    return "Please enter a valid email address.";
  } else if (normalized.contains("password")) {
    return "Please enter a valid password.";
  } else {
    return rawMessage;
  }
}

String _mapPostgrestErrorToMessage(PostgrestException e) {
  final code = e.code?.toLowerCase() ?? '';
  final msg = e.message.toLowerCase();

  if (msg.contains('duplicate key') || code == '23505') {
    return "This item already exists.";
  } else if (msg.contains('foreign key')) {
    return "This item is linked elsewhere and cannot be deleted.";
  } else if (msg.contains('not null')) {
    return "Some required fields are missing.";
  } else if (msg.contains('permission denied')) {
    return "You don’t have permission to perform this action.";
  } else if (msg.contains('jwt expired')) {
    return "Your session has expired. Please sign in again.";
  }

  return e.message; // Default fallback
}

void _showError(String errorTitle, dynamic error) {
  ToastUtils.showError(title: errorTitle, subtitle: error);
}
