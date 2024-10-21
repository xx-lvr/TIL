## Domain Layer의 역할 수행
+ UI Layer와 Data Layer 사이에서 독립적으로 위치하여, 복잡한 비즈니스 로직이나 여러 ViewModel에서 재사용되는 간단한 비즈니스 로직의 캡슐화를 담당한다.
+ **중간 계층인 Domain Layer는 Data Layer를 의존할 것 같지만 Domain Layer는 어떤 계층에도 의존을 하지 않는다.**
+ Repository Interface를 Domain Layer에서 정의하기 때문에 Data Layer에 의존을 하지 않아도 된다. (의존성 역전 법칙)

## Domain Layer의 주요 구성 요소
+ **엔터티(Entity)** \
엔터티는 비즈니스 로직의 핵심 데이터를 나타냅니다. 예를 들어, 사용자, 상품, 주문 등이 엔터티에 해당할 수 있다. 
+ **유스케이스 (UseCase)** \
유스케이스는 애플리케이션에서 사용자가 수행할 수 있는 작업을 정의한다. 각 유스케이스는 특정 비즈니스 로직을 캡슐화하고, 사용자의 요청을 처리한 후 결과를 UI Layer에 전달한다.
+ **레포지토리 인터페이스 (Repository Interface)** \
Domain Layer는 Date Layer로부터 데이터를 요청하기 위해 레포지토리 인터페이스를 사용한다. 이 인터페이스를 통해, **Domain Layer는 Data Layer의 구체적인 구현에 의존하지 않고 데이터를 요청할 수 있습니다. 실제 구현은 데이터 레이어에서 담당합니다. (의존성 역전 법칙)**

## 엔터티 (Entity)
엔터티는 비즈니스 로직의 핵심 데이터를 표현하는 객체로, 애플리케이션의 도메인 모델을 구성하는 기본 단위. 엔터티는 비즈니스 도메인 내의 실제 세계 객체나 개념을 반영하며, 각 엔터티는 고유한 식별자와 함께 여러 속성을 가질 수 있다.

+ **역할** \
엔터티는 비즈니스 로직의 주체로, 비즈니스 규칙을 적용하고, 다른 엔터티와의 관계를 관리한다.
+ **예시** \
 사용자 엔터티는 이름, 이메일, 프로필 사진과 같은 속성을 가진다. 상품 엔터티는 상품명, 가격, 설명 등의 속성을 포함한다.

## 유스케이스 (UseCase)
유스케이스는 사용자가 시스템을 통해 수행할 수 있는 작업을 정의한 것으로, 특정 비즈니스 로직을 캡슐화한다. 각 유스케이스는 한 가지 기능적 요구사항을 만족시키는 작업을 수행하고, 결과를 반환한다.

**역할**\
유스케이스는 애플리케이션에서 사용자의 입력을 받아 처리하고, 적절한 출력을 생성합니다. 이 과정에서 필요한 데이터를 리포지토리로부터 요청하고, 비즈니스 규칙을 적용한다.\
**예시**\
"로그인하기", "상품 주문하기", "프로필 정보 업데이트하기" 등이 유스케이스가 될 수 있다.

구글은 공식적으로 UseCase 이름 지정 규칙을 아래와 같이소개하고 있다.

+ **현재 시제의 동사 + 명사/대상(선택사항) + UseCase**
+ **예시LogOutUserUseCase, GetLatestNewsWithAuthorsUseCase, MakeLoginRequestUseCase**

## 레포지토리 인터페이스 (Repository Interface)
레포지토리 인터페이스는 Domain Layer가 Data Layer로부터 필요한 데이터를 요청하는 방법을 정의한다. 이 인터페이스를 통해, **Domain Layer는 Data Layer의 구체적인 구현 방법을 몰라도 데이터를 요청하고 사용할 수 있다. 이는 SOLID 원칙 중 의존성 역전 원칙(Dependency Inversion Principle)의 적용 예다. Interface를 통해 추상화하지 않았다면 Domain Layer의 UseCase가 Data Layer의 Repository를 사용할 수 밖에 없다.** 이렇게 되면 Domain Layer는 Data Layer에 의존성이 생겨나게 된다. 하지만 Repository를 Interface로 갖고 있음으로써 의존이 생겨나지 않게 된다. 그래서 Domain Layer는 어떤 계층에도 의존하지 않을 수 있게 되는 겁니다.