## SOLID 원칙
SOLID원칙이란 객체지향에서 객체지향 설계에서 지켜줘야 할 5개의 소프트웨어 개발 원칙```( SRP, OCP, LSP, ISP, DIP )```을 말한다.
## Single Responsibility Principle(단일 책임 원칙)
+ 각 **클래스(객체)는 단 하나의 기능만 담당해야** 한다.
+  하나의 클래스는 하나의 기능 담당하여 하나의 책임을 수행하는데 집중되도록 클래스를 따로따로 여러개 설계하라는 원칙이다.
## 위반한 코드

```java
class OrderService {
    void placeOrder() {
        System.out.println("DB 저장");
        System.out.println("이메일 전송");
        System.out.println("영수증 출력");
    }
}
// 위반 이유: OrderService가 저장, 알림, 출력 등 여러 책임을 동시에 가짐
```
## 개선한 코드
```java
class OrderRepository { void save() { System.out.println("DB 저장"); } }
class Notifier { void notifyCustomer() { System.out.println("이메일 전송"); } }
class ReceiptPrinter { void print() { System.out.println("영수증 출력"); } }

class OrderService {
    private OrderRepository repo = new OrderRepository();
    private Notifier notifier = new Notifier();
    private ReceiptPrinter printer = new ReceiptPrinter();

    void placeOrder() {
        repo.save();
        notifier.notifyCustomer();
        printer.print();
    }
}
// 개선: 각 클래스가 단일 책임만 담당
```


## Open-Closed Priciple(개방 폐쇄 원칙)
+ 새로운 변경이 발생했을 때, **확장에 열려있어야 하며, 수정에는 닫혀있어야** 한다는 원칙이다.
+ 기능 추가 요청이 오면 **클래스를 확장을 통해 손쉽게 구현하면서, 확장에 따른 클래스 수정은 최소화** 하도록 프로그램을 작성해야 하는 설계 기법
## 위반한 코드
```java
class Discount {
    double apply(String type, double amount) {
        if(type.equals("VIP")) return amount * 0.9;
        else return amount;
    }
}
// 위반 이유: 새로운 할인 정책이 생기면 기존 클래스 수정 필요
```
## 개선한 코드
```java
interface DiscountPolicy { double apply(double amount); }
class VipDiscount implements DiscountPolicy { public double apply(double amount){ return amount*0.9; } }
class NoDiscount implements DiscountPolicy { public double apply(double amount){ return amount; } }
// 개선: 새로운 할인 정책 추가 시 기존 코드를 수정할 필요 없음
```
## Liskov Substitution Principle(리스코브 치환 원칙)
+ 서브 타입은 언제나 기반(부모) 타입으로 교체할 수 있어야 한다는 원칙이다.
+ 다형성 원리를 이용하기 위한 원칙 개념으로 보면 된다.
## 위반한 코드
```java
class Bird { void fly() { System.out.println("날아간다"); } }
class Penguin extends Bird { 
    void fly() { throw new RuntimeException("펭귄은 못 날아요"); } 
}
// 위반 이유: 부모 타입으로 대체 시 예외 발생 → LSP 위반
```
## 개선한 코드
```java
interface Bird {}
interface FlyingBird extends Bird { void fly(); }

class Sparrow implements FlyingBird { public void fly(){ System.out.println("날아간다"); } }
class Penguin implements Bird { void swim(){ System.out.println("수영한다"); } }
// 개선: 날 수 있는 새와 없는 새를 인터페이스로 분리
```
## Interface Segregation Principle(인터페이스 분리 원칙)
+ 인터페이스를 각각 사용에 맞게 끔 잘게 분리
+ 큰 규모의 인터페이스는 작은 규모의 인터페이스 여러개로 분활해야 한다.
## 위반한 코드
```java
interface Worker {
    void work();
    void eat();
}
class Robot implements Worker {
    public void work() { System.out.println("로봇 일"); }
    public void eat() { System.out.println("로봇은 안먹음"); } 
}
// 위반 이유: Robot에 필요 없는 eat() 메서드 강제 구현
```
## 개선한 코드
```java
interface Workable { void work(); }
interface Eatable { void eat(); }

class Human implements Workable, Eatable {
    public void work() { System.out.println("사람 일"); }
    public void eat() { System.out.println("사람 먹음"); }
}

class Robot implements Workable {
    public void work() { System.out.println("로봇 일"); }
}
// 개선: 필요한 인터페이스만 구현
```
## Dependency Inversion Principle(의존성 역전 원칙)
+ 어떤 Class를 참조해서 사용해야하는 상황이 생긴다면, 그 Class를 직접 참조하는 것이 아니라 **그 대상의 상위 요소(추상 클래스 or 인터페이스)로 참조**하라는 것이다.
## 위반한 코드
```java
class MySQLDatabase {
    void save(String data){ System.out.println("MySQL 저장"); }
}
class DataService {
    private MySQLDatabase db = new MySQLDatabase();
    void save(String data){ db.save(data); }
}
// 위반 이유: DataService가 구체 클래스(MySQLDatabase)에 직접 의존
```
## 개선한 코드
```java
interface Database { void save(String data); }
class MySQLDatabase implements Database { public void save(String data){ System.out.println("MySQL 저장"); } }

class DataService {
    private Database db;
    public DataService(Database db){ this.db = db; }
    void save(String data){ db.save(data); }
}
// 개선: DataService가 인터페이스(Database)에 의존 → DIP 준수
```