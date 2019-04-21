package Math.Spring.com.DAO;

import Math.Spring.com.MapperInterface.ChartMapper;
import Math.Spring.com.VO.GameScore;
import Math.Spring.com.VO.GameStage;
import Math.Spring.com.VO.Student;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;


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

    //학생 챕터별 별 갯수 로드
    public GameScore selectChapterScore(Student student) {

        ChartMapper mapper = session.getMapper(ChartMapper.class);
        GameScore GameScore = mapper.selectChapterScore(student);

        return GameScore;
    }




    public ArrayList<GameScore> selectClassGameScore() {

        ChartMapper mapper = session.getMapper(ChartMapper.class);
        ArrayList<GameScore> list = mapper.selectClassGameScore();
        if (list.size() == 0){
            System.out.println("비어있넹");
        }
        return list;
    }



}







