git clone repository


git init

git remove add origin [origin]




git push --all 
- 모든 브랜치의 커밋 이력 push

main <- dev 합친다. 





git stash list
    - 작업저장목록

git stash show 인덱스
    - 복사본 내용 조회
    - 상세본 git stash show 0 -p

git stash pop
    - 작업목록에서 제거하면서 저장사항 적용

git stash apply
    - 작업목록에서 놔둔채 저장사항 적용
    - git stash apply 0
        * 가장 최근에 저장한 stash의 적용


git stash clear





1.03

major . minor  fetch

git tag v1.01
git push origin v1.01   



실제 현업에선 branch1, branch2, main 등 여러 브랜치로 관리

produticon main / dev 개발용. 


Pull Request 를 통해 dev merge
dev에서 main 으로 최종 merge



git fetch origin
git branch
git branch 특정 브랜치명
git checkout 브랜치명

git checkout -b         // 새 브랜치를 생성하고 해당 브랜치로 전환


git branch -D 브랜치명 : 로컬 브랜치 삭제
git push origin -D

git remote prune origin
