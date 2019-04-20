package Math.Spring.com.MapperInterface;


import Math.Spring.com.VO.GameChapter;
import Math.Spring.com.VO.Student;
import Math.Spring.com.VO.GameScore;

import java.util.ArrayList;

public interface ChartMapper {


    //학생 도넛츠 차트 검색
	GameChapter selectDonutChart(Student student);

    //학생 챕터별 별 갯수 로드
    GameScore selectChapterScore(Student student);



    ArrayList<GameScore> selectClassGameScore();


}
