## build-logic이란?
공통된 빌드 설정을 한 곳에 모아 플러그인 형태로 정의하고,
각 모듈에서 간단하게 재사용할 수 있도록 만든 구조

Android 프로젝트를 하나의 거대한 앱이 아니라 여러 개의 모듈로 쪼개어 관리할 때
각 모듈에서 반복되는 plugins, android {} 블록을 한 번에 통일시킬 수 있다.

## build-logic을 사용하는 이유
+ 반복되는 설정을 제거해 코드 간결하게 해준다.
+ 설정 일관성있게 유지해서 버그 감소시킨다
+  모듈 추가 시 빠르고 쉽게 설정 가능하다.
+ 빌드 스크립트 가독성 향상된다.
## 프로젝트 구조 예시
```bash
root/
├── build-logic/
│   └── convention/
│       ├── build.gradle.kts
│       └── src/main/java/com/school_of_company/convention/
│           ├── AndroidApplicationConventionPlugin.kt
│           ├── AndroidComposeConventionPlugin.kt
│           ├── AndroidCoreConventionPlugin.kt
│           ├── AndroidFeatureConventionPlugin.kt
│           ├── AndroidHiltConventionPlugin.kt
│           ├── AndroidLintConventionPlugin.kt
│           └── JvmLibraryConventionPlugin.kt
├── app/
├── core/
├── features/
└── settings.gradle.kts
```
## Convention Plugin 적용 방식
```
settings.gradle.kts

pluginManagement {
    includeBuild("build-logic")
}
모듈에서 사용
```

```
// 예: feature 모듈의 build.gradle.kts
plugins {
  id("com.school_of_company.convention.android.feature")
  id("com.school_of_company.convention.android.compose")
  id("com.school_of_company.convention.android.hilt")
}
```
## 주요 플러그인 설명
```
AndroidApplicationConventionPlugin
com.android.application 플러그인 적용

앱 모듈에 필요한 compileSdk, defaultConfig, viewBinding 등 기본 설정 포함
```
```
AndroidComposeConventionPlugin
Jetpack Compose 관련 설정 일괄 적용
```
```
AndroidFeatureConventionPlugin
기능(feature) 모듈을 위한 설정

보통 android-library, viewBinding 등 적용​
```
```
composeOptions {
    kotlinCompilerExtensionVersion = "1.4.3"
}
```
```
AndroidCoreConventionPlugin
공통 설정: Kotlin, Java version, warning 설정 등

모든 모듈에 적용 가능한 기본 설정들 포함
```
```
AndroidHiltConventionPlugin
DI 프레임워크 Hilt 설정 자동화

Hilt 플러그인 적용, 의존성 추가, kapt 설정 포함
dependencies {
    implementation("com.google.dagger:hilt-android:2.48")
    kapt("com.google.dagger:hilt-compiler:2.48")
}
```
```
AndroidLintConventionPlugin
Lint 설정 일괄 적용

빌드 품질 유지 및 자동 점검 목적
```
```
JvmLibraryConventionPlugin
순수 Kotlin(JVM) 라이브러리 모듈용

Java 버전 설정, kotlin("jvm") 플러그인 등 적용
```