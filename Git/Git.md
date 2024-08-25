## Git
개발자의 코드를 효율적으로 관리하기 위해서 개발된 분산 버전 관리 시스템 (DVCS) 이다.

## Git의 장점
1. 깃(Git)은 인터넷이 연결이 되지 않은 곳에서도 개발을 진행할 수 있고, 분산 버전 관리이기 때문에 중앙 저장소가 삭제되어도 원상복구가 가능하다.

2. 각각의 개발자들이 Branch 를 사용하여 개발을 진행한 뒤, 본 프로그램에서 합치는 merge 방식을 통하여 병렬 개발이 가능하다.


## Github
Git 은 소스 코드 기록을 관리하고 추적할 수 있는 버전 관리 시스템이라면 Github 는 Git Repository를 관리할 수 있는 클라우드 기반 서비스다.

## Github와 Git의 차이점
Git: 분산형 버전 관리 시스템으로, 로컬에서 코드의 버전 관리와 기록을 담당합니다.\
GitHub: Git 리포지토리를 호스팅하는 플랫폼으로, 협업, 코드 리뷰, 이슈 트래킹 등 다양한 기능을 제공합니다.

## Git Repository
Git Repository 는 저장소. 즉, 말 그대로 폴더를 저장해두는 곳이다.\
Remote Repository : 나의 PC에 저장되는 개인 전용 저장소\
Local Repository : 원격 저장소 전용 서버에 저장되는 저장소
+ 작업할 때는 Local Repository 에서 할 수 있고, 내가 작업한 코드를 공유하려면 Remote Repository 에 업로드하여 여러 사람이 함께 공유할 수 있다.

+ 다른 사람이 Remote Repository 에 올려놓은 소스 코드를 내 Local Repository 로 가지고 올 수 있다.

## Git의 기본 명령어
```git init: 새로운 Git 리포지토리를 생성합니다.```\
```git clone <repository-url>: 원격 리포지토리를 로컬로 복제합니다.```\
```git add <file>: 변경된 파일을 스테이징합니다.```\
```git commit -m "message": 스테이지된 변경 사항을 커밋합니다.```\
```git push: 로컬 커밋을 원격 리포지토리에 푸시합니다.```\
```git pull: 원격 리포지토리의 변경 사항을 로컬로 가져옵니다.```\
```git status: 현재 작업 디렉토리의 상태를 확인합니다.```\
```git log: 커밋 히스토리를 확인합니다.```

## Branch
#### Repository(저장소)의 공간에서 독립적으로 어떤 작업을 하기 위한 공간을 만든다.

## Branch 관련 명령어들
```git branch: 현재 브랜치 목록을 확인합니다.```\
```git checkout <branch>: 다른 브랜치로 전환합니다.```\
```git merge <branch>: 현재 브랜치에 다른 브랜치를 병합합니다.```\
```git branch -d <branch>: 브랜치를 삭제합니다.```

## Git 원격 저장소
origin이란?: origin은 기본적으로 원격 저장소의 기본 이름으로, 보통 git clone을 통해 복제한 원격 저장소의 이름이 됩니다. 여러 개의 원격 저장소를 관리할 수 있으며, origin은 그 중 하나에 불과합니다.\
git remote add origin <url>: 로컬 리포지토리에 원격 저장소를 추가하고 이름을 origin으로 지정합니다. 이는 협업 시 원격으로 코드를 푸시하거나 풀하기 위해 필요합니다.\
git remote -v: 현재 로컬 리포지토리에 연결된 원격 저장소 목록을 확인할 수 있습니다.\
git remote set-url origin <new-url>: 기존 origin의 URL을 새 URL로 변경할 수 있습니다.
## 원격과의 동기화
git fetch: 원격 저장소의 변경 사항을 로컬로 가져오지만, 자동으로 병합하지는 않습니다. 로컬 브랜치와 원격 브랜치의 상태를 동기화하는 데 유용합니다.\
git pull origin <branch>: 원격 저장소의 지정된 브랜치에서 변경 사항을 가져와 현재 로컬 브랜치에 병합합니다.\
git push origin <branch>: 로컬 브랜치의 변경 사항을 원격 저장소의 지정된 브랜치에 푸시합니다.\
Tracking Branch: 로컬 브랜치가 원격 브랜치와 연결되어 있는 경우, git push와 git pull 명령어를 사용할 때 별도로 브랜치를 지정하지 않아도 기본적으로 연결된 원격 브랜치로 동작합니다.

## 저장소에서 코드 가져오는 법
+ origin에서 가져오는 법은 git pull origin master
+ 원격 저장소에서 코드 가져오는 법은 git clone(url)(저장할 폴더 이름)
+ 원격에서 로컬로 가져오는 법은 git fetch origin
+ 병합하는건 git checkout master, git merge (브랜치명)
+ 특정 브랜치를 다른 브랜치의 코드로 대체는 git checkout (바뀔 브랜치), git reset --hard(타깃 브랜치)

## vscode에서 github에 올리는 방법
+ ```git을 설치하기```
+ ```설치 후 터미널에서 git--version```//입력하여 설치가 제대로 되었는지 확인
+ ```github에 Repository를 생성하기```
+ ```git init``` // 현재 디렉토리를 Git 저장소로 초기화
+ ```git remote add origin https://github.com/사용자명/저장소명.git``` // 복사한 GitHub Repository URL을 사용하여 원격 저장소를 로컬 저장소와 연결합니다.
+ ```git add or git add.```(git add 파일명 -> 해당 파일만 저장, git add. 현재 폴더에 있는 모든 파일을 저장)
+ ```git commit -m '메시지'``` // 변경 사항을 로컬 저장소에 커밋합니다. 커밋 메시지는 현재 변경 사항을 설명하는 것이 좋습니다
+ ```git push -u origin main``` //로컬 저장소의 커밋된 내용을 원격 저장소(GitHub)에 업로드합니다.
+ ```git push -u origin master```//이건 기본 브랜치가 master인 경우에 아니면 main 쓰면 된다.