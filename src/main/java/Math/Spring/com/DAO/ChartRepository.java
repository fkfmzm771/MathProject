package Math.Spring.com.DAO;

import Math.Spring.com.MapperInterface.ChartMapper;
import Math.Spring.com.VO.GameScore;
import Math.Spring.com.VO.GameStage;
import Math.Spring.com.VO.Student;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;


@Repository
public class ChartRepository {
    @Autowired
    SqlSession session;

    // 학생 도넛츠 차트 검색
    public GameStage selectDonutChart(Student student) {
        ChartMapper mapper = session.getMapper(ChartMapper.class);
        GameStage doughnut = mapper.selectDonutChart(student);
        return doughnut;
    }

    //학생 챕터별 점수 로드
    public HashMap<String, Object> selectChapterScore(String student_id) {

        ChartMapper mapper = session.getMapper(ChartMapper.class);
        HashMap<String, Object> GameScore = mapper.selectChapterScore(student_id);

        return GameScore;
    }



    //전체 학생 챕터별 점수 로드
    public ArrayList<HashMap<String, Object>> selectClassGameScore() {

        ChartMapper mapper = session.getMapper(ChartMapper.class);
        ArrayList<HashMap<String, Object>> list = mapper.selectClassGameScore();
        if (list.size() == 0){
            System.out.println("비어있넹");
        }
        return list;
    }



}







