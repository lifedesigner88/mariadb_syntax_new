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


git push --all origin 


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