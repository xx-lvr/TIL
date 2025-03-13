## AAC(Android Archietecture Components)
안드로이드에서 JetPack은 기존에 구글에서 제공하던 서포트 라이브러리와 아키텍처 컴포넌트를 모아 놓은 것

## MVVM의Viewmodel의 차이
AAC(Android Architecture Component) ViewModel은 Activity 내에서 1개만 생성가능하다. 따라서 AAC ViewModel은 Activity안에서의 싱글톤 개념이기 때문에 Activity 내의 여러 Fragment를 가질시에 여러 Fragment에 각자의 ViewModel을 사용할 수 없습니다. 실제로 liveData 와 함께 사용할 때, 옵저빙이 되지 않는 것을 확인.
반면, MVVM 패턴에서 뷰와 뷰모델은 1:n 관계를 가질 수 있다.