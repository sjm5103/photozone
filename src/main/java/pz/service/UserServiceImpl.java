package pz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import pz.mapper.UserMapper;
import pz.vo.UserVo;

@Service
@Slf4j
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserMapper userMapper;
	
	@Override
	public boolean signup(UserVo vo) throws Exception {
		String phone = vo.getPhoneNumber1()+"-"+vo.getPhoneNumber2()+"-"+vo.getPhoneNumber3();
		vo.setPhone(phone);
		
		String email = "";
		//이메일 도메인을 선택했는지 or 직접입력했는지에 따라
		if(vo.getEmailDomain() == null) {
			email = vo.getEmailId()+"@"+vo.getEmailCustomDomain();
		} else {
			email = vo.getEmailId()+"@"+vo.getEmailDomain();
		}
		vo.setEmail(email);
		
		boolean result = false;
		int mapperResult = userMapper.signup(vo);
		if(mapperResult == 1) {
			result = true;
		} else {
			result = false;
		}
		
		return result;
	}

	@Override
	public UserVo login(String userid, String pwd) throws Exception {
		return userMapper.login(userid, pwd);
	}

	@Override
	public UserVo sessionLogin(String userid) throws Exception {
		UserVo vo = userMapper.sessionLogin(userid);

		String[] emailSplit = vo.getEmail().split("@");
		vo.setEmailId(emailSplit[0]);
		vo.setEmailDomain(emailSplit[1]);
		
		String[] phoneSplit = vo.getPhone().split("-");
		vo.setPhoneNumber1(phoneSplit[0]);
		vo.setPhoneNumber2(phoneSplit[1]);
		vo.setPhoneNumber3(phoneSplit[2]);
		
		return vo;
	}
	
	/**
	 * 유저 정보 업데이트
	 * 
	 * @author hi-guri
	 * @param vo
	 * @return
	 * 0: 업데이트 실패
	 * 1: 업데이트 성공
	 * 2: 비밀번호 불일치
	 * @throws Exception
	 */
	@Override
	public int updateUser(UserVo vo) throws Exception {
		int result = 0;
		
		UserVo sessionVo = sessionLogin(vo.getUserid());
		log.info("sessionVo: {}", sessionVo);
		if(!vo.getPwd().equals(sessionVo.getPwd())) {
			log.info("비밀번호 불일치: {}", 2);
			return 2;
		}
		
		String phone = vo.getPhoneNumber1()+"-"+vo.getPhoneNumber2()+"-"+vo.getPhoneNumber3();
		vo.setPhone(phone);
		String email = vo.getEmailId()+"@"+vo.getEmailDomain();
		vo.setEmail(email);
		
		if(vo.getChangePwd().isBlank()) {
			vo.setChangePwd(vo.getPwd());
		}
		
		result = userMapper.updateUser(vo);
		
		return result;
	}

	@Override
	public boolean idCheck(String userid) throws Exception {
		boolean result = false;
		int mapperResult = userMapper.idCheck(userid);
		
		if(mapperResult == 0) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean nicknameCheck(String nickname) throws Exception {
		boolean result = false;
		int mapperResult = userMapper.nicknameCheck(nickname);
		
		if(mapperResult == 0) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean deleteUser(String userid) throws Exception {
		int mapperResult = userMapper.deleteUser(userid);
		if(mapperResult == 1) return true;
		return false;
	}
	
}
