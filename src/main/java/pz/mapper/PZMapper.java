package pz.mapper;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import pz.vo.PZVo;

@MapperScan
public interface PZMapper {

	int PZWrite(PZVo vo) throws Exception;

	List<PZVo> selectPZList(String addr) throws Exception;
	
	int deletePZ(String unq) throws Exception;
	
}
