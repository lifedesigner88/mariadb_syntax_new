오늘, 내일,  => DB + Redits

팀장 선정. 

화 
수
목 => WBS, 스크럼 - 지라.

PO
PM
PL


목, 빠르게 끝나면. 
금, 차주 월

월(오후에 발표)


관련자들 회의 => 10명, 

네트워크 엔지니어, 리눅스,
데이터 베이스, 개발자 2명 (차장, 강사님)

엔진x => 로드벨런서 프록시


클라이언트 -> 서버 (revers proxy)
서버 -> 클라이언트 (forward proxy)  VPN 아이피 유회.


master => 플라이머리, 메인
slaver => 레플리카, 세컨드리

재해복구 시스템. DR(Disaster Recovery)



// 3교시

    redis -> 리눅스 (윈도우 지원 안됨)
    도커 x

    HA > PROXY (대리인) , 로드밸런서 (라운드로빈)
    nginx(로드밸런서)


    DB 서버 구성 - HA 구성
    haproxy mysql 멀티 서버 구성에 많이 사용하는 프로그램. 



    mysql -u username -p -h 192.168.1.100 -P 3307
    -h = host 라는 뜻이다. 


// 교시

    redits / 




    list => 순서가 있고, 중복이 가능하다. 
    set => 순서가 없고, 중복이 없다. 
    zset => 순서를 어떤 기준으로 보장하고 싶을때. 


    해시함수. => 


Redis
https://www.redis.com


셰션, 한 번 로그인하면 서버에서 셰션을 받아서 인증값을 브라우저에서 가지고 있음. 
컴퓨터의 물리적 위치에 저장되어 있음. 


셰션() => 속도가 빠르기 때문에 id 검사하는데 쓰일 수 있다. 
토큰()



program > thread > 자바 멀티플. 
SPRING 은 thread 200 개 정도 지원한다. 



레딧은 싱글스레드

sudo apt-get update
sudo apt-get install -y redis-server
redis-server --version

redis-cli => 그냥 들어가면 0번

select 15 --> 

set key value nx ( 중복되는 경우 )
set key value ex 초단위 ( 세션 만료시간 )



 flushdb

 