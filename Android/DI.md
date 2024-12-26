## DI
DI는 Dependency Injection ```(의존성 주입)``` 의 약어

## 의존성 주입
 외부에서 의존 객체를 생성하여 넘겨주는 것을 의미한다.

## DI Framework 
DI를 구현하기 위해서는 객체를 생성하고 넘겨주는 외부 역할

+ DI Framework를 스프링에서는 컨테이너, Dagger에서는 Component와 Module이라 명칭
+ 즉, DI는 외부(IoC 컨테이너)에서 객체를 생성한 후 생성된 객체를 다른 객체에 주입하는 방식

외부에서 생성된 객체들을 한번에 관리 할 수 있다는 장점이 존재합니다

+ DI는 이렇게 의존성이 있는 객체의 제어(생성)을 외부 Framework가 담당하면서 ```IoC개념```을 구현

## IoC
```Inversion of Control```, 제어의 역전

DI는 의존성이 있는 객체의 제어(생성)을 외부 Framework가 담당하면서 IoC개념을 구현

-> IoC는 제어가 거꾸로 가는 개념을 의미, 쉽게 말해 외부 컨테이너가 객체를 생성 - 주입하는 경우

-> IoC 컨테이너에서 객체를 생성한 후 생성된 객체를 다른 객체에 주입하는 것을 의미

즉, **DI**는 **IoC**를 구현하는 방법 중의 하나!

## DI가 필요한 이유
1. Boilerplate Code를 줄일 수 있다

: 의존성 파라미터를 생성자에 작성하지 않고 주입하면서 Boilerplate Code를 줄여 유연한 프로그래밍 가능

2. Interface에 구현체를 쉽게 교체하면서 상황에 따라 적절하게 행동을 정의 가능

: 유닛 테스트 시 간결한 구현을 가능하게 만들어 준다.