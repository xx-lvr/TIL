## Git
개발자의 코드를 효율적으로 관리하기 위해서 개발된 분산 버전 관리 시스템 (DVCS) 이다.

## Git의 장점
1. 깃(Git)은 인터넷이 연결이 되지 않은 곳에서도 개발을 진행할 수 있고, 분산 버전 관리이기 때문에 중앙 저장소가 삭제되어도 원상복구가 가능하다.

2. 각각의 개발자들이 Branch 를 사용하여 개발을 진행한 뒤, 본 프로그램에서 합치는 merge 방식을 통하여 병렬 개발이 가능하다.


## Github
Git 은 소스 코드 기록을 관리하고 추적할 수 있는 버전 관리 시스템이라면 Github 는 Git Repository를 관리할 수 있는 클라우드 기반 서비스다.

## Github와 Git의 차이점
**Git**: 분산형 버전 관리 시스템으로, 로컬에서 코드의 버전 관리와 기록을 담당합니다.\
**GitHub**: Git 리포지토리를 호스팅하는 플랫폼으로, 협업, 코드 리뷰, 이슈 트래킹 등 다양한 기능을 제공합니다.

## Git Repository
**Git Repository** 는 저장소. 즉, 말 그대로 폴더를 저장해두는 곳이다.\
**Remote Repository** : 나의 PC에 저장되는 개인 전용 저장소\
**Local Repository** : 원격 저장소 전용 서버에 저장되는 저장소
+ 작업할 때는 **Local Repository** 에서 할 수 있고, 내가 작업한 코드를 공유하려면 **Remote Repository** 에 업로드하여 여러 사람이 함께 공유할 수 있다.

+ 다른 사람이 Remote Repository 에 올려놓은 소스 코드를 내 Local Repository 로 가지고 올 수 있다.

## Git의 기본 명령어
```bash
git init: 새로운 Git 리포지토리를 생성합니다.
git clone <repository-url>: 원격 리포지토리를 로컬로 복제합니다.
git add <file>: 변경된 파일을 스테이징합니다.
git commit -m "message": 스테이지된 변경 사항을 커밋합니다.
git push: 로컬 커밋을 원격 리포지토리에 푸시합니다.
git pull: 원격 리포지토리의 변경 사항을 로컬로 가져옵니다.
git status: 현재 작업 디렉토리의 상태를 확인합니다.
git log: 커밋 히스토리를 확인합니다.
```

## Branch
#### Repository(저장소)의 공간에서 독립적으로 어떤 작업을 하기 위한 공간을 만든다.

## Git Branch 관련 명령어
```bash
새 브랜치 생성 : git branch <branch-name>
새 브랜치 생성 및 이동 : git checkout -b <branch-name>
브랜치 삭제 : git branch -d <branch-name>
원격 브랜치 삭제 : git push origin --delete <branch-name>
브랜치 전환 : git checkout <branch-name>
브랜치 병합 : git merge <branch-name>
브랜치 상태 확인 : git status
브랜치 변경 사항 확인 : git diff <branch-name>
브랜치 이름 변경 : git branch -m <old-branch-name> <new-branch-name>
원격 브랜치 가져오기 : git fetch origin <branch-name>
원격 브랜치와 로컬 브랜치 동기화 : git pull origin <branch-name>
```
## Git 원격 저장소
```bash
현재 로컬 저장소에 연결된 원격 저장소의 이름만을 나열합니다.
git remote
현재 로컬 저장소에 연결된 원격 저장소 목록을 보여줍니다.
git remote -v
원격 저장소의 URL을 포함하여 자세한 정보를 보여줍니다.
git remote add <name> <url>
새 원격 저장소를 추가합니다. <name>은 원격 저장소의 이름(일반적으로 origin 사용), <url>은 원격 저장소의 URL입니다.
git remote remove <name>
기존 원격 저장소를 제거합니다.
git remote rename <old-name> <new-name>
원격 저장소의 이름을 변경합니다.
git push <remote> <branch>
로컬 브랜치의 변경 사항을 지정된 원격 저장소의 브랜치에 푸시합니다.
git fetch <remote>
지정된 원격 저장소에서 최신 변경 사항을 가져옵니다. 병합은 하지 않습니다.
git pull <remote> <branch>
지정된 원격 저장소의 브랜치에서 변경 사항을 가져와 현재 로컬 브랜치에 병합합니다.
git clone <url>
```
## 원격과의 동기화
```bash
1. git pull: 현재 작업 중인 브랜치와 원격 저장소의 동일한 브랜치를 동기화합니다. 원격 저장소의 변경 사항을 가져와 자동으로 병합합니다.
2. git fetch: 원격 저장소의 모든 브랜치에서 최신 변경 사항을 가져옵니다. 병합은 하지 않으며, 변경 사항은 로컬의 FETCH_HEAD에 저장됩니다.
3. git pull origin <branch-name>: 원격 저장소의 <branch-name> 브랜치에서 변경 사항을 가져와 현재 브랜치에 병합합니다.
```
## 저장소에서 코드 가져오는 법
```bash
원격 저장소에서 코드 가져오기 (동기화) : git pull origin <branch-name>
원격 저장소에서 코드만 가져오기 (병합하지 않음) : git fetch origin <branch-name>
원격 저장소에서 모든 브랜치의 코드 가져오기 (병합하지 않음) : git fetch
현재 작업 중인 브랜치와 원격 브랜치 동기화 : git pull
원격 저장소에서 최신 코드로 로컬 브랜치 강제 업데이트 : git reset --hard origin/<branch-name>
```

## vscode에서 github에 올리는 방법
```bash
 git을 설치하기 설치 후 터미널에서 git--version//입력하여 설치가 제대로 되었는지 확인
 github에 Repository를 생성하기
 git init // 현재 디렉토리를 Git 저장소로 초기화
 git remote add origin https://github.com/사용자명/저장소명.git // 복사한 GitHub Repository URL을 사용하여 원격 저장소를 로컬 저장소와 연결합니다.
 git add or git add.(git add 파일명 -> 해당 파일만 저장, git add. 현재 폴더에 있는 모든 파일을 저장)
 git commit -m '메시지'  // 변경 사항을 로컬 저장소에 커밋합니다. 커밋 메시지는 현재 변경 사항을 설명하는 것이 좋습니다
 git push -u origin main  //로컬 저장소의 커밋된 내용을 원격 저장소(GitHub)에 업로드합니다.
 git push -u origin master  //이건 기본 브랜치가 master인 경우에 아니면 main 쓰면 된다.
 ```