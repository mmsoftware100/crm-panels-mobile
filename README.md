# CRM Panels 

- [ ] Open webpage
- [ ] Icon Update
- [ ] App Name Update
- [ ] File Upload Check
- [ ] Back Key Handle


visa app ကို နမူနာ ကြည့်ထားလို့ရမယ်။


```bash
environment:
    sdk: '>=3.0.6 <4.0.0'
    # sdk: ^3.5.1
```


finally up and runned.

ရိုးရှင်းတဲ့ ကုတ်တွေဟာ ဗားရှင်း အပြောင်းအလဲမှာ up and running တောင် တက်မလာနိုင်အောင် ပြဿနာများ။
အဲ့လောက် mature မဖြစ််တဲ့ framework နဲ့ package တွေကို သုံးနေရတာ အန္တရာယ်အတော်များလာတယ်။


စိတ်ပျက်စရာ Error များေပါ့

Hello World တက်ဖို့တောင် တစ်နေကုန်ကြာတယ်။

```bash
Running Gradle task 'assembleDebug'...                            127.5s

┌─ Flutter Fix ──────────────────────────────────────────────────────────────────────────────────────────┐
│ [!] Your project requires a newer version of the Kotlin Gradle plugin.                                 │
│ Find the latest version on https://kotlinlang.org/docs/releases.html#release-details, then update the  │
│ version number of the plugin with id "org.jetbrains.kotlin.android" in the plugins block of            │
│ /Users/msd/Code/repos/flutter/crm/android/settings.gradle.                                             │
│                                                                                                        │
│ Alternatively (if your project was created before Flutter 3.19), update                                │
│ /Users/msd/Code/repos/flutter/crm/android/build.gradle                                                 │
│ ext.kotlin_version = '<latest-version>'                                                                │
└────────────────────────────────────────────────────────────────────────────────────────────────────────┘
Error: Gradle task assembleDebug failed with exit code 1

```

ဘာကြောင့် ဒါတွေကို ဂရုစိုက်နေရသလဲဆိုတာလည်း နားမလည်နိုင်
အခြေခံ building block တွေကို မသိတော့ အတော် ခံပြင်းတယ်။
Native ဘက်ကိုပဲ ခြေစုံပစ်ပြီး ကူးဖို့ အချိန်တန်ပြီ။

```bash


* What went wrong:
An exception occurred applying plugin request [id: 'kotlin-android']
> Failed to apply plugin 'kotlin-android'.
   > Kotlin Gradle Plugin <-> Android Gradle Plugin compatibility issue:
     The applied Android Gradle Plugin version (7.3.0) is lower than the minimum supported 7.3.1.

     Please update the Android Gradle Plugin version to at least 7.3.1.

* Try:
> Run with --stacktrace option to get the stack trace.
> Run with --info or --debug option to get more log output.
> Run with --scan to get full insights.

```

flutter webview package ထည့်တာက ဆက်တိုင်ပတ်။
ဟိုဟာမကိုက်ဘူး ဒီဟာ မကိုက်ဘူးနဲ့ 
တော်တော်ဆိုးပဲ။

သူ့ကို ဗားရှငိး ထပ်နှိမ့်မှ ထင်တယ်။

webview_flutter: ^4.0.7

လွန်ခဲ့တဲ့ နှစ်နှစ်လောက်အထိ ဆင်းရမယ်။

ရှိပြီးသား ကုတ်တွေတာင် အလုပ်လုပ်တော့
ကုတ်အသစ်ဆက်ရေးဖို့က ယုံကြည်မှု မရှိ။

- [ ] လိုတာေလးက ဘာမှ မရှိ။ ဘာရေးရေး မှားနေတာေလး တစ်ခုပဲ။
- [ ] စံသတ်မှတ်ချက်မရှိပဲ doc ဖတ်ပြီးရေး။ doc ဆိုတာကလည်း အချိန်တိုင်းပြောင်းနေတာ။
- [ ] picture upload စစ်ပြီးရင် တော်ပြီ။]


