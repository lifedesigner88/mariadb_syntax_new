k8s => (Kubernetes)



방법 1 
git clone repository [주소]
해당 폴더로 이동하여 개발시작

로컬 컴퓨터에서 이미 개발된 프로젝트가 존재시
git init

    .git 파일 생성
    .git 폴더가 위치한 곳에서 git config --list 통해 컨피그 정보 조회

git remote add origin [repository]

git remote set-url origin

git remote remove origin


git push --all





git remote -b main

git config --global user.name "kimseonguk187"
git config --global user.email "lifedesigner@gamil.com"
홈 디렉토리

git config --local 
git/config 에 저장. 

git status 

git config --system
git config --global
git config --local


git commit -am "메시지"

git push origin main 
pull dms working derectory 까지 반영. 


git checkout .      // 파일의 수정사항을 취소
git clean -fdx      // 파일을 신규추가 한 경우의 취소 
git checkout . && git clean -fdx
개발툴(intellij, vscode 등) 사용시 쉽게 수정사항 취소 가능. 



working


git checkout . | git clean -fdx



// staged 취소
git restore --staged . 




commit 취소
git reset HEAD~1  (또는 HEAD^)
    unstaged                                                                                                                                                                                              
git reset --soft head~1
    statged 상태유지



push 후 origin 까지 배포된 사항 취소 
    git revert 커밋 ID
    특정 커밋 버전을 취소시키는 새로운 commit을 생성 후에 다시 push



git diff
git diff commit1 commit2

git diff main origin/main

git fetch origin main

git reset head^ 
git reset --soft head^

FETCH_HEAD => git_fetch 명령어를 마지막으로 실행 했을 때 
원격 저장소에서 가져온 브랜치의 최신 커밋을 가리키는 참조.


git merge fetch_head


