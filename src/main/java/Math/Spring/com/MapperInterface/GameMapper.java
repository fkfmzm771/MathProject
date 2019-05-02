package Math.Spring.com.MapperInterface;


import Math.Spring.com.VO.GameCard;
import Math.Spring.com.VO.GameScore;
import Math.Spring.com.VO.GameStage;
import Math.Spring.com.VO.Student;

import java.util.ArrayList;

public interface GameMapper {


    //유저 스테이지 정보
    GameStage selectGameStage(Student student);

    //유저 게임 스코어 정보
    GameScore selectGameScore(Student student);

    //유저 A랭크 보유 카드 정보
    GameCard selectA_Card(Student student);


    //로그인 학생여부 체크
    Student GameStudentSelectOne(String userid);



}
