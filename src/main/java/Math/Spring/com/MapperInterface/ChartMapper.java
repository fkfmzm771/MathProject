package Math.Spring.com.MapperInterface;


import Math.Spring.com.VO.GameStage;
import Math.Spring.com.VO.Student;
import Math.Spring.com.VO.GameScore;

import java.util.ArrayList;
import java.util.HashMap;

public interface ChartMapper {


    //학생 도넛츠 차트 검색
    GameStage selectDonutChart(Student student);

    //학생 챕터별 점수 로드
    HashMap<String, Object> selectChapterScore(String student_id);

    ArrayList<HashMap<String, Object>> selectClassGameScore();


}
