-keep class proguard.annotation.Keep { *; }
-keepclassmembers class proguard.annotation.KeepClassMembers { *; }
-dontwarn proguard.annotation.Keep
-dontwarn proguard.annotation.KeepClassMembers

-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}

-keepattributes JavascriptInterface
-keepattributes *Annotation*

-dontwarn com.razorpay.**
-keep class com.razorpay.** {*;}

-optimizations !method/inlining/*

-keepclasseswithmembers class * {
  public void onPayment*(...);
}