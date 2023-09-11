package pz.service;

import java.util.List;
import java.util.Map;

import pz.vo.CafePZVo;

public interface CafePZService {

	boolean cafePZWrite(CafePZVo vo) throws Exception;
	
	List<CafePZVo> selectCafePZList(String addr) throws Exception;

	boolean deleteCafePZ(String unq) throws Exception;
	
}
