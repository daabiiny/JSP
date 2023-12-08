package singer;

import java.util.ArrayList;
import java.util.List;

public class SingerDAO {

	// 일단, 데이터 저장소를 리스트로 받아!
	private ArrayList<SingerDTO> list = new ArrayList<>();
	
	// 프로그램 주요 기능 함수덜
	// 1. 목록
	public List<SingerDTO> selectList() {
		return list;
	}
	
	// 2. 단일조회
	public SingerDTO selectOne(int idx) {
		for(SingerDTO dto : list) {
			if(dto.getIdx() == idx) {
				return dto;
			}
		}
		return null;
	}
	
	// 3. 추가
	public int insert(SingerDTO dto) {
		int row;
		row = list.add(dto) ? 1 : 0;
		return row;
	}
	
	// 4. 삭제
	public int delete(int idx) {
		int row;
		row = list.removeIf(dto -> dto.getIdx() == idx) ? 1 : 0;
		return row;
	}
	
	// 5. 추가한 이후 마지막으로 추가된 객체의 idx가 몇번인지 확인 기능
	public int currval() {
		return SingerDTO.getSeq();
	}
	
}
