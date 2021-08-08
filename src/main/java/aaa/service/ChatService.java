package aaa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import aaa.dao.ChatDao;

@Service
public class ChatService {
	
	@Autowired
	ChatDao chatDao;
	
	public void addMessage(String roomId, String writer, String body) {
		chatDao.addMessage(roomId, writer, body);
	}
	
	public List getMessagesFrom(String roomId, int from) {
		return chatDao.getMessagesFrom(roomId, from);
	}

}
