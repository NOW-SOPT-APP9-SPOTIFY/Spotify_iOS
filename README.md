# Spotify_iOS
아요 레디~🫶 

## Member
| 이명진<br/>([@thingineeer](https://github.com/thingineeer)) | 김나연<br/>([@Nya128](https://github.com/Nya128)) | 김민성<br/>([@mminny](https://github.com/mminny)) |
| :---: | :---: | :---: |
| <img width="540" src=""/> | <img width="540" src=""/> | <img width="540" src=""/> |
<br>

> **Commit Message Rule**

`[Prefix] <#IssueNumber> - <Description>`

```
[Prefix]

[Feat] : 새로운 기능 구현
[Add] : 부수적인 코드 추가 및 라이브러리 추가, 새로운 파일 생성
[Chore] : 버전 코드 수정, 패키지 구조 변경, 타입 및 변수명 변경 등의 작은 작업, 파일 이름 변경
[Del] : 쓸모없는 코드나 파일 삭제
[Design] : UI 작업
[Fix] : 버그 및 오류 해결
[Refactor] : 전면 수정
[Docs] : README나 WIKI 등의 문서 개정
[Setting] : 프로젝트 세팅
[Comment] : 주석 추가, 삭제 (Only 주석)
```
ex) [Feat] #5 - 서버 연결 구현

---

> **Code Review Rule**

코드 리뷰를 최대한 빨리 달고 반영하자! (둥글둥글 말투로 해결하기)

ex) 이거 왜 이렇게 짰어요? (X)
     해당 기능을 구현한 이유가 궁금합니다 ‼️ (O)

---
> **Issue Naming Rule**

`[Prefix] <Description>`

ex) [Feat] - Spotify 블러처리 구현

---
> **Git Flow**

1. 이슈 생성
2. 브랜치 생성
3. 브랜치 add, commit, push → PR 과정 거치기
4. 최소 1명 "Approve" 있어야 merge (강제 머지 금지 하면 솝트 제명 ~~bypass~~)
5. 머지후 ( 해당 브랜치 바로 제거 )
6. pull 받아서 다음 이슈 진행
---
> **Git**

해결 어려운 Confilct 생기면 명진 에게 바로 연락하기 !!!

충돌 안나게 같은 파일 최대한 작업하지 않기

---
> **Foldering**

```
Spotify
├── AppDelegate.swift
├── SceneDelegate.swift
├── Network
│   ├── Base
│   │   ├── NetworkLoggingPlugin.swift
│   │   ├── NetworkResult
│   │   └── Config
│   ├── API
│   │   └── UserTargetType.swift
│   └── Service
│       └── UserService.swift
├── Data
│   ├── Auth
│   │   ├── AuthRequestModel.swift
│   │   └── AuthResponseModel.swift
├── Presentation
│   ├── Auth
│   │   ├── Views
│   │   └── ViewControllers
│   ├── Main
│   │   ├── Views
│   │   └── ViewControllers
│   └── Common
│       ├── Base
│       │   └── BaseView
│       └── CustomTextField
└── Global
    ├── Extension
    ├── Literals
    └── Resource

```




