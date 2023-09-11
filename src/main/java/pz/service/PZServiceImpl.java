package pz.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import pz.mapper.PZMapper;
import pz.vo.CafePZVo;
import pz.vo.CafeVo;
import pz.vo.PZVo;

@Service
@Slf4j
public class PZServiceImpl implements PZService {

	@Autowired
	PZMapper pzMapper;

	@Override
	public boolean PZWrite(PZVo vo) throws Exception {
		boolean result = false;
		
		MultipartFile file = vo.getPhoto();
		
		String fileOriginalName = file.getOriginalFilename();
		UUID uuid = UUID.randomUUID();
		
		vo.setPhotopath(uuid + "_" + fileOriginalName);
		
		File saveFile = new File("C:\\eGovFrameDev-4.0.0-64bit\\workspace\\pz-1.0.0-lky\\src\\main\\webapp\\resources\\image\\"+vo.getPhotopath());
		
		int mapperResult = pzMapper.PZWrite(vo);
		log.info("mapperResult: {}", mapperResult);
		
		if(mapperResult == 1) {
			try {
				file.transferTo(saveFile);
				result = true;
			} catch(IllegalStateException e) {
				e.printStackTrace();
			} catch(IOException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}


	@Override
	public List<PZVo> selectPZList(String addr) throws Exception {
		List<PZVo> PZLists = pzMapper.selectPZList(addr);
		 
		System.out.println("ServiceImpl::::::::::::"+ PZLists); 
		return PZLists; 
	}


	@Override
	public boolean deletePZ(String unq) throws Exception {
		int mapperResult = pzMapper.deletePZ(unq);
		if(mapperResult == 1) return true;
		return false;
	}
	
	
}
