package kimbab;

import java.util.ArrayList;
import java.util.List;

public class KimbabDAO {

	// 데이터 저장소를 리스트로 받기!
	private ArrayList<KimbabDTO> list = new ArrayList<>();
	
	// 프로그램 기능들
	
	// 1. 목록
	public List<KimbabDTO> selectList() {
		return list;
	}
	
	// 2. 단일조회
	public KimbabDTO selectOne(int idx) {
		for(KimbabDTO dto : list) {
			if(dto.getIdx() == idx) {
				return dto;
			}
		}
		return null;
	}
	
	// 3. 추가
	public int insert(KimbabDTO dto) {
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
	// 5. 추가 후, 마지막으로 추가된 객체의 idx가 몇번인지 확인하는 기능
	public int currval() {
		return KimbabDTO.getSeq();
	}
	
	
	
}
