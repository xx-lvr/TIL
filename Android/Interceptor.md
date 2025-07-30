## Interceptor
Interceptor는 클라이언트와 서버 사이에서 모든 HTTP 요청/응답을 가로채서 처리할 수 있는 중간층을 의미한다.

## Interceptor의 2가지
Application Interceptor : Application Code(우리가 작성한 코드) 와 OkHttp Core Library 사이에 추가된 Interceptor.
이런 Application Interceptor들은 addInterceptor()를 이용한다.
```
val client = OkHttpClient.Builder()
    .addInterceptor(AuthInterceptor(authTokenDataSource))
    .build()
Network Interceptor :OkHttp Core Library와 server 사이에 추가된 Interceptor
```
이런 Network Interceptor들은 addNetworkInterceptor()를 이용한다.
```kotlin
val client = OkHttpClient.Builder()
    .addNetworkInterceptor(AuthInterceptor(authTokenDataSource))
    .build()
```
## 장점
+ 요청/응답 관리 용이: Interceptor를 사용하면 모든 네트워크 요청을 한 곳에서 쉽게 관리할 수 있다.

+ 보안 강화: 인증 토큰 자동 추가, 요청 암호화 등 보안 관련 처리를 중앙에서 수행할 수 있다.

+ 디버깅 편의성: 로깅 Interceptor를 활용하면 API 요청과 응답을 손쉽게 확인할 수 있다.

+ 네트워크 성능 개선: 캐싱을 활용하여 네트워크 트래픽을 줄이고 앱의 응답 속도를 향상시킬 수 있다.

+ 코드 재사용성 증가: 공통적인 네트워크 로직을 분리하여 여러 API 호출에서 재사용할 수 있다.

## 예제
1. 인증 토큰 추가하기
네트워크 요청 시 매번 인증 토큰을 헤더에 추가해야 할 때 Interceptor를 사용할 수 있다.
```kotlin
class AuthInterceptor(private val authTokenDataSource: AuthTokenDataSource) : Interceptor {
    override fun intercept(chain: Interceptor.Chain): Response {
        val originalRequest = chain.request()
        val authenticatedRequest = originalRequest.newBuilder()
            .header("Authorization", "Bearer ${authTokenDataSource.getToken()}")
            .build()
        return chain.proceed(authenticatedRequest)
    }
}
```
2. 로깅 Interceptor 추가하기
네트워크 요청 및 응답을 로깅하여 디버깅에 활용할 수 있다.
```kotlin
val loggingInterceptor = HttpLoggingInterceptor().apply {
    level = HttpLoggingInterceptor.Level.BODY
}

val client = OkHttpClient.Builder()
    .addInterceptor(loggingInterceptor)
    .build()
```