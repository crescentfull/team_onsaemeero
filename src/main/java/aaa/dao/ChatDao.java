package aaa.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import aaa.db.UserMapper;
import aaa.vo.ChatingVo;

@Component
public class ChatDao{

	@Resource
	UserMapper mapper;
	
	public void addMessage(String roomId, String writer, String body) {
		int newId = mapper.newidcnt(roomId)+1;
		ChatingVo cvo = new ChatingVo();
		cvo.setNewId(newId);
		cvo.setRoomId(roomId);
		cvo.setWriter(writer);
		cvo.setBody(body);
		
		System.out.println(newId+","+roomId+","+writer+","+body);
		
		int cnt=0;
		cnt = mapper.addMessage(cvo);
		System.out.println(cnt);
	}
	
	
	public List getMessagesFrom(String roomId, int from) {
		List<ChatingVo> totalmessages = mapper.getMessagesFrom(roomId);
		
		List<ChatingVo> messages = new ArrayList<>();
		
		for(ChatingVo vo : totalmessages) {
			if(vo.getRoomId().equals(roomId)&&vo.getNewId()>=from) {
				messages.add(vo);
			}
		}
		
		return messages;
	}

}
