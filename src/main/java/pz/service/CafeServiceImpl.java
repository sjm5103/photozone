package pz.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import pz.mapper.CafeMapper;
import pz.vo.CafeMenuVo;
import pz.vo.CafePZVo;
import pz.vo.CafeVo;

@Service
@Slf4j
public class CafeServiceImpl implements CafeService {

	@Autowired
	CafeMapper cafeMapper;
	
	@Override
	public boolean signup(CafeVo vo) throws Exception {
		boolean result = false;
		
		String phone = vo.getPhoneNumber1()+"-"+vo.getPhoneNumber2()+"-"+vo.getPhoneNumber3();
        vo.setPhone(phone);
		
		MultipartFile file = vo.getPhoto();
		MultipartFile file2 = vo.getCertify();
		
		String fileOriginalName = file.getOriginalFilename();
		String fileOriginalName2 = file2.getOriginalFilename();
		UUID uuid = UUID.randomUUID();
		
		vo.setPhotopath(uuid + "_" + fileOriginalName);
		vo.setCertifypath(uuid + "_" + fileOriginalName2);
		
		File saveFile = new File("C:\\eGovFrameDev-4.0.0-64bit\\workspace\\pz-1.0.0-lky\\src\\main\\webapp\\resources\\image\\"+vo.getPhotopath());
		File saveFile2 = new File("C:\\eGovFrameDev-4.0.0-64bit\\workspace\\pz-1.0.0-lky\\src\\main\\webapp\\resources\\image\\"+vo.getCertifypath());
		
		int mapperResult = cafeMapper.signup(vo);
		log.info("mapperResult: {}", mapperResult);
		
		if(mapperResult == 1) {
			try {
				file.transferTo(saveFile);
				file2.transferTo(saveFile2);
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
	public CafeVo login(String cafeid, String pwd) throws Exception {
		return cafeMapper.login(cafeid, pwd);
	}

	@Override
	public CafeVo sessionLogin(String cafeid) throws Exception {
		CafeVo vo = cafeMapper.sessionLogin(cafeid);
		
		String[] phoneSplit = vo.getPhone().split("-");
		vo.setPhoneNumber1(phoneSplit[0]);
		vo.setPhoneNumber2(phoneSplit[1]);
		vo.setPhoneNumber3(phoneSplit[2]);
		
		return vo;
	}
	
	@Override
	public int updateCafe(CafeVo vo) throws Exception {
		int result = 0;
		
		CafeVo sessionVo = sessionLogin(vo.getCafeid());
		log.info("sessionVo: {}", sessionVo);
		if(!vo.getPwd().equals(sessionVo.getPwd())) {
			log.info("비밀번호 불일치: {}", 2);
			return 2;
		}
		
		String phone = vo.getPhoneNumber1()+"-"+vo.getPhoneNumber2()+"-"+vo.getPhoneNumber3();
		vo.setPhone(phone);
		
		if(vo.getChangePwd().isBlank()) {
			vo.setChangePwd(vo.getPwd());
		}
		
		result = cafeMapper.updateCafe(vo);
		
		return result;
	}

	@Override
	public boolean idCheck(String cafeid) throws Exception {
		boolean result = false;
		int mapperResult = cafeMapper.idCheck(cafeid);
		
		if(mapperResult == 0) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean cafenameCheck(String cafename) throws Exception {
		boolean result = false;
		int mapperResult = cafeMapper.cafenameCheck(cafename);
		
		if(mapperResult == 0) {
			result = true;
		}
		
		return result;
	}
	
	//카페정보 승인
	@Override
	public int approveCafe(String cafeid) throws Exception {
		int result = 0;
		
		result = cafeMapper.approveCafe(cafeid);
		
		return result;
	}
	//카페정보 거절
	@Override
	public int rejectCafe(String cafeid) throws Exception {
		int result = 0;
		
		result = cafeMapper.rejectCafe(cafeid);
		
		return result;
	}
	//카페정보 상세보기
	@Override
	public CafeVo getCafeInfoById(String cafeid) throws Exception {
		
		CafeVo vo = cafeMapper.getCafeInfoById(cafeid);
		
		String[] phoneSplit = vo.getPhone().split("-");
	        vo.setPhoneNumber1(phoneSplit[0]);
	        vo.setPhoneNumber2(phoneSplit[1]);
	        vo.setPhoneNumber3(phoneSplit[2]);
		
		System.out.println(vo);
		return vo;
	}
	//핀포인트 찍었을때 cafeinfo모달
	@Override
	public CafeVo selectCafeInfo(String addr) throws Exception {
		CafeVo vo = cafeMapper.selectCafeInfo(addr);
		return vo;
	}

	@Override
	public int checkAddressInCafeInfo(String addr) throws Exception{
		int result = 0;
		int mapperResult = cafeMapper.findByAddr(addr);
		
		if(mapperResult == 1) {
			result = 1;
		}
		return result;
	}
	
	@Override
	public CafeMenuVo getCafeMenu(String addr) throws Exception {
		CafeMenuVo menuVo = cafeMapper.getCafeMenu(addr);
		
		if(menuVo != null) {
			menuVo.setMenuLists();
		}
		
		return menuVo;
	}

	@Override
	public boolean addCafeMenu(CafeMenuVo vo) throws Exception {
vo.setMenuInfos();
		
		log.info("service CafeMenuVo: {}", vo);
		
		String[] fileNames = vo.getMenupath().split(",");
		String[] fileOriginalNames = new String[fileNames.length];
		File[] saveFiles = new File[fileNames.length];
		StringBuilder names = new StringBuilder();
		
		for(int i = 0; i < fileNames.length; i ++) {
			UUID uuid = UUID.randomUUID();
			String fileOriginalName = uuid+"_"+fileNames[i];
			fileOriginalNames[i] = fileOriginalName;
			File saveFile = new File("C:\\eGovFrameDev-4.0.0-64bit\\workspace\\pz-1.0.0-lky\\src\\main\\webapp\\resources\\image\\"+fileOriginalName);
			saveFiles[i] = saveFile;
			if(i >= 1) {
				names.append(",");
			}
			names.append(fileOriginalName);
		}
		vo.setMenupath(names.toString());
		
		int mapperResult = cafeMapper.addCafeMenu(vo);
		
		if(mapperResult == 1) {
			for(int i = 0; i < fileNames.length; i ++) {
				if(i == 0) {
					vo.getMenuImage1().transferTo(saveFiles[i]);
				}
				if(i == 1) {
					vo.getMenuImage2().transferTo(saveFiles[i]);
				}
				if(i == 2) {
					vo.getMenuImage3().transferTo(saveFiles[i]);
				}
				if(i == 3) {
					vo.getMenuImage4().transferTo(saveFiles[i]);
				}
			}
			return true;
		}
		
		return false;
	}

	@Override
	public boolean updateCafeLikes(String addr) throws Exception {
		
		int mapperResult = cafeMapper.updateCafeLikes(addr);
		
		if(mapperResult == 1) return true;
		
		return false;
	}

	@Override
	public String getCafeInstaId(String addr) throws Exception {
	    String cafeInstaId = cafeMapper.getCafeInstaId(addr); // 데이터베이스 쿼리 메서드 호출

	    return cafeInstaId;
	}

	
}
