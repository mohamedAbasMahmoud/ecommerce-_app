import 'dart:io'; // مكتبة للتحكم في الشبكة، نستخدمها لفحص الاتصال بالإنترنت

// دالة للتحقق من وجود اتصال فعلي بالإنترنت
checkInternet() async {
  try {
    // نحاول تنفيذ DNS lookup على google.com
    // إذا نجحت العملية، هذا يعني غالبًا أن الإنترنت متصل
    var result = await InternetAddress.lookup("google.com");

    // إذا كانت النتيجة غير فارغة، وكان فيها عنوان IP حقيقي
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true; // ✅ يوجد اتصال إنترنت
    }

  } on SocketException catch (_) {
    // إذا حدث خطأ من نوع SocketException (عادةً بسبب عدم الاتصال بالإنترنت)
    return false; // ❌ لا يوجد اتصال إنترنت
  }
}

