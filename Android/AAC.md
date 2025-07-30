## AAC(Android Archietecture Components)
AAC(Android Architecture Components)는 jetpack에서 Architecture에 해당하는 부분으로 테스트와 유지보수가 쉬운 안드로이드 앱을 디자인할 수 있도록 돕는 라이브러리 모음이다.

AAC를 활용하면 현재 구글에서 권장하는 MVVM 구조로 앱 설계가 가능해진다.

## MVVM의Viewmodel의 차이
AAC(Android Architecture Component) ViewModel은 Activity 내에서 1개만 생성가능하다. 따라서 AAC ViewModel은 Activity안에서의 싱글톤 개념이기 때문에 Activity 내의 여러 Fragment를 가질시에 여러 Fragment에 각자의 ViewModel을 사용할 수 없습니다. 실제로 liveData 와 함께 사용할 때, 옵저빙이 되지 않는 것을 확인.
반면, MVVM 패턴에서 뷰와 뷰모델은 1:n 관계를 가질 수 있다.

## AAC를 활용해서 MVVM 을 어떻게?
### Activity / Fragment
+ 눈에 보이는 UI 즉, View에 해당되며 대부분이 Activity와 Fragment로 이루어져 있다. UI와 관련된 프레젠테이션 로직을 작성한다.

### ViewModel
+ ViewModel에 해당되며, View가 요청한 데이터를 Model로 요청하고 받아오는 역할을 하며 이와 관련된 비즈니스 로직을 작성한다.

+ 하나의 View에 하나의 ViewModel을 사용한다. 
+ MVVM의 ViewModel의 역할을 하기위해서 AAC에서 제공하는 ViewModel을 사용하는 것이다.

### LiveData
+ 살아있는 데이터로 ViewModel에서 View에게 일관성있는 데이터를 제공하기 위해 사용한다.
+ Activity나 Fragment에서 이를 옵저빙해 변화를 감지해 특정 동작을 수행할 수 있다.

### DataBinding
+ XML에서 ViewModel의 LiveData를 바인딩하여 관찰하고, 데이터 변화에 따른 UI 동작을 가능케한다.

### Repository
+ ViewModel에서 요청한 데이터를 내부 데이터베이스(room)에서 불러오거나, 외부 서버가 있다면 통신(retrofit)을 통해 데이터를 불러오고 불러온 데이터를 저장하고 가공해서 ViewModel에게 전달한다.

이로써 ViewModel에서는 데이터를 저장하고 관리할 필요가 없어지게 된다.
repository에서 저장하고 있는 데이터나 통신의 DTO가 일종의 Model이라고 생각이 된다.